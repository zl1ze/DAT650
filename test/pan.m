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

		 /* PROC T */
	case 3: // STATE 1 - test.pml:3 - [a = x] (0:9:2 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->a;
		((P0 *)_this)->a = ((P0 *)_this)->x;
#ifdef VAR_RANGES
		logval("T:a", ((P0 *)_this)->a);
#endif
		;
		/* merge: b = y(9, 2, 9) */
		reached[0][2] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->b;
		((P0 *)_this)->b = ((P0 *)_this)->y;
#ifdef VAR_RANGES
		logval("T:b", ((P0 *)_this)->b);
#endif
		;
		/* merge: .(goto)(0, 10, 9) */
		reached[0][10] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 4: // STATE 3 - test.pml:5 - [((a>b))] (9:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!((((P0 *)_this)->a>((P0 *)_this)->b)))
			continue;
		/* merge: a = (a-b)(0, 4, 9) */
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->a;
		((P0 *)_this)->a = (((P0 *)_this)->a-((P0 *)_this)->b);
#ifdef VAR_RANGES
		logval("T:a", ((P0 *)_this)->a);
#endif
		;
		/* merge: .(goto)(0, 10, 9) */
		reached[0][10] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 5: // STATE 5 - test.pml:6 - [((b>a))] (9:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((P0 *)_this)->b>((P0 *)_this)->a)))
			continue;
		/* merge: b = (b-a)(0, 6, 9) */
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->b;
		((P0 *)_this)->b = (((P0 *)_this)->b-((P0 *)_this)->a);
#ifdef VAR_RANGES
		logval("T:b", ((P0 *)_this)->b);
#endif
		;
		/* merge: .(goto)(0, 10, 9) */
		reached[0][10] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 6: // STATE 7 - test.pml:7 - [((a==b))] (13:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		if (!((((P0 *)_this)->a==((P0 *)_this)->b)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: b */  (trpt+1)->bup.oval = ((P0 *)_this)->b;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->b = 0;
		/* merge: goto :b0(13, 8, 13) */
		reached[0][8] = 1;
		;
		/* merge: printf('the GCD of %d and %d = %d\\n',x,y,a)(13, 12, 13) */
		reached[0][12] = 1;
		Printf("the GCD of %d and %d = %d\n", ((P0 *)_this)->x, ((P0 *)_this)->y, ((P0 *)_this)->a);
		_m = 3; goto P999; /* 2 */
	case 7: // STATE 12 - test.pml:9 - [printf('the GCD of %d and %d = %d\\n',x,y,a)] (0:13:0 - 3)
		IfNotBlocked
		reached[0][12] = 1;
		Printf("the GCD of %d and %d = %d\n", ((P0 *)_this)->x, ((P0 *)_this)->y, ((P0 *)_this)->a);
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 13 - test.pml:10 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
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

