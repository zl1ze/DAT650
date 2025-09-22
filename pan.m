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
		reached[2][1] = 1;
		if (!( !(((now.statusA==11)&&(now.statusB==11)))))
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
		reached[2][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Bob */
	case 5: // STATE 1 - NS2.pml:84 - [partnerB = agentA] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = now.partnerB;
		now.partnerB = 4;
#ifdef VAR_RANGES
		logval("partnerB", now.partnerB);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 2 - NS2.pml:85 - [pkey = keyA] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->pkey;
		((P1 *)_this)->pkey = 6;
#ifdef VAR_RANGES
		logval("Bob:pkey", ((P1 *)_this)->pkey);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 3 - NS2.pml:90 - [network?msg1,agentB,data.key,data.content1,data.content2] (0:0:3 - 1)
		reached[1][3] = 1;
		if (boq != now.network) continue;
		if (q_len(now.network) == 0) continue;

		XX=1;
		if (9 != qrecv(now.network, 0, 0, 0)) continue;
		if (3 != qrecv(now.network, 0, 1, 0)) continue;
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
			sprintf(simtmp, "%d", 9); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);
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
	case 8: // STATE 4 - NS2.pml:99 - [pnonce = data.content2] (0:8:4 - 1)
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
		((P1 *)_this)->messageAB.content2 = 1;
#ifdef VAR_RANGES
		logval("Bob:messageAB.content2", ((P1 *)_this)->messageAB.content2);
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 9: // STATE 8 - NS2.pml:104 - [network!msg2,partnerB,messageAB.key,messageAB.content1,messageAB.content2] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		if (q_len(now.network))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.network);
		sprintf(simtmp, "%d", 8); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.partnerB); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.key); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.content1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.content2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.network, 0, 8, now.partnerB, ((P1 *)_this)->messageAB.key, ((P1 *)_this)->messageAB.content1, ((P1 *)_this)->messageAB.content2, 5);
		{ boq = now.network; };
		_m = 2; goto P999; /* 0 */
	case 10: // STATE 9 - NS2.pml:107 - [network?msg3,agentB,messageAB.key,messageAB.content1,messageAB.content2] (0:0:3 - 1)
		reached[1][9] = 1;
		if (boq != now.network) continue;
		if (q_len(now.network) == 0) continue;

		XX=1;
		if (7 != qrecv(now.network, 0, 0, 0)) continue;
		if (3 != qrecv(now.network, 0, 1, 0)) continue;
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
			sprintf(simtmp, "%d", 7); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);
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
	case 11: // STATE 10 - NS2.pml:111 - [statusB = ok] (0:0:1 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		(trpt+1)->bup.oval = now.statusB;
		now.statusB = 11;
#ifdef VAR_RANGES
		logval("statusB", now.statusB);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 11 - NS2.pml:112 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Alice */
	case 13: // STATE 1 - NS2.pml:28 - [partnerA = agentB] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = now.partnerA;
		now.partnerA = 3;
#ifdef VAR_RANGES
		logval("partnerA", now.partnerA);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 2 - NS2.pml:29 - [pkey = keyB] (0:6:4 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->pkey;
		((P0 *)_this)->pkey = 5;
#ifdef VAR_RANGES
		logval("Alice:pkey", ((P0 *)_this)->pkey);
#endif
		;
		/* merge: messageAB.key = pkey(6, 3, 6) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->messageAB.key;
		((P0 *)_this)->messageAB.key = ((P0 *)_this)->pkey;
#ifdef VAR_RANGES
		logval("Alice:messageAB.key", ((P0 *)_this)->messageAB.key);
#endif
		;
		/* merge: messageAB.content1 = agentA(6, 4, 6) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->messageAB.content1;
		((P0 *)_this)->messageAB.content1 = 4;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content1", ((P0 *)_this)->messageAB.content1);
#endif
		;
		/* merge: messageAB.content2 = nonceA(6, 5, 6) */
		reached[0][5] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)_this)->messageAB.content2;
		((P0 *)_this)->messageAB.content2 = 2;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content2", ((P0 *)_this)->messageAB.content2);
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 15: // STATE 6 - NS2.pml:39 - [network!msg1,partnerA,messageAB.key,messageAB.content1,messageAB.content2] (0:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		if (q_len(now.network))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.network);
		sprintf(simtmp, "%d", 9); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.partnerA); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.key); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.content1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.content2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.network, 0, 9, now.partnerA, ((P0 *)_this)->messageAB.key, ((P0 *)_this)->messageAB.content1, ((P0 *)_this)->messageAB.content2, 5);
		{ boq = now.network; };
		_m = 2; goto P999; /* 0 */
	case 16: // STATE 7 - NS2.pml:46 - [network?msg2,agentA,data.key,data.content1,data.content2] (0:0:3 - 1)
		reached[0][7] = 1;
		if (boq != now.network) continue;
		if (q_len(now.network) == 0) continue;

		XX=1;
		if (8 != qrecv(now.network, 0, 0, 0)) continue;
		if (4 != qrecv(now.network, 0, 1, 0)) continue;
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
			sprintf(simtmp, "%d", 8); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);
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
	case 17: // STATE 8 - NS2.pml:52 - [(((data.key==keyA)&&(data.content1==nonceA)))] (13:0:4 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (!(((((P0 *)_this)->data.key==6)&&(((P0 *)_this)->data.content1==2))))
			continue;
		/* merge: pnonce = data.content2(13, 9, 13) */
		reached[0][9] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->pnonce;
		((P0 *)_this)->pnonce = ((P0 *)_this)->data.content2;
#ifdef VAR_RANGES
		logval("Alice:pnonce", ((P0 *)_this)->pnonce);
#endif
		;
		/* merge: messageAB.key = pkey(13, 10, 13) */
		reached[0][10] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->messageAB.key;
		((P0 *)_this)->messageAB.key = ((P0 *)_this)->pkey;
#ifdef VAR_RANGES
		logval("Alice:messageAB.key", ((P0 *)_this)->messageAB.key);
#endif
		;
		/* merge: messageAB.content1 = pnonce(13, 11, 13) */
		reached[0][11] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->messageAB.content1;
		((P0 *)_this)->messageAB.content1 = ((P0 *)_this)->pnonce;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content1", ((P0 *)_this)->messageAB.content1);
#endif
		;
		/* merge: messageAB.content2 = 0(13, 12, 13) */
		reached[0][12] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)_this)->messageAB.content2;
		((P0 *)_this)->messageAB.content2 = 0;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content2", ((P0 *)_this)->messageAB.content2);
#endif
		;
		_m = 3; goto P999; /* 4 */
	case 18: // STATE 13 - NS2.pml:66 - [network!msg3,partnerA,messageAB.key,messageAB.content1,messageAB.content2] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (q_len(now.network))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.network);
		sprintf(simtmp, "%d", 7); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.partnerA); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.key); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.content1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.content2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.network, 0, 7, now.partnerA, ((P0 *)_this)->messageAB.key, ((P0 *)_this)->messageAB.content1, ((P0 *)_this)->messageAB.content2, 5);
		{ boq = now.network; };
		_m = 2; goto P999; /* 0 */
	case 19: // STATE 14 - NS2.pml:70 - [statusA = ok] (0:0:1 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.oval = now.statusA;
		now.statusA = 11;
#ifdef VAR_RANGES
		logval("statusA", now.statusA);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 15 - NS2.pml:71 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][15] = 1;
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

