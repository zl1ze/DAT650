	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM EventuallyEats */
;
		;
		;
		;
		
	case 5: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM NoSharedForks */
;
		
	case 6: // STATE 1
		goto R999;

	case 7: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 8: // STATE 1
		;
		((P1 *)_this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 10: // STATE 4
		;
		((P1 *)_this)->i = trpt->bup.oval;
		_m = unsend(now.fork[ Index(((P1 *)_this)->i, 4) ]);
		;
		goto R999;

	case 11: // STATE 10
		;
		((P1 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 11
		;
	/* 0 */	((P1 *)_this)->i = trpt->bup.oval;
		;
		;
		goto R999;

	case 13: // STATE 14
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 14: // STATE 15
		;
		((P1 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 20
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC phil */
;
		;
		
	case 17: // STATE 2
		;
	/* 0 */	((P0 *)_this)->inuse = trpt->bup.ovals[1];
		XX = 1;
		unrecv(now.fork[ Index(((P0 *)_this)->id, 4) ], XX-1, 0, ((int)((P0 *)_this)->inuse), 1);
		((P0 *)_this)->inuse = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 18: // STATE 3
		;
		now.held[ Index(((P0 *)_this)->id, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 5
		;
	/* 0 */	((P0 *)_this)->inuse = trpt->bup.ovals[1];
		XX = 1;
		unrecv(now.fork[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ], XX-1, 0, ((int)((P0 *)_this)->inuse), 1);
		((P0 *)_this)->inuse = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 20: // STATE 6
		;
		now.held[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 21: // STATE 9
		;
		now.eating[ Index(((P0 *)_this)->id, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 22: // STATE 11
		;
		now.eating[ Index(((P0 *)_this)->id, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 13
		;
		now.held[ Index(((P0 *)_this)->id, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 24: // STATE 15
		;
		_m = unsend(now.fork[ Index(((P0 *)_this)->id, 4) ]);
		;
		goto R999;

	case 25: // STATE 16
		;
		now.held[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 26: // STATE 18
		;
		_m = unsend(now.fork[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ]);
		;
		goto R999;

	case 27: // STATE 22
		;
		p_restor(II);
		;
		;
		goto R999;
	}

