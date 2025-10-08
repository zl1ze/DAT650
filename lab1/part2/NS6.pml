mtype = { ok, err, msg1, msg2, msg3, keyA, keyB, agentA, agentB,
          nonceA, nonceB, agentI, keyI, nonceI };

/* include content3 */
typedef Crypt { mtype key; mtype content1; mtype content2; mtype content3; }

chan network = [0] of { mtype, mtype, Crypt };

/* global variables for verification*/
mtype partnerA, partnerB;
mtype statusA = err;
mtype statusB = err;
bool knows_nonceA, knows_nonceB;

/* Agent (A)lice */
active proctype Alice() {
  mtype pkey;
  mtype pnonce;
  Crypt messageAB;
  Crypt data;

  /* Simple nondeterministic partner choice */
  if
  :: partnerA = agentB; pkey = keyB;
  :: partnerA = agentI; pkey = keyI;
  fi;

  /* Prepare and send first message */
  messageAB.key = pkey;
  messageAB.content1 = agentA;
  messageAB.content2 = nonceA;
  messageAB.content3 = 0;

  network ! msg1 (partnerA, messageAB);

  /* Wait for response msg2 destined to agentA */
  network ? (msg2, agentA, data);

  /* Proceed only if fields match expectations */
  (data.key == keyA) && (data.content1 == partnerA) && (data.content2 == nonceA);

  /* Bob's nonce is carried in content3 (Bob puts nonceB in content3) */
  pnonce = data.content3;

  /* Send back the final message carrying Bob's nonce */
  messageAB.key = pkey;
  messageAB.content1 = pnonce;
  messageAB.content2 = 0;
  messageAB.content3 = 0;

  network ! msg3 (partnerA, messageAB);

  statusA = ok;
}

/* Agent (B)ob */
active proctype Bob() {
  mtype pkey;
  mtype pnonce;
  Crypt messageAB;
  Crypt data;

  partnerB = agentA;
  pkey = keyA;

  /* Receive first message (from whoever claims to be A) */
  network ? (msg1, agentB, data);

  /* Obtain Alice's nonce from content2 */
  pnonce = data.content2;

  /* Prepare reply: include Bob's nonce in content3 */
  messageAB.key = pkey;          /* encrypt for Alice */
  messageAB.content1 = agentB;  /* Bob's identity */
  messageAB.content2 = pnonce;  /* nonceA */
  messageAB.content3 = nonceB;  /* Bob's nonce */

  network ! msg2 (partnerB, messageAB);

  /* Wait for final message */
  network ? (msg3, agentB, messageAB);

  statusB = ok;
}

/* Intruder */
active proctype Intruder() {
  mtype msg, recpt;
  Crypt data, intercepted;

  knows_nonceA = false;
  knows_nonceB = false;

  do
  :: /* Intercept any incoming message on the network */
     network ? (msg, _, data) ->

       /* store the intercepted packet (model abstraction) */
       intercepted.key = data.key;
       intercepted.content1 = data.content1;
       intercepted.content2 = data.content2;
       intercepted.content3 = data.content3;

       /* If "decryptable" for I's key, mark learned nonces.
          Also, regardless, record content3 as a possible source of info
          (this is the abstraction allowing the attack demonstration). */
       if
       :: intercepted.key == keyI ->
            if
            :: intercepted.content2 == nonceA -> knows_nonceA = true;
            :: intercepted.content2 == nonceB -> knows_nonceB = true;
            :: intercepted.content3 == nonceA -> knows_nonceA = true;
            :: intercepted.content3 == nonceB -> knows_nonceB = true;
            :: else -> skip;
            fi
       :: else ->
            /* even if encrypted for others, record content3 if it equals known nonces */
            if
            :: intercepted.content3 == nonceB -> knows_nonceB = true;
            :: intercepted.content3 == nonceA -> knows_nonceA = true;
            :: else -> skip;
            fi
       fi;

  :: /* Replay or send a crafted message */
     /* choose message type */
     if
     :: msg = msg1
     :: msg = msg2
     :: msg = msg3
     fi;

     /* choose recipient */
     if
     :: recpt = agentA
     :: recpt = agentB
     fi;

     /* Option 1: replay last intercepted packet */
     if
     :: /* replay */
        data.key = intercepted.key;
        data.content1 = intercepted.content1;
        data.content2 = intercepted.content2;
        data.content3 = intercepted.content3;
     :: /* Option 2: assemble a fresh packet (possibly inject known nonces) */
        /* choose content1 */
        if
        :: data.content1 = agentA
        :: data.content1 = agentB
        :: data.content1 = agentI
        :: (knows_nonceA) -> data.content1 = nonceA
        :: (knows_nonceB) -> data.content1 = nonceB
        fi;

        /* choose key */
        if
        :: data.key = keyA
        :: data.key = keyB
        :: data.key = keyI
        fi;

        /* content2: msg3 uses 0, others can carry a nonce or intruder nonce */
        if
        :: msg == msg3 -> data.content2 = 0
        :: else ->
            if
            :: (knows_nonceA) -> data.content2 = nonceA
            :: (knows_nonceB) -> data.content2 = nonceB
            :: else -> data.content2 = nonceI
            fi
        fi;

        /* content3: allow placing known nonces here (Bob uses content3 for nonceB) */
        if
        :: (knows_nonceB) -> data.content3 = nonceB
        :: (knows_nonceA) -> data.content3 = nonceA
        :: else -> data.content3 = nonceI
        fi
     fi;

     network ! msg (recpt, data);
  od
}

/* LTL properties */
ltl propB { []( (statusB==ok && partnerB==agentA) -> (!knows_nonceB) ) }
