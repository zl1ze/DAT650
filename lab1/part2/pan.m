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

		 /* CLAIM propB */
	case 3: // STATE 1 - _spin_nvr.tmp:3 - [(!((!(((statusB==ok)&&(partnerB==agentA)))||!(knows_nonceB))))] (6:0:0 - 1)
		
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
		if (!( !(( !(((now.statusB==14)&&(now.partnerB==7)))|| !(((int)now.knows_nonceB))))))
			continue;
		/* merge: assert(!(!((!(((statusB==ok)&&(partnerB==agentA)))||!(knows_nonceB)))))(0, 2, 6) */
		reached[3][2] = 1;
		spin_assert( !( !(( !(((now.statusB==14)&&(now.partnerB==7)))|| !(((int)now.knows_nonceB))))), " !( !(( !(((statusB==14)&&(partnerB==7)))|| !(knows_nonceB))))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[3][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 4: // STATE 10 - _spin_nvr.tmp:8 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Intruder */
	case 5: // STATE 1 - NS7.pml:165 - [knows_nonceA = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		(trpt+1)->bup.oval = ((int)now.knows_nonceA);
		now.knows_nonceA = 0;
#ifdef VAR_RANGES
		logval("knows_nonceA", ((int)now.knows_nonceA));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 2 - NS7.pml:166 - [knows_nonceB = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		(trpt+1)->bup.oval = ((int)now.knows_nonceB);
		now.knows_nonceB = 0;
#ifdef VAR_RANGES
		logval("knows_nonceB", ((int)now.knows_nonceB));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 3 - NS7.pml:168 - [network?msg,_,data.key,data.content1,data.content2,data.content3] (0:0:7 - 1)
		reached[2][3] = 1;
		if (boq != now.network) continue;
		if (q_len(now.network) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(7);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->msg;
		(trpt+1)->bup.ovals[1] = qrecv(now.network, XX-1, 1, 0);
		(trpt+1)->bup.ovals[2] = ((P2 *)_this)->data.key;
		(trpt+1)->bup.ovals[3] = ((P2 *)_this)->data.content1;
		(trpt+1)->bup.ovals[4] = ((P2 *)_this)->data.content2;
		(trpt+1)->bup.ovals[5] = ((P2 *)_this)->data.content3;
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
		((P2 *)_this)->data.content2 = qrecv(now.network, XX-1, 4, 0);
#ifdef VAR_RANGES
		logval("Intruder:data.content2", ((P2 *)_this)->data.content2);
#endif
		;
		((P2 *)_this)->data.content3 = qrecv(now.network, XX-1, 5, 1);
#ifdef VAR_RANGES
		logval("Intruder:data.content3", ((P2 *)_this)->data.content3);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.network);
		sprintf(simtmp, "%d", ((P2 *)_this)->msg); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P2 *)_this)->data.key); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P2 *)_this)->data.content1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P2 *)_this)->data.content2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P2 *)_this)->data.content3); strcat(simvals, simtmp);		}
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
		/* dead 2: msg */  (trpt+1)->bup.ovals[6] = ((P2 *)_this)->msg;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->msg = 0;
		_m = 4; goto P999; /* 0 */
	case 8: // STATE 4 - NS7.pml:170 - [intercepted.key = data.key] (0:21:3 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->intercepted.key;
		((P2 *)_this)->intercepted.key = ((P2 *)_this)->data.key;
#ifdef VAR_RANGES
		logval("Intruder:intercepted.key", ((P2 *)_this)->intercepted.key);
#endif
		;
		/* merge: intercepted.content1 = data.content1(21, 5, 21) */
		reached[2][5] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->intercepted.content1;
		((P2 *)_this)->intercepted.content1 = ((P2 *)_this)->data.content1;
#ifdef VAR_RANGES
		logval("Intruder:intercepted.content1", ((P2 *)_this)->intercepted.content1);
#endif
		;
		/* merge: intercepted.content2 = data.content2(21, 6, 21) */
		reached[2][6] = 1;
		(trpt+1)->bup.ovals[2] = ((P2 *)_this)->intercepted.content2;
		((P2 *)_this)->intercepted.content2 = ((P2 *)_this)->data.content2;
#ifdef VAR_RANGES
		logval("Intruder:intercepted.content2", ((P2 *)_this)->intercepted.content2);
#endif
		;
		/* merge: .(goto)(0, 9, 21) */
		reached[2][9] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 9: // STATE 10 - NS7.pml:177 - [((intercepted.key==keyI))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][10] = 1;
		if (!((((P2 *)_this)->intercepted.key==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 11 - NS7.pml:179 - [((intercepted.content2==nonceA))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][11] = 1;
		if (!((((P2 *)_this)->intercepted.content2==5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 12 - NS7.pml:179 - [knows_nonceA = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][12] = 1;
		(trpt+1)->bup.oval = ((int)now.knows_nonceA);
		now.knows_nonceA = 1;
#ifdef VAR_RANGES
		logval("knows_nonceA", ((int)now.knows_nonceA));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 13 - NS7.pml:180 - [((intercepted.content2==nonceB))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][13] = 1;
		if (!((((P2 *)_this)->intercepted.content2==4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 14 - NS7.pml:180 - [knows_nonceB = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][14] = 1;
		(trpt+1)->bup.oval = ((int)now.knows_nonceB);
		now.knows_nonceB = 1;
#ifdef VAR_RANGES
		logval("knows_nonceB", ((int)now.knows_nonceB));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 23 - NS7.pml:188 - [msg = msg1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][23] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->msg;
		((P2 *)_this)->msg = 12;
#ifdef VAR_RANGES
		logval("Intruder:msg", ((P2 *)_this)->msg);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 24 - NS7.pml:189 - [msg = msg2] (0:0:1 - 1)
		IfNotBlocked
		reached[2][24] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->msg;
		((P2 *)_this)->msg = 11;
#ifdef VAR_RANGES
		logval("Intruder:msg", ((P2 *)_this)->msg);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 25 - NS7.pml:190 - [msg = msg3] (0:0:1 - 1)
		IfNotBlocked
		reached[2][25] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->msg;
		((P2 *)_this)->msg = 10;
#ifdef VAR_RANGES
		logval("Intruder:msg", ((P2 *)_this)->msg);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 28 - NS7.pml:193 - [recpt = agentA] (0:0:1 - 1)
		IfNotBlocked
		reached[2][28] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->recpt;
		((P2 *)_this)->recpt = 7;
#ifdef VAR_RANGES
		logval("Intruder:recpt", ((P2 *)_this)->recpt);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 29 - NS7.pml:194 - [recpt = agentB] (0:0:1 - 1)
		IfNotBlocked
		reached[2][29] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->recpt;
		((P2 *)_this)->recpt = 6;
#ifdef VAR_RANGES
		logval("Intruder:recpt", ((P2 *)_this)->recpt);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 32 - NS7.pml:197 - [data.key = intercepted.key] (0:57:3 - 1)
		IfNotBlocked
		reached[2][32] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->data.key;
		((P2 *)_this)->data.key = ((P2 *)_this)->intercepted.key;
#ifdef VAR_RANGES
		logval("Intruder:data.key", ((P2 *)_this)->data.key);
#endif
		;
		/* merge: data.content1 = intercepted.content1(57, 33, 57) */
		reached[2][33] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = ((P2 *)_this)->intercepted.content1;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		/* merge: data.content2 = intercepted.content2(57, 34, 57) */
		reached[2][34] = 1;
		(trpt+1)->bup.ovals[2] = ((P2 *)_this)->data.content2;
		((P2 *)_this)->data.content2 = ((P2 *)_this)->intercepted.content2;
#ifdef VAR_RANGES
		logval("Intruder:data.content2", ((P2 *)_this)->data.content2);
#endif
		;
		/* merge: .(goto)(0, 56, 57) */
		reached[2][56] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 20: // STATE 35 - NS7.pml:202 - [data.content1 = agentA] (0:0:1 - 1)
		IfNotBlocked
		reached[2][35] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = 7;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 36 - NS7.pml:203 - [data.content1 = agentB] (0:0:1 - 1)
		IfNotBlocked
		reached[2][36] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = 6;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 37 - NS7.pml:204 - [data.content1 = agentI] (0:0:1 - 1)
		IfNotBlocked
		reached[2][37] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = 3;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 38 - NS7.pml:205 - [(knows_nonceA)] (0:0:0 - 1)
		IfNotBlocked
		reached[2][38] = 1;
		if (!(((int)now.knows_nonceA)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 39 - NS7.pml:205 - [data.content1 = nonceA] (0:0:1 - 1)
		IfNotBlocked
		reached[2][39] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = 5;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 40 - NS7.pml:206 - [(knows_nonceB)] (0:0:0 - 1)
		IfNotBlocked
		reached[2][40] = 1;
		if (!(((int)now.knows_nonceB)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 41 - NS7.pml:206 - [data.content1 = nonceB] (0:0:1 - 1)
		IfNotBlocked
		reached[2][41] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = 4;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 44 - NS7.pml:209 - [data.key = keyA] (0:0:1 - 1)
		IfNotBlocked
		reached[2][44] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.key;
		((P2 *)_this)->data.key = 9;
#ifdef VAR_RANGES
		logval("Intruder:data.key", ((P2 *)_this)->data.key);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 45 - NS7.pml:210 - [data.key = keyB] (0:0:1 - 1)
		IfNotBlocked
		reached[2][45] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.key;
		((P2 *)_this)->data.key = 8;
#ifdef VAR_RANGES
		logval("Intruder:data.key", ((P2 *)_this)->data.key);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 46 - NS7.pml:211 - [data.key = keyI] (0:0:1 - 1)
		IfNotBlocked
		reached[2][46] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.key;
		((P2 *)_this)->data.key = 2;
#ifdef VAR_RANGES
		logval("Intruder:data.key", ((P2 *)_this)->data.key);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 49 - NS7.pml:214 - [((msg==msg3))] (57:0:1 - 1)
		IfNotBlocked
		reached[2][49] = 1;
		if (!((((P2 *)_this)->msg==10)))
			continue;
		/* merge: data.content2 = 0(0, 50, 57) */
		reached[2][50] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content2;
		((P2 *)_this)->data.content2 = 0;
#ifdef VAR_RANGES
		logval("Intruder:data.content2", ((P2 *)_this)->data.content2);
#endif
		;
		/* merge: .(goto)(0, 54, 57) */
		reached[2][54] = 1;
		;
		/* merge: .(goto)(0, 56, 57) */
		reached[2][56] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 31: // STATE 52 - NS7.pml:215 - [data.content2 = nonceI] (0:0:1 - 1)
		IfNotBlocked
		reached[2][52] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content2;
		((P2 *)_this)->data.content2 = 1;
#ifdef VAR_RANGES
		logval("Intruder:data.content2", ((P2 *)_this)->data.content2);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 57 - NS7.pml:218 - [network!msg,recpt,data.key,data.content1,data.content2,data.content3] (0:0:0 - 5)
		IfNotBlocked
		reached[2][57] = 1;
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
		sprintf(simtmp, "%d", ((P2 *)_this)->data.content2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P2 *)_this)->data.content3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.network, 0, ((P2 *)_this)->msg, ((P2 *)_this)->recpt, ((P2 *)_this)->data.key, ((P2 *)_this)->data.content1, ((P2 *)_this)->data.content2, ((P2 *)_this)->data.content3, 6);
		{ boq = now.network; };
		_m = 2; goto P999; /* 0 */
	case 33: // STATE 61 - NS7.pml:220 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][61] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Bob */
	case 34: // STATE 1 - NS7.pml:130 - [partnerB = agentA] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = now.partnerB;
		now.partnerB = 7;
#ifdef VAR_RANGES
		logval("partnerB", now.partnerB);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 2 - NS7.pml:131 - [pkey = keyA] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->pkey;
		((P1 *)_this)->pkey = 9;
#ifdef VAR_RANGES
		logval("Bob:pkey", ((P1 *)_this)->pkey);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 3 - NS7.pml:136 - [network?msg1,agentB,data.key,data.content1,data.content2,data.content3] (0:0:4 - 1)
		reached[1][3] = 1;
		if (boq != now.network) continue;
		if (q_len(now.network) == 0) continue;

		XX=1;
		if (12 != qrecv(now.network, 0, 0, 0)) continue;
		if (6 != qrecv(now.network, 0, 1, 0)) continue;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->data.key;
		(trpt+1)->bup.ovals[1] = ((P1 *)_this)->data.content1;
		(trpt+1)->bup.ovals[2] = ((P1 *)_this)->data.content2;
		(trpt+1)->bup.ovals[3] = ((P1 *)_this)->data.content3;
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
		((P1 *)_this)->data.content2 = qrecv(now.network, XX-1, 4, 0);
#ifdef VAR_RANGES
		logval("Bob:data.content2", ((P1 *)_this)->data.content2);
#endif
		;
		((P1 *)_this)->data.content3 = qrecv(now.network, XX-1, 5, 1);
#ifdef VAR_RANGES
		logval("Bob:data.content3", ((P1 *)_this)->data.content3);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.network);
		sprintf(simtmp, "%d", 12); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->data.key); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->data.content1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->data.content2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->data.content3); strcat(simvals, simtmp);		}
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
	case 37: // STATE 4 - NS7.pml:145 - [pnonce = data.content2] (0:9:5 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->pnonce;
		((P1 *)_this)->pnonce = ((P1 *)_this)->data.content2;
#ifdef VAR_RANGES
		logval("Bob:pnonce", ((P1 *)_this)->pnonce);
#endif
		;
		/* merge: messageAB.key = pkey(9, 5, 9) */
		reached[1][5] = 1;
		(trpt+1)->bup.ovals[1] = ((P1 *)_this)->messageAB.key;
		((P1 *)_this)->messageAB.key = ((P1 *)_this)->pkey;
#ifdef VAR_RANGES
		logval("Bob:messageAB.key", ((P1 *)_this)->messageAB.key);
#endif
		;
		/* merge: messageAB.content1 = agentB(9, 6, 9) */
		reached[1][6] = 1;
		(trpt+1)->bup.ovals[2] = ((P1 *)_this)->messageAB.content1;
		((P1 *)_this)->messageAB.content1 = 6;
#ifdef VAR_RANGES
		logval("Bob:messageAB.content1", ((P1 *)_this)->messageAB.content1);
#endif
		;
		/* merge: messageAB.content2 = pnonce(9, 7, 9) */
		reached[1][7] = 1;
		(trpt+1)->bup.ovals[3] = ((P1 *)_this)->messageAB.content2;
		((P1 *)_this)->messageAB.content2 = ((P1 *)_this)->pnonce;
#ifdef VAR_RANGES
		logval("Bob:messageAB.content2", ((P1 *)_this)->messageAB.content2);
#endif
		;
		/* merge: messageAB.content3 = nonceB(9, 8, 9) */
		reached[1][8] = 1;
		(trpt+1)->bup.ovals[4] = ((P1 *)_this)->messageAB.content3;
		((P1 *)_this)->messageAB.content3 = 4;
#ifdef VAR_RANGES
		logval("Bob:messageAB.content3", ((P1 *)_this)->messageAB.content3);
#endif
		;
		_m = 3; goto P999; /* 4 */
	case 38: // STATE 9 - NS7.pml:151 - [network!msg2,partnerB,messageAB.key,messageAB.content1,messageAB.content2,messageAB.content3] (0:0:0 - 1)
		IfNotBlocked
		reached[1][9] = 1;
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
		sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.content2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.content3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.network, 0, 11, now.partnerB, ((P1 *)_this)->messageAB.key, ((P1 *)_this)->messageAB.content1, ((P1 *)_this)->messageAB.content2, ((P1 *)_this)->messageAB.content3, 6);
		{ boq = now.network; };
		_m = 2; goto P999; /* 0 */
	case 39: // STATE 10 - NS7.pml:154 - [network?msg3,agentB,messageAB.key,messageAB.content1,messageAB.content2,messageAB.content3] (0:0:4 - 1)
		reached[1][10] = 1;
		if (boq != now.network) continue;
		if (q_len(now.network) == 0) continue;

		XX=1;
		if (10 != qrecv(now.network, 0, 0, 0)) continue;
		if (6 != qrecv(now.network, 0, 1, 0)) continue;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->messageAB.key;
		(trpt+1)->bup.ovals[1] = ((P1 *)_this)->messageAB.content1;
		(trpt+1)->bup.ovals[2] = ((P1 *)_this)->messageAB.content2;
		(trpt+1)->bup.ovals[3] = ((P1 *)_this)->messageAB.content3;
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
		((P1 *)_this)->messageAB.content2 = qrecv(now.network, XX-1, 4, 0);
#ifdef VAR_RANGES
		logval("Bob:messageAB.content2", ((P1 *)_this)->messageAB.content2);
#endif
		;
		((P1 *)_this)->messageAB.content3 = qrecv(now.network, XX-1, 5, 1);
#ifdef VAR_RANGES
		logval("Bob:messageAB.content3", ((P1 *)_this)->messageAB.content3);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.network);
		sprintf(simtmp, "%d", 10); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.key); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.content1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.content2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->messageAB.content3); strcat(simvals, simtmp);		}
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
	case 40: // STATE 11 - NS7.pml:158 - [statusB = ok] (0:0:1 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		(trpt+1)->bup.oval = now.statusB;
		now.statusB = 14;
#ifdef VAR_RANGES
		logval("statusB", now.statusB);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 12 - NS7.pml:159 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Alice */
	case 42: // STATE 1 - NS7.pml:28 - [i[0] = 97] (0:15:5 - 1)
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
	case 43: // STATE 6 - NS7.pml:32 - [(((h<5)&&(i[h]==97)))] (15:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		if (!(((((int)((P0 *)_this)->h)<5)&&(((int)((P0 *)_this)->i[ Index(((int)((P0 *)_this)->h), 5) ])==97))))
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
	case 44: // STATE 9 - NS7.pml:33 - [(((h<5)&&(i[h]==98)))] (23:0:1 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (!(((((int)((P0 *)_this)->h)<5)&&(((int)((P0 *)_this)->i[ Index(((int)((P0 *)_this)->h), 5) ])==98))))
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
	case 45: // STATE 12 - NS7.pml:34 - [(((h<5)&&(i[h]==98)))] (33:0:1 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		if (!(((((int)((P0 *)_this)->h)<5)&&(((int)((P0 *)_this)->i[ Index(((int)((P0 *)_this)->h), 5) ])==98))))
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
	case 46: // STATE 17 - NS7.pml:38 - [(((h<5)&&(i[h]==98)))] (23:0:1 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		if (!(((((int)((P0 *)_this)->h)<5)&&(((int)((P0 *)_this)->i[ Index(((int)((P0 *)_this)->h), 5) ])==98))))
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
	case 47: // STATE 20 - NS7.pml:39 - [(((h<5)&&(i[h]==46)))] (25:0:1 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		if (!(((((int)((P0 *)_this)->h)<5)&&(((int)((P0 *)_this)->i[ Index(((int)((P0 *)_this)->h), 5) ])==46))))
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
	case 48: // STATE 25 - NS7.pml:43 - [partnerA = agentB] (0:0:1 - 3)
		IfNotBlocked
		reached[0][25] = 1;
		(trpt+1)->bup.oval = now.partnerA;
		now.partnerA = 6;
#ifdef VAR_RANGES
		logval("partnerA", now.partnerA);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 49: // STATE 26 - NS7.pml:44 - [pkey = keyB] (0:0:2 - 1)
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
	case 50: // STATE 27 - NS7.pml:47 - [(((h<5)&&(i[h]==98)))] (33:0:1 - 1)
		IfNotBlocked
		reached[0][27] = 1;
		if (!(((((int)((P0 *)_this)->h)<5)&&(((int)((P0 *)_this)->i[ Index(((int)((P0 *)_this)->h), 5) ])==98))))
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
	case 51: // STATE 30 - NS7.pml:48 - [(((h<5)&&(i[h]==46)))] (35:0:2 - 1)
		IfNotBlocked
		reached[0][30] = 1;
		if (!(((((int)((P0 *)_this)->h)<5)&&(((int)((P0 *)_this)->i[ Index(((int)((P0 *)_this)->h), 5) ])==46))))
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
	case 52: // STATE 35 - NS7.pml:52 - [partnerA = agentI] (0:0:1 - 3)
		IfNotBlocked
		reached[0][35] = 1;
		(trpt+1)->bup.oval = now.partnerA;
		now.partnerA = 3;
#ifdef VAR_RANGES
		logval("partnerA", now.partnerA);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 53: // STATE 36 - NS7.pml:53 - [pkey = keyI] (0:40:4 - 1)
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
	case 54: // STATE 40 - NS7.pml:85 - [network!msg1,partnerA,messageAB.key,messageAB.content1,messageAB.content2,messageAB.content3] (0:0:0 - 1)
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
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.content2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.content3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.network, 0, 12, now.partnerA, ((P0 *)_this)->messageAB.key, ((P0 *)_this)->messageAB.content1, ((P0 *)_this)->messageAB.content2, ((P0 *)_this)->messageAB.content3, 6);
		{ boq = now.network; };
		_m = 2; goto P999; /* 0 */
	case 55: // STATE 41 - NS7.pml:92 - [network?msg2,agentA,data.key,data.content1,data.content2,data.content3] (0:0:4 - 1)
		reached[0][41] = 1;
		if (boq != now.network) continue;
		if (q_len(now.network) == 0) continue;

		XX=1;
		if (11 != qrecv(now.network, 0, 0, 0)) continue;
		if (7 != qrecv(now.network, 0, 1, 0)) continue;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->data.key;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->data.content1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->data.content2;
		(trpt+1)->bup.ovals[3] = ((P0 *)_this)->data.content3;
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
		((P0 *)_this)->data.content2 = qrecv(now.network, XX-1, 4, 0);
#ifdef VAR_RANGES
		logval("Alice:data.content2", ((P0 *)_this)->data.content2);
#endif
		;
		((P0 *)_this)->data.content3 = qrecv(now.network, XX-1, 5, 1);
#ifdef VAR_RANGES
		logval("Alice:data.content3", ((P0 *)_this)->data.content3);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.network);
		sprintf(simtmp, "%d", 11); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 7); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->data.key); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->data.content1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->data.content2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->data.content3); strcat(simvals, simtmp);		}
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
	case 56: // STATE 42 - NS7.pml:98 - [((((data.key==keyA)&&(data.content1==partnerA))&&(data.content2==nonceA)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][42] = 1;
		if (!((((((P0 *)_this)->data.key==9)&&(((P0 *)_this)->data.content1==now.partnerA))&&(((P0 *)_this)->data.content2==5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 57: // STATE 43 - NS7.pml:102 - [pnonce = data.content2] (0:47:4 - 1)
		IfNotBlocked
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
		_m = 3; goto P999; /* 3 */
	case 58: // STATE 47 - NS7.pml:112 - [network!msg3,partnerA,messageAB.key,messageAB.content1,messageAB.content2,messageAB.content3] (0:0:0 - 1)
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
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.content2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->messageAB.content3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.network, 0, 10, now.partnerA, ((P0 *)_this)->messageAB.key, ((P0 *)_this)->messageAB.content1, ((P0 *)_this)->messageAB.content2, ((P0 *)_this)->messageAB.content3, 6);
		{ boq = now.network; };
		_m = 2; goto P999; /* 0 */
	case 59: // STATE 48 - NS7.pml:116 - [statusA = ok] (0:0:1 - 1)
		IfNotBlocked
		reached[0][48] = 1;
		(trpt+1)->bup.oval = statusA;
		statusA = 14;
#ifdef VAR_RANGES
		logval("statusA", statusA);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 60: // STATE 49 - NS7.pml:117 - [-end-] (0:0:0 - 1)
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

