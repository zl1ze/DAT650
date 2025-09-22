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

		 /* CLAIM EventuallyEats */
	case 3: // STATE 1 - _spin_nvr.tmp:12 - [(!(((((eating[0]==0)||(eating[1]==0))||(eating[2]==0))||(eating[3]==0))))] (0:0:0 - 1)
		
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
		if (!( !(((((now.eating[0]==0)||(now.eating[1]==0))||(now.eating[2]==0))||(now.eating[3]==0)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 8 - _spin_nvr.tmp:17 - [(!(((((eating[0]==0)||(eating[1]==0))||(eating[2]==0))||(eating[3]==0))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][8] = 1;
		if (!( !(((((now.eating[0]==0)||(now.eating[1]==0))||(now.eating[2]==0))||(now.eating[3]==0)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 13 - _spin_nvr.tmp:19 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM NoSharedForks */
	case 6: // STATE 1 - _spin_nvr.tmp:3 - [(!(((((held[0]<=1)&&(held[1]<=1))&&(held[2]<=1))&&(held[3]<=1))))] (6:0:0 - 1)
		
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
		if (!( !(((((now.held[0]<=1)&&(now.held[1]<=1))&&(now.held[2]<=1))&&(now.held[3]<=1)))))
			continue;
		/* merge: assert(!(!(((((held[0]<=1)&&(held[1]<=1))&&(held[2]<=1))&&(held[3]<=1)))))(0, 2, 6) */
		reached[2][2] = 1;
		spin_assert( !( !(((((now.held[0]<=1)&&(now.held[1]<=1))&&(now.held[2]<=1))&&(now.held[3]<=1)))), " !( !(((((held[0]<=1)&&(held[1]<=1))&&(held[2]<=1))&&(held[3]<=1))))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[2][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 7: // STATE 10 - _spin_nvr.tmp:8 - [-end-] (0:0:0 - 1)
		
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
		reached[2][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 8: // STATE 1 - Philosophers.pml:44 - [i = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->i;
		((P1 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((P1 *)_this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 2 - Philosophers.pml:46 - [((i<4))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!((((P1 *)_this)->i<4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 3 - Philosophers.pml:46 - [fork[i]!1] (7:0:1 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (q_full(now.fork[ Index(((P1 *)_this)->i, 4) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.fork[ Index(((P1 *)_this)->i, 4) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.fork[ Index(((P1 *)_this)->i, 4) ], 0, 1, 1);
		/* merge: i = (i+1)(0, 4, 7) */
		reached[1][4] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->i;
		((P1 *)_this)->i = (((P1 *)_this)->i+1);
#ifdef VAR_RANGES
		logval(":init::i", ((P1 *)_this)->i);
#endif
		;
		/* merge: .(goto)(0, 8, 7) */
		reached[1][8] = 1;
		;
		_m = 2; goto P999; /* 2 */
	case 11: // STATE 10 - Philosophers.pml:51 - [i = 0] (0:16:1 - 3)
		IfNotBlocked
		reached[1][10] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->i;
		((P1 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((P1 *)_this)->i);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[1][17] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 12: // STATE 11 - Philosophers.pml:53 - [((i>=4))] (18:0:1 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!((((P1 *)_this)->i>=4)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: i */  (trpt+1)->bup.oval = ((P1 *)_this)->i;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->i = 0;
		/* merge: goto :b2(0, 12, 18) */
		reached[1][12] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 13: // STATE 14 - Philosophers.pml:54 - [(run phil(i))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (!(addproc(II, 1, 0, ((P1 *)_this)->i)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 15 - Philosophers.pml:55 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][15] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->i;
		((P1 *)_this)->i = (((P1 *)_this)->i+1);
#ifdef VAR_RANGES
		logval(":init::i", ((P1 *)_this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 20 - Philosophers.pml:58 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC phil */
	case 16: // STATE 1 - Philosophers.pml:10 - [printf('Philosopher %d is thinking\\n',id)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		Printf("Philosopher %d is thinking\n", ((P0 *)_this)->id);
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 2 - Philosophers.pml:11 - [fork[id]?inuse] (0:0:2 - 1)
		reached[0][2] = 1;
		if (q_len(now.fork[ Index(((P0 *)_this)->id, 4) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->inuse);
		;
		((P0 *)_this)->inuse = qrecv(now.fork[ Index(((P0 *)_this)->id, 4) ], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("phil:inuse", ((int)((P0 *)_this)->inuse));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.fork[ Index(((P0 *)_this)->id, 4) ]);
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->inuse)); strcat(simvals, simtmp);		}
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: inuse */  (trpt+1)->bup.ovals[1] = ((P0 *)_this)->inuse;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->inuse = 0;
		_m = 4; goto P999; /* 0 */
	case 18: // STATE 3 - Philosophers.pml:13 - [held[id] = (held[id]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = now.held[ Index(((P0 *)_this)->id, 4) ];
		now.held[ Index(((P0 *)_this)->id, 4) ] = (now.held[ Index(((P0 *)_this)->id, 4) ]+1);
#ifdef VAR_RANGES
		logval("held[phil:id]", now.held[ Index(((P0 *)_this)->id, 4) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 5 - Philosophers.pml:15 - [fork[(((id+4)-1)%4)]?inuse] (0:0:2 - 1)
		reached[0][5] = 1;
		if (q_len(now.fork[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->inuse);
		;
		((P0 *)_this)->inuse = qrecv(now.fork[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("phil:inuse", ((int)((P0 *)_this)->inuse));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.fork[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ]);
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->inuse)); strcat(simvals, simtmp);		}
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: inuse */  (trpt+1)->bup.ovals[1] = ((P0 *)_this)->inuse;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->inuse = 0;
		_m = 4; goto P999; /* 0 */
	case 20: // STATE 6 - Philosophers.pml:17 - [held[(((id+4)-1)%4)] = (held[(((id+4)-1)%4)]+1)] (0:10:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = now.held[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ];
		now.held[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ] = (now.held[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ]+1);
#ifdef VAR_RANGES
		logval("held[(((phil:id+4)-1)%4)]", now.held[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ]);
#endif
		;
		/* merge: printf('Philosopher %d is eating with forks %d and %d \\n',id,id,(((id+4)-1)%4))(10, 8, 10) */
		reached[0][8] = 1;
		Printf("Philosopher %d is eating with forks %d and %d \n", ((P0 *)_this)->id, ((P0 *)_this)->id, (((((P0 *)_this)->id+4)-1)%4));
		_m = 3; goto P999; /* 1 */
	case 21: // STATE 9 - Philosophers.pml:23 - [eating[id] = (eating[id]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.oval = now.eating[ Index(((P0 *)_this)->id, 4) ];
		now.eating[ Index(((P0 *)_this)->id, 4) ] = (now.eating[ Index(((P0 *)_this)->id, 4) ]+1);
#ifdef VAR_RANGES
		logval("eating[phil:id]", now.eating[ Index(((P0 *)_this)->id, 4) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 11 - Philosophers.pml:26 - [eating[id] = (eating[id]-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		(trpt+1)->bup.oval = now.eating[ Index(((P0 *)_this)->id, 4) ];
		now.eating[ Index(((P0 *)_this)->id, 4) ] = (now.eating[ Index(((P0 *)_this)->id, 4) ]-1);
#ifdef VAR_RANGES
		logval("eating[phil:id]", now.eating[ Index(((P0 *)_this)->id, 4) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 13 - Philosophers.pml:30 - [held[id] = (held[id]-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		(trpt+1)->bup.oval = now.held[ Index(((P0 *)_this)->id, 4) ];
		now.held[ Index(((P0 *)_this)->id, 4) ] = (now.held[ Index(((P0 *)_this)->id, 4) ]-1);
#ifdef VAR_RANGES
		logval("held[phil:id]", now.held[ Index(((P0 *)_this)->id, 4) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 15 - Philosophers.pml:32 - [fork[id]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[0][15] = 1;
		if (q_full(now.fork[ Index(((P0 *)_this)->id, 4) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.fork[ Index(((P0 *)_this)->id, 4) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.fork[ Index(((P0 *)_this)->id, 4) ], 0, 1, 1);
		_m = 2; goto P999; /* 0 */
	case 25: // STATE 16 - Philosophers.pml:34 - [held[(((id+4)-1)%4)] = (held[(((id+4)-1)%4)]-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		(trpt+1)->bup.oval = now.held[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ];
		now.held[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ] = (now.held[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ]-1);
#ifdef VAR_RANGES
		logval("held[(((phil:id+4)-1)%4)]", now.held[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 18 - Philosophers.pml:36 - [fork[(((id+4)-1)%4)]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		if (q_full(now.fork[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.fork[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.fork[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ], 0, 1, 1);
		_m = 2; goto P999; /* 0 */
	case 27: // STATE 22 - Philosophers.pml:38 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][22] = 1;
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

