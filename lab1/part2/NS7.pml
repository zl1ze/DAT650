mtype = {ok, err, msg1, msg2, msg3, keyA, keyB, agentA, agentB,
	 nonceA, nonceB, agentI, keyI, nonceI };

// typedef Crypt { mtype key, content1, content2};
typedef Crypt { mtype key, content1, content2, content3 };

chan network = [0] of {mtype, /* msg# */
		       mtype, /* receiver */
		       Crypt
};

/* global variables for verification*/
mtype partnerA, partnerB;
mtype statusA = err;
mtype statusB = err;
bool knows_nonceA, knows_nonceB;

/* Agent (A)lice */
active proctype Alice() {
  /* local variables */

  mtype pkey;      /* the other agent's public key                 */
  mtype pnonce;    /* nonce that we receive from the other agent   */
  Crypt messageAB; /* our encrypted message to the other party     */
  Crypt data;      /* received encrypted message                   */
  byte h;
  if
  :: partnerA = agentB; pkey = keyB;
  :: partnerA = agentI; pkey = keyI;
  fi;
//   i[0] = 'a'; i[1] = 'a'; i[2] = 'b'; i[3] = 'b'; i[4] = '.'; 


//   /* Nondetermenistic algorithm for choosing partner  */
//    q0: if 
//       :: i[h] == 'a' -> h++; goto q0
//       :: i[h] == 'b' -> h++; goto q1 
//       :: i[h] == 'b' -> h++; goto q3
//       fi;
//    q1: if
//       :: i[h] == 'b' -> h++; goto q1
//       :: i[h] == '.' -> h++; goto q2 
//       fi;
//    q2: 
//       partnerA = agentB;
//       pkey     = keyB;
//    q3: if
//       :: i[h] == 'b' -> h++; goto q3
//       :: i[h] == '.' -> h++; goto q4 
//       fi;
//    q4: 
//       partnerA = agentI;
//       pkey     = keyI;
  /* Prepare the first message */

  messageAB.key = pkey;
  messageAB.content1 = agentA;
  messageAB.content2 = nonceA;

  /* Send the first message to the other party */

  network ! msg1 (partnerA, messageAB);

  /* Wait for an answer. Observe that we are pattern-matching on the
     messages that start with msg2 and agentA, that is, we block until 
     we see a message with values msg2 and agentA as the first and second  
     components. The third component is copied to the variable data. */

  network ? (msg2, agentA, data);

  /* We proceed only if the key field of the data matches keyA and the
     received nonce is the one that we have sent earlier; block
     otherwise.  */

  (data.key == keyA) && (data.content1 == partnerA) && (data.content2 == nonceA);

  /* Obtain Bob's nonce */

  pnonce = data.content2;

  /* Prepare the last message */
  messageAB.key = pkey;
  messageAB.content1 = pnonce;
  messageAB.content2 = 0;  /* content2 is not used in the last message,
                              just set it to 0 */


  /* Send the prepared messaage */
  network ! msg3 (partnerA, messageAB);


  /* and last - update the auxilary status variable */
  statusA = ok;
}

active proctype Bob() {
   /* local variables */

  mtype pkey;      /* the other agent's public key                 */
  mtype pnonce;    /* nonce that we receive from the other agent   */
  Crypt messageAB; /* our encrypted message to the other party     */
  Crypt data;      /* received encrypted message                   */


  /* Initialization  */

  partnerB = agentA;
  pkey     = keyA;


  /* Send the first message to the other party */

  network ? (msg1, agentB, data);

  /* Wait for an answer. Observe that we are pattern-matching on the
     messages that start with msg2 and agentA, that is, we block until 
     we see a message with values msg2 and agentA as the first and second  
     components. The third component is copied to the variable data. */

     /* Obtain Alices's nonce */

  pnonce = data.content2;
  messageAB.key      = pkey;       /* encrypt for Alice */
  messageAB.content1 = agentB;     /* Bob's identity */
  messageAB.content2 = pnonce;     /* nonceA */
  messageAB.content3 = nonceB;     /* Bob's nonce (if needed) */

  network ! msg2 (partnerB, messageAB);

  /* Receive the last messaage */
  network ? (msg3 ,agentB, messageAB);


  /* and last - update the auxilary status variable */
  statusB = ok;
}

active proctype Intruder() {
  mtype msg, recpt;
  Crypt data, intercepted;

  knows_nonceA = false;
  knows_nonceB = false;
  do
    :: network ? (msg, _, data) ->
       if /* perhaps store the message */
	 :: intercepted.key   = data.key;
	    intercepted.content1 = data.content1;
	    intercepted.content2 = data.content2;
      intercepted.content3 = data.content3;
	 :: skip;
       fi ;

       if /* check if intruder can decrypt */
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


    :: /* Replay or send a message */
       if /* choose message type */
	 :: msg = msg1;
	 :: msg = msg2;
	 :: msg = msg3;
       fi ;
       if /* choose a recepient */
	 :: recpt = agentA;
	 :: recpt = agentB;
       fi ;
       if /* replay intercepted message or assemble it */
	 :: data.key    = intercepted.key;
	    data.content1  = intercepted.content1;
	    data.content2  = intercepted.content2;
      data.content3 = intercepted.content3;

	 :: if /* assemble content1 */
	      :: data.content1 = agentA;
	      :: data.content1 = agentB;
	      :: data.content1 = agentI;
	      :: (knows_nonceA) -> data.content1 = nonceA;
	      :: (knows_nonceB) -> data.content1 = nonceB;
	    fi ;
	    if /* assemble key */
	      :: data.key = keyA;
	      :: data.key = keyB;
	      :: data.key = keyI;
	    fi ;
	    if
	      :: msg == msg3 -> data.content2 = 0;
        :: else ->
          if
            :: (knows_nonceA) -> data.content2 = nonceA
            :: (knows_nonceB) -> data.content2 = nonceB
            :: else -> data.content2 = nonceI
          fi
      fi;
      if
        :: (knows_nonceB) -> data.content3 = nonceB
        :: (knows_nonceA) -> data.content3 = nonceA
        :: else -> data.content3 = nonceI
        fi       
      fi ;
      network ! msg (recpt, data);
  od
}


// ltl task2 { <>((statusA == ok) && (statusB == ok)) }
// ltl propAB { []( (statusA==ok && statusB==ok) -> (partnerA==agentB && partnerB==agentA) ) }
// ltl propA { []( (statusA==ok && partnerA==agentB) -> (!knows_nonceA) ) }
ltl propB { []( (statusB==ok && partnerB==agentA) -> (!knows_nonceB) ) }
