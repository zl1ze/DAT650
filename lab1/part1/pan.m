#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM task2 */
	case 3: // STATE 1 - _spin_nvr.tmp:4 - [(!(((statusA==ok)&&(statusB==ok))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][1] = 1;
		if (!( !(((now.statusA==14)&&(now.statusB==14)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 6 - _spin_nvr.tmp:6 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported6 = 0;
			if (verbose && !reported6)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported6 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported6 = 0;
			if (verbose && !reported6)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported6 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Intruder */
	case 5: // STATE 1 - NS6.pml:137 - [network?msg,_,data.key,data.content1,data.content2] (0:0:6 - 1)
		reached[2][1] = 1;
		if (boq != now.network) continue;
		if (q_len(now.network) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(6);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->msg;
		(trpt+1)->bup.ovals[1] = qrecv(now.network, XX-1, 1, 0);
		(trpt+1)->bup.ovals[2] = ((P2 *)_this)->data.key;
		(trpt+1)->bup.ovals[3] = ((P2 *)_this)->data.content1;
		(trpt+1)->bup.ovals[4] = ((P2 *)_this)->data.content2;
		;
		((P2 *)_this)->msg = qrecv(now.network, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Intruder:msg", ((P2 *)_this)->msg);
#endif
		;
		qrecv(now.network, XX-1, 1, 0);
		((P2 *)_this)->data.key = qrecv(now.network, XX-1, 2, 0);
#ifdef VAR_RANGES
		logval("Intruder:data.key", ((P2 *)_this)->data.key);
#endif
		;
		((P2 *)_this)->data.content1 = qrecv(now.network, XX-1, 3, 0);
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		((P2 *)_this)->data.content2 = qrecv(now.network, XX-1, 4, 1);
#ifdef VAR_RANGES
		logval("Intruder:data.content2", ((P2 *)_this)->data.content2);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.network);
			sprintf(simtmp, "%d", ((P2 *)_this)->msg); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P2 *)_this)->data.key); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P2 *)_this)->data.content1); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P2 *)_this)->data.content2); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.network))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		if (TstOnly) return 1; /* TT */
		/* dead 2: msg */  (trpt+1)->bup.ovals[5] = ((P2 *)_this)->msg;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->msg = 0;
		_m = 4; goto P999; /* 0 */
	case 6: // STATE 2 - NS6.pml:139 - [intercepted.key = data.key] (0:35:3 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->intercepted.key;
		((P2 *)_this)->intercepted.key = ((P2 *)_this)->data.key;
#ifdef VAR_RANGES
		logval("Intruder:intercepted.key", ((P2 *)_this)->intercepted.key);
#endif
		;
		/* merge: intercepted.content1 = data.content1(35, 3, 35) */
		reached[2][3] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->intercepted.content1;
		((P2 *)_this)->intercepted.content1 = ((P2 *)_this)->data.content1;
#ifdef VAR_RANGES
		logval("Intruder:intercepted.content1", ((P2 *)_this)->intercepted.content1);
#endif
		;
		/* merge: intercepted.content2 = data.content2(35, 4, 35) */
		reached[2][4] = 1;
		(trpt+1)->bup.ovals[2] = ((P2 *)_this)->intercepted.content2;
		((P2 *)_this)->intercepted.content2 = ((P2 *)_this)->data.content2;
#ifdef VAR_RANGES
		logval("Intruder:intercepted.content2", ((P2 *)_this)->intercepted.content2);
#endif
		;
		/* merge: .(goto)(0, 7, 35) */
		reached[2][7] = 1;
		;
		/* merge: .(goto)(0, 36, 35) */
		reached[2][36] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 7: // STATE 8 - NS6.pml:147 - [msg = msg1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][8] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->msg;
		((P2 *)_this)->msg = 12;
#ifdef VAR_RANGES
		logval("Intruder:msg", ((P2 *)_this)->msg);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 9 - NS6.pml:148 - [msg = msg2] (0:0:1 - 1)
		IfNotBlocked
		reached[2][9] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->msg;
		((P2 *)_this)->msg = 11;
#ifdef VAR_RANGES
		logval("Intruder:msg", ((P2 *)_this)->msg);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 10 - NS6.pml:149 - [msg = msg3] (0:0:1 - 1)
		IfNotBlocked
		reached[2][10] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->msg;
		((P2 *)_this)->msg = 10;
#ifdef VAR_RANGES
		logval("Intruder:msg", ((P2 *)_this)->msg);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 13 - NS6.pml:152 - [recpt = agentA] (0:0:1 - 1)
		IfNotBlocked
		reached[2][13] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->recpt;
		((P2 *)_this)->recpt = 7;
#ifdef VAR_RANGES
		logval("Intruder:recpt", ((P2 *)_this)->recpt);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 14 - NS6.pml:153 - [recpt = agentB] (0:0:1 - 1)
		IfNotBlocked
		reached[2][14] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->recpt;
		((P2 *)_this)->recpt = 6;
#ifdef VAR_RANGES
		logval("Intruder:recpt", ((P2 *)_this)->recpt);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 17 - NS6.pml:156 - [data.key = intercepted.key] (0:34:3 - 1)
		IfNotBlocked
		reached[2][17] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->data.key;
		((P2 *)_this)->data.key = ((P2 *)_this)->intercepted.key;
#ifdef VAR_RANGES
		logval("Intruder:data.key", ((P2 *)_this)->data.key);
#endif
		;
		/* merge: data.content1 = intercepted.content1(34, 18, 34) */
		reached[2][18] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = ((P2 *)_this)->intercepted.content1;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		/* merge: data.content2 = intercepted.content2(34, 19, 34) */
		reached[2][19] = 1;
		(trpt+1)->bup.ovals[2] = ((P2 *)_this)->data.content2;
		((P2 *)_this)->data.content2 = ((P2 *)_this)->intercepted.content2;
#ifdef VAR_RANGES
		logval("Intruder:data.content2", ((P2 *)_this)->data.content2);
#endif
		;
		/* merge: .(goto)(0, 33, 34) */
		reached[2][33] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 13: // STATE 20 - NS6.pml:160 - [data.content1 = agentA] (0:0:1 - 1)
		IfNotBlocked
		reached[2][20] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = 7;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 21 - NS6.pml:161 - [data.content1 = agentB] (0:0:1 - 1)
		IfNotBlocked
		reached[2][21] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = 6;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 22 - NS6.pml:162 - [data.content1 = agentI] (0:0:1 - 1)
		IfNotBlocked
		reached[2][22] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = 3;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 23 - NS6.pml:163 - [data.content1 = nonceI] (0:0:1 - 1)
		IfNotBlocked
		reached[2][23] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = 1;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 26 - NS6.pml:166 - [data.key = keyA] (0:34:2 - 1)
		IfNotBlocked
		reached[2][26] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->data.key;
		((P2 *)_this)->data.key = 9;
#ifdef VAR_RANGES
		logval("Intruder:data.key", ((P2 *)_this)->data.key);
#endif
		;
		/* merge: .(goto)(34, 30, 34) */
		reached[2][30] = 1;
		;
		/* merge: data.content2 = nonceI(34, 31, 34) */
		reached[2][31] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->data.content2;
		((P2 *)_this)->data.content2 = 1;
#ifdef VAR_RANGES
		logval("Intruder:data.content2", ((P2 *)_this)->data.content2);
#endif
		;
		/* merge: .(goto)(0, 33, 34) */
		reached[2][33] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 18: // STATE 27 - NS6.pml:167 - [data.key = keyB] (0:34:2 - 1)
		IfNotBlocked
		reached[2][27] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->data.key;
		((P2 *)_this)->data.key = 8;
#ifdef VAR_RANGES
		logval("Intruder:data.key", ((P2 *)_this)->data.key);
#endif
		;
		/* merge: .(goto)(34, 30, 34) */
		reached[2][30] = 1;
		;
		/* merge: data.content2 = nonceI(34, 31, 34) */
		reached[2][31] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->data.content2;
		((P2 *)_this)->data.content2 = 1;
#ifdef VAR_RANGES
		logval("Intruder:data.content2", ((P2 *)_this)->data.content2);
#endif
		;
		/* merge: .(goto)(0, 33, 34) */
		reached[2][33] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 19: // STATE 28 - NS6.pml:168 - [data.key = keyI] (0:34:2 - 1)
		IfNotBlocked
		reached[2][28] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->data.key;
		((P2 *)_this)->data.key = 2;
#ifdef VAR_RANGES
		logval("Intruder:data.key", ((P2 *)_this)->data.key);
#endif
		;
		/* merge: .(goto)(34, 30, 34) */
		reached[2][30] = 1;
		;
		/* merge: data.content2 = nonceI(34, 31, 34) */
		reached[2][31] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->data.content2;
		((P2 *)_this)->data.content2 = 1;
#ifdef VAR_RANGES
		logval("Intruder:data.content2", ((P2 *)_this)->data.content2);
#endif
		;
		/* merge: .(goto)(0, 33, 34) */
		reached[2][33] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 20: // STATE 31 - NS6.pml:170 - [data.content2 = nonceI] (0:34:1 - 4)
		IfNotBlocked
		reached[2][31] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content2;
		((P2 *)_this)->data.content2 = 1;
#ifdef VAR_RANGES
		logval("Intruder:data.content2", ((P2 *)_this)->data.content2);
#endif
		;
		/* merge: .(goto)(0, 33, 34) */
		reached[2][33] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 21: // STATE 34 - NS6.pml:172 - [network!msg,recpt,data.key,data.content1,data.content2] (0:0:0 - 3)
		IfNotBlocked
		reached[2][34] = 1;
		if (q_len(now.network))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.network);
		sprintf(simtmp, "%d", ((P2 *)_this)->msg); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P2 *)_this)->recpt); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P2 *)_this)->data.key); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P2 *)_this)->data.content1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P2 *)_this)->data.content2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.network, 0, ((P2 *)_this)->msg, ((P2 *)_this)->recpt, ((P2 *)_this)->data.key, ((P2 *)_this)->data.content1, ((P2 *)_this)->data.content2, 5);
		{ boq = now.network; };
		_m = 2; goto P999; /* 0 */
	case 22: // STATE 38 - NS6.pml:174 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][38] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Bob */
	case 23: // STATE 1 - NS6.pml:103 - [partnerB = agentA] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = now.partnerB;
		now.partnerB = 7;
#ifdef VAR_RANGES
		logval("partnerB", now.partnerB);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 2 - NS6.pml:104 - [pkey = keyA] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->pkey;
		((P1 *)_this)->pkey = 9;
#ifdef VAR_RANGES
		logval("Bob:pkey", ((P1 *)_this)->pkey);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 3 - NS6.pml:109 - [network?msg1,agentB,data.key,data.content1,data.content2] (0:0:3 - 1)
		reached[1][3] = 1;
		if (boq != now.network) continue;
		if (q_len(now.network) == 0) continue;

		XX=1;
		if (12 != qrecv(now.network, 0, 0, 0)) continue;
		if (6 != qrecv(now.network, 0, 1, 0)) continue;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->data.key;
		(trpt+1)->bup.ovals[1] = ((P1 *)_this)->data.content1;
		(trpt+1)->bup.ovals[2] = ((P1 *)_this)->data.content2;
		;
		((P1 *)_this)->data.key = qrecv(now.network, XX-1, 2, 0);
#ifdef VAR_RANGES
		logval("Bob:data.key", ((P1 *)_this)->data.key);
#endif
		;
		((P1 *)_this)->data.content1 = qrecv(now.network, XX-1, 3, 0);
#ifdef VAR_RANGES
		logval("Bob:data.content1", ((P1 *)_this)->data.content1);
#endif
		;
		((P1 *)_this)->data.content2 = qrecv(now.network, XX-1, 4, 1);
#ifdef VAR_RANGES
		logval("Bob:data.content2", ((P1 *)_this)->data.content2);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.network);
			sprintf(simtmp, "%d", 12); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P1 *)_this)->data.key); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P1 *)_this)->data.content1); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P1 *)_this)->data.content2); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.network))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 26: // STATE 4 - NS6.pml:118 - [pnonce = data.content2] (0:8:4 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->pnonce;
		((P1 *)_this)->pnonce = ((P1 *)_this)->data.content2;
#ifdef VAR_RANGES
		logval("Bob:pnonce", ((P1 *)_this)->pnonce);
#endif
		;
		/* merge: messageAB.key = pkey(8, 5, 8) */
		reached[1][5] = 1;
		(trpt+1)->bup.ovals[1] = ((P1 *)_this)->messageAB.key;
		((P1 *)_this)->messageAB.key = ((P1 *)_this)->pkey;
#ifdef VAR_RANGES
		logval("Bob:messageAB.key", ((P1 *)_this)->messageAB.key);
#endif
		;
		/* merge: messageAB.content1 = pnonce(8, 6, 8) */
		reached[1][6] = 1;
		(trpt+1)->bup.ovals[2] = ((P1 *)_this)->messageAB.content1;
		((P1 *)_this)->messageAB.content1 = ((P1 *)_this)->pnonce;
#ifdef VAR_RANGES
		logval("Bob:messageAB.content1", ((P1 *)_this)->messageAB.content1);
#endif
		;
		/* merge: messageAB.content2 = nonceB(8, 7, 8) */
		reached[1][7] = 1;
		(trpt+1)->bup.ovals[3] = ((P1 *)_this)->messageAB.content2;
		((P1 *)_this)->messageAB.content2 = 4;
#ifdef VAR_RANGES
		logval("Bob:messageAB.content2", ((P1 *)_this)->messageAB.content2);
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 27: // STATE 8 - NS6.pml:123 - [network!msg2,partnerB,messageAB.key,messageAB.content1,messageAB.content2] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		if (q_len(now.network))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.network);
		sprintf(simtmp, "%d", 11); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.partnerB); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.key); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.content1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.content2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.network, 0, 11, now.partnerB, ((P1 *)_this)->messageAB.key, ((P1 *)_this)->messageAB.content1, ((P1 *)_this)->messageAB.content2, 5);
		{ boq = now.network; };
		_m = 2; goto P999; /* 0 */
	case 28: // STATE 9 - NS6.pml:126 - [network?msg3,agentB,messageAB.key,messageAB.content1,messageAB.content2] (0:0:3 - 1)
		reached[1][9] = 1;
		if (boq != now.network) continue;
		if (q_len(now.network) == 0) continue;

		XX=1;
		if (10 != qrecv(now.network, 0, 0, 0)) continue;
		if (6 != qrecv(now.network, 0, 1, 0)) continue;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->messageAB.key;
		(trpt+1)->bup.ovals[1] = ((P1 *)_this)->messageAB.content1;
		(trpt+1)->bup.ovals[2] = ((P1 *)_this)->messageAB.content2;
		;
		((P1 *)_this)->messageAB.key = qrecv(now.network, XX-1, 2, 0);
#ifdef VAR_RANGES
		logval("Bob:messageAB.key", ((P1 *)_this)->messageAB.key);
#endif
		;
		((P1 *)_this)->messageAB.content1 = qrecv(now.network, XX-1, 3, 0);
#ifdef VAR_RANGES
		logval("Bob:messageAB.content1", ((P1 *)_this)->messageAB.content1);
#endif
		;
		((P1 *)_this)->messageAB.content2 = qrecv(now.network, XX-1, 4, 1);
#ifdef VAR_RANGES
		logval("Bob:messageAB.content2", ((P1 *)_this)->messageAB.content2);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.network);
			sprintf(simtmp, "%d", 10); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.key); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.content1); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.content2); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.network))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 29: // STATE 10 - NS6.pml:130 - [statusB = ok] (0:0:1 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		(trpt+1)->bup.oval = now.statusB;
		now.statusB = 14;
#ifdef VAR_RANGES
		logval("statusB", now.statusB);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 11 - NS6.pml:131 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Alice */
	case 31: // STATE 1 - NS6.pml:26 - [i[0] = 97] (0:15:5 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->i[0]);
		((P0 *)_this)->i[0] = 97;
#ifdef VAR_RANGES
		logval("Alice:i[0]", ((int)((P0 *)_this)->i[0]));
#endif
		;
		/* merge: i[1] = 97(15, 2, 15) */
		reached[0][2] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->i[1]);
		((P0 *)_this)->i[1] = 97;
#ifdef VAR_RANGES
		logval("Alice:i[1]", ((int)((P0 *)_this)->i[1]));
#endif
		;
		/* merge: i[2] = 98(15, 3, 15) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->i[2]);
		((P0 *)_this)->i[2] = 98;
#ifdef VAR_RANGES
		logval("Alice:i[2]", ((int)((P0 *)_this)->i[2]));
#endif
		;
		/* merge: i[3] = 98(15, 4, 15) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->i[3]);
		((P0 *)_this)->i[3] = 98;
#ifdef VAR_RANGES
		logval("Alice:i[3]", ((int)((P0 *)_this)->i[3]));
#endif
		;
		/* merge: i[4] = 46(15, 5, 15) */
		reached[0][5] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P0 *)_this)->i[4]);
		((P0 *)_this)->i[4] = 46;
#ifdef VAR_RANGES
		logval("Alice:i[4]", ((int)((P0 *)_this)->i[4]));
#endif
		;
		_m = 3; goto P999; /* 4 */
	case 32: // STATE 6 - NS6.pml:32 - [((i[h]==97))] (15:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		if (!((((int)((P0 *)_this)->i[ Index(((int)((P0 *)_this)->h), 5) ])==97)))
			continue;
		/* merge: h = (h+1)(0, 7, 15) */
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->h);
		((P0 *)_this)->h = (((int)((P0 *)_this)->h)+1);
#ifdef VAR_RANGES
		logval("Alice:h", ((int)((P0 *)_this)->h));
#endif
		;
		/* merge: goto q0(0, 8, 15) */
		reached[0][8] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 33: // STATE 9 - NS6.pml:33 - [((i[h]==98))] (23:0:1 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (!((((int)((P0 *)_this)->i[ Index(((int)((P0 *)_this)->h), 5) ])==98)))
			continue;
		/* merge: h = (h+1)(0, 10, 23) */
		reached[0][10] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->h);
		((P0 *)_this)->h = (((int)((P0 *)_this)->h)+1);
#ifdef VAR_RANGES
		logval("Alice:h", ((int)((P0 *)_this)->h));
#endif
		;
		/* merge: goto q1(0, 11, 23) */
		reached[0][11] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 34: // STATE 12 - NS6.pml:34 - [((i[h]==98))] (33:0:1 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		if (!((((int)((P0 *)_this)->i[ Index(((int)((P0 *)_this)->h), 5) ])==98)))
			continue;
		/* merge: h = (h+1)(0, 13, 33) */
		reached[0][13] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->h);
		((P0 *)_this)->h = (((int)((P0 *)_this)->h)+1);
#ifdef VAR_RANGES
		logval("Alice:h", ((int)((P0 *)_this)->h));
#endif
		;
		/* merge: goto q3(0, 14, 33) */
		reached[0][14] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 35: // STATE 17 - NS6.pml:37 - [((i[h]==98))] (23:0:1 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		if (!((((int)((P0 *)_this)->i[ Index(((int)((P0 *)_this)->h), 5) ])==98)))
			continue;
		/* merge: h = (h+1)(0, 18, 23) */
		reached[0][18] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->h);
		((P0 *)_this)->h = (((int)((P0 *)_this)->h)+1);
#ifdef VAR_RANGES
		logval("Alice:h", ((int)((P0 *)_this)->h));
#endif
		;
		/* merge: goto q1(0, 19, 23) */
		reached[0][19] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 36: // STATE 20 - NS6.pml:38 - [((i[h]==46))] (25:0:1 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		if (!((((int)((P0 *)_this)->i[ Index(((int)((P0 *)_this)->h), 5) ])==46)))
			continue;
		/* merge: h = (h+1)(0, 21, 25) */
		reached[0][21] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->h);
		((P0 *)_this)->h = (((int)((P0 *)_this)->h)+1);
#ifdef VAR_RANGES
		logval("Alice:h", ((int)((P0 *)_this)->h));
#endif
		;
		/* merge: goto q2(0, 22, 25) */
		reached[0][22] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 37: // STATE 25 - NS6.pml:41 - [partnerA = agentB] (0:0:1 - 3)
		IfNotBlocked
		reached[0][25] = 1;
		(trpt+1)->bup.oval = now.partnerA;
		now.partnerA = 6;
#ifdef VAR_RANGES
		logval("partnerA", now.partnerA);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 26 - NS6.pml:42 - [pkey = keyB] (0:0:2 - 1)
		IfNotBlocked
		reached[0][26] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->pkey;
		((P0 *)_this)->pkey = 8;
#ifdef VAR_RANGES
		logval("Alice:pkey", ((P0 *)_this)->pkey);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: pkey */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->pkey = 0;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 27 - NS6.pml:44 - [((i[h]==98))] (33:0:1 - 1)
		IfNotBlocked
		reached[0][27] = 1;
		if (!((((int)((P0 *)_this)->i[ Index(((int)((P0 *)_this)->h), 5) ])==98)))
			continue;
		/* merge: h = (h+1)(0, 28, 33) */
		reached[0][28] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->h);
		((P0 *)_this)->h = (((int)((P0 *)_this)->h)+1);
#ifdef VAR_RANGES
		logval("Alice:h", ((int)((P0 *)_this)->h));
#endif
		;
		/* merge: goto q3(0, 29, 33) */
		reached[0][29] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 40: // STATE 30 - NS6.pml:45 - [((i[h]==46))] (35:0:2 - 1)
		IfNotBlocked
		reached[0][30] = 1;
		if (!((((int)((P0 *)_this)->i[ Index(((int)((P0 *)_this)->h), 5) ])==46)))
			continue;
		/* merge: h = (h+1)(0, 31, 35) */
		reached[0][31] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->h);
		((P0 *)_this)->h = (((int)((P0 *)_this)->h)+1);
#ifdef VAR_RANGES
		logval("Alice:h", ((int)((P0 *)_this)->h));
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: h */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->h = 0;
		/* merge: goto q4(0, 32, 35) */
		reached[0][32] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 41: // STATE 35 - NS6.pml:48 - [partnerA = agentI] (0:0:1 - 3)
		IfNotBlocked
		reached[0][35] = 1;
		(trpt+1)->bup.oval = now.partnerA;
		now.partnerA = 3;
#ifdef VAR_RANGES
		logval("partnerA", now.partnerA);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 42: // STATE 36 - NS6.pml:49 - [pkey = keyI] (0:40:4 - 1)
		IfNotBlocked
		reached[0][36] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->pkey;
		((P0 *)_this)->pkey = 2;
#ifdef VAR_RANGES
		logval("Alice:pkey", ((P0 *)_this)->pkey);
#endif
		;
		/* merge: messageAB.key = pkey(40, 37, 40) */
		reached[0][37] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->messageAB.key;
		((P0 *)_this)->messageAB.key = ((P0 *)_this)->pkey;
#ifdef VAR_RANGES
		logval("Alice:messageAB.key", ((P0 *)_this)->messageAB.key);
#endif
		;
		/* merge: messageAB.content1 = agentA(40, 38, 40) */
		reached[0][38] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->messageAB.content1;
		((P0 *)_this)->messageAB.content1 = 7;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content1", ((P0 *)_this)->messageAB.content1);
#endif
		;
		/* merge: messageAB.content2 = nonceA(40, 39, 40) */
		reached[0][39] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)_this)->messageAB.content2;
		((P0 *)_this)->messageAB.content2 = 5;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content2", ((P0 *)_this)->messageAB.content2);
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 43: // STATE 40 - NS6.pml:58 - [network!msg1,partnerA,messageAB.key,messageAB.content1,messageAB.content2] (0:0:0 - 1)
		IfNotBlocked
		reached[0][40] = 1;
		if (q_len(now.network))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.network);
		sprintf(simtmp, "%d", 12); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.partnerA); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.key); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.content1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.content2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.network, 0, 12, now.partnerA, ((P0 *)_this)->messageAB.key, ((P0 *)_this)->messageAB.content1, ((P0 *)_this)->messageAB.content2, 5);
		{ boq = now.network; };
		_m = 2; goto P999; /* 0 */
	case 44: // STATE 41 - NS6.pml:65 - [network?msg2,agentA,data.key,data.content1,data.content2] (0:0:3 - 1)
		reached[0][41] = 1;
		if (boq != now.network) continue;
		if (q_len(now.network) == 0) continue;

		XX=1;
		if (11 != qrecv(now.network, 0, 0, 0)) continue;
		if (7 != qrecv(now.network, 0, 1, 0)) continue;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->data.key;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->data.content1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->data.content2;
		;
		((P0 *)_this)->data.key = qrecv(now.network, XX-1, 2, 0);
#ifdef VAR_RANGES
		logval("Alice:data.key", ((P0 *)_this)->data.key);
#endif
		;
		((P0 *)_this)->data.content1 = qrecv(now.network, XX-1, 3, 0);
#ifdef VAR_RANGES
		logval("Alice:data.content1", ((P0 *)_this)->data.content1);
#endif
		;
		((P0 *)_this)->data.content2 = qrecv(now.network, XX-1, 4, 1);
#ifdef VAR_RANGES
		logval("Alice:data.content2", ((P0 *)_this)->data.content2);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.network);
			sprintf(simtmp, "%d", 11); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", 7); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P0 *)_this)->data.key); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P0 *)_this)->data.content1); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P0 *)_this)->data.content2); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.network))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 45: // STATE 42 - NS6.pml:71 - [(((data.key==keyA)&&(data.content1==nonceA)))] (47:0:4 - 1)
		IfNotBlocked
		reached[0][42] = 1;
		if (!(((((P0 *)_this)->data.key==9)&&(((P0 *)_this)->data.content1==5))))
			continue;
		/* merge: pnonce = data.content2(47, 43, 47) */
		reached[0][43] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->pnonce;
		((P0 *)_this)->pnonce = ((P0 *)_this)->data.content2;
#ifdef VAR_RANGES
		logval("Alice:pnonce", ((P0 *)_this)->pnonce);
#endif
		;
		/* merge: messageAB.key = pkey(47, 44, 47) */
		reached[0][44] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->messageAB.key;
		((P0 *)_this)->messageAB.key = ((P0 *)_this)->pkey;
#ifdef VAR_RANGES
		logval("Alice:messageAB.key", ((P0 *)_this)->messageAB.key);
#endif
		;
		/* merge: messageAB.content1 = pnonce(47, 45, 47) */
		reached[0][45] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->messageAB.content1;
		((P0 *)_this)->messageAB.content1 = ((P0 *)_this)->pnonce;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content1", ((P0 *)_this)->messageAB.content1);
#endif
		;
		/* merge: messageAB.content2 = 0(47, 46, 47) */
		reached[0][46] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)_this)->messageAB.content2;
		((P0 *)_this)->messageAB.content2 = 0;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content2", ((P0 *)_this)->messageAB.content2);
#endif
		;
		_m = 3; goto P999; /* 4 */
	case 46: // STATE 47 - NS6.pml:85 - [network!msg3,partnerA,messageAB.key,messageAB.content1,messageAB.content2] (0:0:0 - 1)
		IfNotBlocked
		reached[0][47] = 1;
		if (q_len(now.network))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.network);
		sprintf(simtmp, "%d", 10); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.partnerA); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.key); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.content1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.content2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.network, 0, 10, now.partnerA, ((P0 *)_this)->messageAB.key, ((P0 *)_this)->messageAB.content1, ((P0 *)_this)->messageAB.content2, 5);
		{ boq = now.network; };
		_m = 2; goto P999; /* 0 */
	case 47: // STATE 48 - NS6.pml:89 - [statusA = ok] (0:0:1 - 1)
		IfNotBlocked
		reached[0][48] = 1;
		(trpt+1)->bup.oval = now.statusA;
		now.statusA = 14;
#ifdef VAR_RANGES
		logval("statusA", now.statusA);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 48: // STATE 49 - NS6.pml:90 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][49] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

