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
	case 5: // STATE 1 - NS6_2.pml:91 - [knows_nonceA = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		(trpt+1)->bup.oval = ((int)now.knows_nonceA);
		now.knows_nonceA = 0;
#ifdef VAR_RANGES
		logval("knows_nonceA", ((int)now.knows_nonceA));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 2 - NS6_2.pml:92 - [knows_nonceB = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		(trpt+1)->bup.oval = ((int)now.knows_nonceB);
		now.knows_nonceB = 0;
#ifdef VAR_RANGES
		logval("knows_nonceB", ((int)now.knows_nonceB));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 3 - NS6_2.pml:96 - [network?msg,_,data.key,data.content1,data.content2,data.content3] (0:0:7 - 1)
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
	case 8: // STATE 4 - NS6_2.pml:99 - [intercepted.key = data.key] (0:30:4 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->intercepted.key;
		((P2 *)_this)->intercepted.key = ((P2 *)_this)->data.key;
#ifdef VAR_RANGES
		logval("Intruder:intercepted.key", ((P2 *)_this)->intercepted.key);
#endif
		;
		/* merge: intercepted.content1 = data.content1(30, 5, 30) */
		reached[2][5] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->intercepted.content1;
		((P2 *)_this)->intercepted.content1 = ((P2 *)_this)->data.content1;
#ifdef VAR_RANGES
		logval("Intruder:intercepted.content1", ((P2 *)_this)->intercepted.content1);
#endif
		;
		/* merge: intercepted.content2 = data.content2(30, 6, 30) */
		reached[2][6] = 1;
		(trpt+1)->bup.ovals[2] = ((P2 *)_this)->intercepted.content2;
		((P2 *)_this)->intercepted.content2 = ((P2 *)_this)->data.content2;
#ifdef VAR_RANGES
		logval("Intruder:intercepted.content2", ((P2 *)_this)->intercepted.content2);
#endif
		;
		/* merge: intercepted.content3 = data.content3(30, 7, 30) */
		reached[2][7] = 1;
		(trpt+1)->bup.ovals[3] = ((P2 *)_this)->intercepted.content3;
		((P2 *)_this)->intercepted.content3 = ((P2 *)_this)->data.content3;
#ifdef VAR_RANGES
		logval("Intruder:intercepted.content3", ((P2 *)_this)->intercepted.content3);
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 9: // STATE 8 - NS6_2.pml:108 - [((intercepted.key==keyI))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][8] = 1;
		if (!((((P2 *)_this)->intercepted.key==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 9 - NS6_2.pml:110 - [((intercepted.content2==nonceA))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][9] = 1;
		if (!((((P2 *)_this)->intercepted.content2==5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 10 - NS6_2.pml:110 - [knows_nonceA = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][10] = 1;
		(trpt+1)->bup.oval = ((int)now.knows_nonceA);
		now.knows_nonceA = 1;
#ifdef VAR_RANGES
		logval("knows_nonceA", ((int)now.knows_nonceA));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 11 - NS6_2.pml:111 - [((intercepted.content2==nonceB))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][11] = 1;
		if (!((((P2 *)_this)->intercepted.content2==4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 12 - NS6_2.pml:111 - [knows_nonceB = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][12] = 1;
		(trpt+1)->bup.oval = ((int)now.knows_nonceB);
		now.knows_nonceB = 1;
#ifdef VAR_RANGES
		logval("knows_nonceB", ((int)now.knows_nonceB));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 13 - NS6_2.pml:112 - [((intercepted.content3==nonceA))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][13] = 1;
		if (!((((P2 *)_this)->intercepted.content3==5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 14 - NS6_2.pml:112 - [knows_nonceA = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][14] = 1;
		(trpt+1)->bup.oval = ((int)now.knows_nonceA);
		now.knows_nonceA = 1;
#ifdef VAR_RANGES
		logval("knows_nonceA", ((int)now.knows_nonceA));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 15 - NS6_2.pml:113 - [((intercepted.content3==nonceB))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][15] = 1;
		if (!((((P2 *)_this)->intercepted.content3==4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 16 - NS6_2.pml:113 - [knows_nonceB = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][16] = 1;
		(trpt+1)->bup.oval = ((int)now.knows_nonceB);
		now.knows_nonceB = 1;
#ifdef VAR_RANGES
		logval("knows_nonceB", ((int)now.knows_nonceB));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 22 - NS6_2.pml:119 - [((intercepted.content3==nonceB))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][22] = 1;
		if (!((((P2 *)_this)->intercepted.content3==4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 23 - NS6_2.pml:119 - [knows_nonceB = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][23] = 1;
		(trpt+1)->bup.oval = ((int)now.knows_nonceB);
		now.knows_nonceB = 1;
#ifdef VAR_RANGES
		logval("knows_nonceB", ((int)now.knows_nonceB));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 24 - NS6_2.pml:120 - [((intercepted.content3==nonceA))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][24] = 1;
		if (!((((P2 *)_this)->intercepted.content3==5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 25 - NS6_2.pml:120 - [knows_nonceA = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][25] = 1;
		(trpt+1)->bup.oval = ((int)now.knows_nonceA);
		now.knows_nonceA = 1;
#ifdef VAR_RANGES
		logval("knows_nonceA", ((int)now.knows_nonceA));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 32 - NS6_2.pml:128 - [msg = msg1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][32] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->msg;
		((P2 *)_this)->msg = 12;
#ifdef VAR_RANGES
		logval("Intruder:msg", ((P2 *)_this)->msg);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 33 - NS6_2.pml:129 - [msg = msg2] (0:0:1 - 1)
		IfNotBlocked
		reached[2][33] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->msg;
		((P2 *)_this)->msg = 11;
#ifdef VAR_RANGES
		logval("Intruder:msg", ((P2 *)_this)->msg);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 34 - NS6_2.pml:130 - [msg = msg3] (0:0:1 - 1)
		IfNotBlocked
		reached[2][34] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->msg;
		((P2 *)_this)->msg = 10;
#ifdef VAR_RANGES
		logval("Intruder:msg", ((P2 *)_this)->msg);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 37 - NS6_2.pml:135 - [recpt = agentA] (0:0:1 - 1)
		IfNotBlocked
		reached[2][37] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->recpt;
		((P2 *)_this)->recpt = 7;
#ifdef VAR_RANGES
		logval("Intruder:recpt", ((P2 *)_this)->recpt);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 38 - NS6_2.pml:136 - [recpt = agentB] (0:0:1 - 1)
		IfNotBlocked
		reached[2][38] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->recpt;
		((P2 *)_this)->recpt = 6;
#ifdef VAR_RANGES
		logval("Intruder:recpt", ((P2 *)_this)->recpt);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 41 - NS6_2.pml:142 - [data.key = intercepted.key] (0:80:4 - 1)
		IfNotBlocked
		reached[2][41] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->data.key;
		((P2 *)_this)->data.key = ((P2 *)_this)->intercepted.key;
#ifdef VAR_RANGES
		logval("Intruder:data.key", ((P2 *)_this)->data.key);
#endif
		;
		/* merge: data.content1 = intercepted.content1(80, 42, 80) */
		reached[2][42] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = ((P2 *)_this)->intercepted.content1;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		/* merge: data.content2 = intercepted.content2(80, 43, 80) */
		reached[2][43] = 1;
		(trpt+1)->bup.ovals[2] = ((P2 *)_this)->data.content2;
		((P2 *)_this)->data.content2 = ((P2 *)_this)->intercepted.content2;
#ifdef VAR_RANGES
		logval("Intruder:data.content2", ((P2 *)_this)->data.content2);
#endif
		;
		/* merge: data.content3 = intercepted.content3(80, 44, 80) */
		reached[2][44] = 1;
		(trpt+1)->bup.ovals[3] = ((P2 *)_this)->data.content3;
		((P2 *)_this)->data.content3 = ((P2 *)_this)->intercepted.content3;
#ifdef VAR_RANGES
		logval("Intruder:data.content3", ((P2 *)_this)->data.content3);
#endif
		;
		/* merge: .(goto)(0, 79, 80) */
		reached[2][79] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 28: // STATE 45 - NS6_2.pml:149 - [data.content1 = agentA] (0:0:1 - 1)
		IfNotBlocked
		reached[2][45] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = 7;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 46 - NS6_2.pml:150 - [data.content1 = agentB] (0:0:1 - 1)
		IfNotBlocked
		reached[2][46] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = 6;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 47 - NS6_2.pml:151 - [data.content1 = agentI] (0:0:1 - 1)
		IfNotBlocked
		reached[2][47] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = 3;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 48 - NS6_2.pml:152 - [(knows_nonceA)] (0:0:0 - 1)
		IfNotBlocked
		reached[2][48] = 1;
		if (!(((int)now.knows_nonceA)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 49 - NS6_2.pml:152 - [data.content1 = nonceA] (0:0:1 - 1)
		IfNotBlocked
		reached[2][49] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = 5;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 50 - NS6_2.pml:153 - [(knows_nonceB)] (0:0:0 - 1)
		IfNotBlocked
		reached[2][50] = 1;
		if (!(((int)now.knows_nonceB)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 51 - NS6_2.pml:153 - [data.content1 = nonceB] (0:0:1 - 1)
		IfNotBlocked
		reached[2][51] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content1;
		((P2 *)_this)->data.content1 = 4;
#ifdef VAR_RANGES
		logval("Intruder:data.content1", ((P2 *)_this)->data.content1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 54 - NS6_2.pml:158 - [data.key = keyA] (0:0:1 - 1)
		IfNotBlocked
		reached[2][54] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.key;
		((P2 *)_this)->data.key = 9;
#ifdef VAR_RANGES
		logval("Intruder:data.key", ((P2 *)_this)->data.key);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 55 - NS6_2.pml:159 - [data.key = keyB] (0:0:1 - 1)
		IfNotBlocked
		reached[2][55] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.key;
		((P2 *)_this)->data.key = 8;
#ifdef VAR_RANGES
		logval("Intruder:data.key", ((P2 *)_this)->data.key);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 56 - NS6_2.pml:160 - [data.key = keyI] (0:0:1 - 1)
		IfNotBlocked
		reached[2][56] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.key;
		((P2 *)_this)->data.key = 2;
#ifdef VAR_RANGES
		logval("Intruder:data.key", ((P2 *)_this)->data.key);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 59 - NS6_2.pml:165 - [((msg==msg3))] (76:0:1 - 1)
		IfNotBlocked
		reached[2][59] = 1;
		if (!((((P2 *)_this)->msg==10)))
			continue;
		/* merge: data.content2 = 0(0, 60, 76) */
		reached[2][60] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content2;
		((P2 *)_this)->data.content2 = 0;
#ifdef VAR_RANGES
		logval("Intruder:data.content2", ((P2 *)_this)->data.content2);
#endif
		;
		/* merge: .(goto)(0, 69, 76) */
		reached[2][69] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 39: // STATE 62 - NS6_2.pml:168 - [(knows_nonceA)] (0:0:0 - 1)
		IfNotBlocked
		reached[2][62] = 1;
		if (!(((int)now.knows_nonceA)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 63 - NS6_2.pml:168 - [data.content2 = nonceA] (0:0:1 - 1)
		IfNotBlocked
		reached[2][63] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content2;
		((P2 *)_this)->data.content2 = 5;
#ifdef VAR_RANGES
		logval("Intruder:data.content2", ((P2 *)_this)->data.content2);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 65 - NS6_2.pml:169 - [data.content2 = nonceI] (0:0:1 - 1)
		IfNotBlocked
		reached[2][65] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content2;
		((P2 *)_this)->data.content2 = 1;
#ifdef VAR_RANGES
		logval("Intruder:data.content2", ((P2 *)_this)->data.content2);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 42: // STATE 70 - NS6_2.pml:175 - [(knows_nonceB)] (0:0:0 - 1)
		IfNotBlocked
		reached[2][70] = 1;
		if (!(((int)now.knows_nonceB)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 71 - NS6_2.pml:175 - [data.content3 = nonceB] (0:0:1 - 1)
		IfNotBlocked
		reached[2][71] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content3;
		((P2 *)_this)->data.content3 = 4;
#ifdef VAR_RANGES
		logval("Intruder:data.content3", ((P2 *)_this)->data.content3);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 44: // STATE 72 - NS6_2.pml:176 - [(knows_nonceA)] (0:0:0 - 1)
		IfNotBlocked
		reached[2][72] = 1;
		if (!(((int)now.knows_nonceA)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 45: // STATE 73 - NS6_2.pml:176 - [data.content3 = nonceA] (0:0:1 - 1)
		IfNotBlocked
		reached[2][73] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content3;
		((P2 *)_this)->data.content3 = 5;
#ifdef VAR_RANGES
		logval("Intruder:data.content3", ((P2 *)_this)->data.content3);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 46: // STATE 75 - NS6_2.pml:177 - [data.content3 = nonceI] (0:0:1 - 1)
		IfNotBlocked
		reached[2][75] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->data.content3;
		((P2 *)_this)->data.content3 = 1;
#ifdef VAR_RANGES
		logval("Intruder:data.content3", ((P2 *)_this)->data.content3);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 47: // STATE 80 - NS6_2.pml:181 - [network!msg,recpt,data.key,data.content1,data.content2,data.content3] (0:0:0 - 6)
		IfNotBlocked
		reached[2][80] = 1;
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
	case 48: // STATE 84 - NS6_2.pml:183 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][84] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Bob */
	case 49: // STATE 1 - NS6_2.pml:63 - [partnerB = agentA] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = now.partnerB;
		now.partnerB = 7;
#ifdef VAR_RANGES
		logval("partnerB", now.partnerB);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 50: // STATE 2 - NS6_2.pml:64 - [pkey = keyA] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->pkey;
		((P1 *)_this)->pkey = 9;
#ifdef VAR_RANGES
		logval("Bob:pkey", ((P1 *)_this)->pkey);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 51: // STATE 3 - NS6_2.pml:67 - [network?msg1,agentB,data.key,data.content1,data.content2,data.content3] (0:0:4 - 1)
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
	case 52: // STATE 4 - NS6_2.pml:70 - [pnonce = data.content2] (0:9:5 - 1)
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
	case 53: // STATE 9 - NS6_2.pml:78 - [network!msg2,partnerB,messageAB.key,messageAB.content1,messageAB.content2,messageAB.content3] (0:0:0 - 1)
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
	case 54: // STATE 10 - NS6_2.pml:81 - [network?msg3,agentB,messageAB.key,messageAB.content1,messageAB.content2,messageAB.content3] (0:0:4 - 1)
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
	case 55: // STATE 11 - NS6_2.pml:83 - [statusB = ok] (0:0:1 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		(trpt+1)->bup.oval = now.statusB;
		now.statusB = 14;
#ifdef VAR_RANGES
		logval("statusB", now.statusB);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 56: // STATE 12 - NS6_2.pml:84 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Alice */
	case 57: // STATE 1 - NS6_2.pml:24 - [partnerA = agentB] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = now.partnerA;
		now.partnerA = 6;
#ifdef VAR_RANGES
		logval("partnerA", now.partnerA);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 58: // STATE 2 - NS6_2.pml:24 - [pkey = keyB] (0:11:5 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->pkey;
		((P0 *)_this)->pkey = 8;
#ifdef VAR_RANGES
		logval("Alice:pkey", ((P0 *)_this)->pkey);
#endif
		;
		/* merge: .(goto)(11, 6, 11) */
		reached[0][6] = 1;
		;
		/* merge: messageAB.key = pkey(11, 7, 11) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->messageAB.key;
		((P0 *)_this)->messageAB.key = ((P0 *)_this)->pkey;
#ifdef VAR_RANGES
		logval("Alice:messageAB.key", ((P0 *)_this)->messageAB.key);
#endif
		;
		/* merge: messageAB.content1 = agentA(11, 8, 11) */
		reached[0][8] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->messageAB.content1;
		((P0 *)_this)->messageAB.content1 = 7;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content1", ((P0 *)_this)->messageAB.content1);
#endif
		;
		/* merge: messageAB.content2 = nonceA(11, 9, 11) */
		reached[0][9] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)_this)->messageAB.content2;
		((P0 *)_this)->messageAB.content2 = 5;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content2", ((P0 *)_this)->messageAB.content2);
#endif
		;
		/* merge: messageAB.content3 = 0(11, 10, 11) */
		reached[0][10] = 1;
		(trpt+1)->bup.ovals[4] = ((P0 *)_this)->messageAB.content3;
		((P0 *)_this)->messageAB.content3 = 0;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content3", ((P0 *)_this)->messageAB.content3);
#endif
		;
		_m = 3; goto P999; /* 5 */
	case 59: // STATE 3 - NS6_2.pml:25 - [partnerA = agentI] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = now.partnerA;
		now.partnerA = 3;
#ifdef VAR_RANGES
		logval("partnerA", now.partnerA);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 60: // STATE 4 - NS6_2.pml:25 - [pkey = keyI] (0:11:5 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->pkey;
		((P0 *)_this)->pkey = 2;
#ifdef VAR_RANGES
		logval("Alice:pkey", ((P0 *)_this)->pkey);
#endif
		;
		/* merge: .(goto)(11, 6, 11) */
		reached[0][6] = 1;
		;
		/* merge: messageAB.key = pkey(11, 7, 11) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->messageAB.key;
		((P0 *)_this)->messageAB.key = ((P0 *)_this)->pkey;
#ifdef VAR_RANGES
		logval("Alice:messageAB.key", ((P0 *)_this)->messageAB.key);
#endif
		;
		/* merge: messageAB.content1 = agentA(11, 8, 11) */
		reached[0][8] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->messageAB.content1;
		((P0 *)_this)->messageAB.content1 = 7;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content1", ((P0 *)_this)->messageAB.content1);
#endif
		;
		/* merge: messageAB.content2 = nonceA(11, 9, 11) */
		reached[0][9] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)_this)->messageAB.content2;
		((P0 *)_this)->messageAB.content2 = 5;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content2", ((P0 *)_this)->messageAB.content2);
#endif
		;
		/* merge: messageAB.content3 = 0(11, 10, 11) */
		reached[0][10] = 1;
		(trpt+1)->bup.ovals[4] = ((P0 *)_this)->messageAB.content3;
		((P0 *)_this)->messageAB.content3 = 0;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content3", ((P0 *)_this)->messageAB.content3);
#endif
		;
		_m = 3; goto P999; /* 5 */
	case 61: // STATE 7 - NS6_2.pml:29 - [messageAB.key = pkey] (0:11:4 - 3)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->messageAB.key;
		((P0 *)_this)->messageAB.key = ((P0 *)_this)->pkey;
#ifdef VAR_RANGES
		logval("Alice:messageAB.key", ((P0 *)_this)->messageAB.key);
#endif
		;
		/* merge: messageAB.content1 = agentA(11, 8, 11) */
		reached[0][8] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->messageAB.content1;
		((P0 *)_this)->messageAB.content1 = 7;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content1", ((P0 *)_this)->messageAB.content1);
#endif
		;
		/* merge: messageAB.content2 = nonceA(11, 9, 11) */
		reached[0][9] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->messageAB.content2;
		((P0 *)_this)->messageAB.content2 = 5;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content2", ((P0 *)_this)->messageAB.content2);
#endif
		;
		/* merge: messageAB.content3 = 0(11, 10, 11) */
		reached[0][10] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)_this)->messageAB.content3;
		((P0 *)_this)->messageAB.content3 = 0;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content3", ((P0 *)_this)->messageAB.content3);
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 62: // STATE 11 - NS6_2.pml:34 - [network!msg1,partnerA,messageAB.key,messageAB.content1,messageAB.content2,messageAB.content3] (0:0:0 - 1)
		IfNotBlocked
		reached[0][11] = 1;
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
	case 63: // STATE 12 - NS6_2.pml:37 - [network?msg2,agentA,data.key,data.content1,data.content2,data.content3] (0:0:4 - 1)
		reached[0][12] = 1;
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
	case 64: // STATE 13 - NS6_2.pml:40 - [((((data.key==keyA)&&(data.content1==partnerA))&&(data.content2==nonceA)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (!((((((P0 *)_this)->data.key==9)&&(((P0 *)_this)->data.content1==now.partnerA))&&(((P0 *)_this)->data.content2==5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 65: // STATE 14 - NS6_2.pml:43 - [pnonce = data.content3] (0:19:5 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->pnonce;
		((P0 *)_this)->pnonce = ((P0 *)_this)->data.content3;
#ifdef VAR_RANGES
		logval("Alice:pnonce", ((P0 *)_this)->pnonce);
#endif
		;
		/* merge: messageAB.key = pkey(19, 15, 19) */
		reached[0][15] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->messageAB.key;
		((P0 *)_this)->messageAB.key = ((P0 *)_this)->pkey;
#ifdef VAR_RANGES
		logval("Alice:messageAB.key", ((P0 *)_this)->messageAB.key);
#endif
		;
		/* merge: messageAB.content1 = pnonce(19, 16, 19) */
		reached[0][16] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->messageAB.content1;
		((P0 *)_this)->messageAB.content1 = ((P0 *)_this)->pnonce;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content1", ((P0 *)_this)->messageAB.content1);
#endif
		;
		/* merge: messageAB.content2 = 0(19, 17, 19) */
		reached[0][17] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)_this)->messageAB.content2;
		((P0 *)_this)->messageAB.content2 = 0;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content2", ((P0 *)_this)->messageAB.content2);
#endif
		;
		/* merge: messageAB.content3 = 0(19, 18, 19) */
		reached[0][18] = 1;
		(trpt+1)->bup.ovals[4] = ((P0 *)_this)->messageAB.content3;
		((P0 *)_this)->messageAB.content3 = 0;
#ifdef VAR_RANGES
		logval("Alice:messageAB.content3", ((P0 *)_this)->messageAB.content3);
#endif
		;
		_m = 3; goto P999; /* 4 */
	case 66: // STATE 19 - NS6_2.pml:51 - [network!msg3,partnerA,messageAB.key,messageAB.content1,messageAB.content2,messageAB.content3] (0:0:0 - 1)
		IfNotBlocked
		reached[0][19] = 1;
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
	case 67: // STATE 20 - NS6_2.pml:53 - [statusA = ok] (0:0:1 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		(trpt+1)->bup.oval = statusA;
		statusA = 14;
#ifdef VAR_RANGES
		logval("statusA", statusA);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 68: // STATE 21 - NS6_2.pml:54 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][21] = 1;
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

