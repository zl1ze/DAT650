	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC T */

	case 3: // STATE 2
		;
		((P0 *)_this)->b = trpt->bup.ovals[1];
		((P0 *)_this)->a = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 4: // STATE 4
		;
		((P0 *)_this)->a = trpt->bup.oval;
		;
		goto R999;

	case 5: // STATE 6
		;
		((P0 *)_this)->b = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 7
		;
	/* 0 */	((P0 *)_this)->b = trpt->bup.oval;
		;
		;
		goto R999;
;
		
	case 7: // STATE 12
		goto R999;

	case 8: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;
	}

