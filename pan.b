	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM NoSharedForks */
;
		
	case 3: // STATE 1
		goto R999;

	case 4: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 5: // STATE 1
		;
		((P1 *)_this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 7: // STATE 4
		;
		((P1 *)_this)->i = trpt->bup.oval;
		_m = unsend(now.fork[ Index(((P1 *)_this)->i, 4) ]);
		;
		goto R999;

	case 8: // STATE 10
		;
		((P1 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 11
		;
	/* 0 */	((P1 *)_this)->i = trpt->bup.oval;
		;
		;
		goto R999;

	case 10: // STATE 14
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 11: // STATE 15
		;
		((P1 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 20
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC phil */
;
		;
		
	case 14: // STATE 2
		;
	/* 0 */	((P0 *)_this)->inuse = trpt->bup.ovals[1];
		XX = 1;
		unrecv(now.fork[ Index(((P0 *)_this)->id, 4) ], XX-1, 0, ((int)((P0 *)_this)->inuse), 1);
		((P0 *)_this)->inuse = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 15: // STATE 3
		;
		now.held[ Index(((P0 *)_this)->id, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 5
		;
	/* 0 */	((P0 *)_this)->inuse = trpt->bup.ovals[1];
		XX = 1;
		unrecv(now.fork[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ], XX-1, 0, ((int)((P0 *)_this)->inuse), 1);
		((P0 *)_this)->inuse = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 17: // STATE 6
		;
		now.held[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 18: // STATE 9
		;
		now.held[ Index(((P0 *)_this)->id, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 11
		;
		_m = unsend(now.fork[ Index(((P0 *)_this)->id, 4) ]);
		;
		goto R999;

	case 20: // STATE 12
		;
		now.held[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 21: // STATE 14
		;
		_m = unsend(now.fork[ Index((((((P0 *)_this)->id+4)-1)%4), 4) ]);
		;
		goto R999;

	case 22: // STATE 18
		;
		p_restor(II);
		;
		;
		goto R999;
	}

