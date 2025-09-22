	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM task2 */
;
		;
		
	case 4: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Bob */

	case 5: // STATE 1
		;
		now.partnerB = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 2
		;
		((P1 *)_this)->pkey = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 3
		;
		XX = 1;
		unrecv(now.network, XX-1, 0, 9, 1);
		unrecv(now.network, XX-1, 1, 3, 0);
		unrecv(now.network, XX-1, 2, ((P1 *)_this)->data.key, 0);
		unrecv(now.network, XX-1, 3, ((P1 *)_this)->data.content1, 0);
		unrecv(now.network, XX-1, 4, ((P1 *)_this)->data.content2, 0);
		((P1 *)_this)->data.key = trpt->bup.ovals[0];
		((P1 *)_this)->data.content1 = trpt->bup.ovals[1];
		((P1 *)_this)->data.content2 = trpt->bup.ovals[2];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 8: // STATE 7
		;
		((P1 *)_this)->messageAB.content2 = trpt->bup.ovals[3];
		((P1 *)_this)->messageAB.content1 = trpt->bup.ovals[2];
		((P1 *)_this)->messageAB.key = trpt->bup.ovals[1];
		((P1 *)_this)->pnonce = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 9: // STATE 8
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 10: // STATE 9
		;
		XX = 1;
		unrecv(now.network, XX-1, 0, 7, 1);
		unrecv(now.network, XX-1, 1, 3, 0);
		unrecv(now.network, XX-1, 2, ((P1 *)_this)->messageAB.key, 0);
		unrecv(now.network, XX-1, 3, ((P1 *)_this)->messageAB.content1, 0);
		unrecv(now.network, XX-1, 4, ((P1 *)_this)->messageAB.content2, 0);
		((P1 *)_this)->messageAB.key = trpt->bup.ovals[0];
		((P1 *)_this)->messageAB.content1 = trpt->bup.ovals[1];
		((P1 *)_this)->messageAB.content2 = trpt->bup.ovals[2];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 11: // STATE 10
		;
		now.statusB = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Alice */

	case 13: // STATE 1
		;
		now.partnerA = trpt->bup.oval;
		;
		goto R999;

	case 14: // STATE 5
		;
		((P0 *)_this)->messageAB.content2 = trpt->bup.ovals[3];
		((P0 *)_this)->messageAB.content1 = trpt->bup.ovals[2];
		((P0 *)_this)->messageAB.key = trpt->bup.ovals[1];
		((P0 *)_this)->pkey = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 15: // STATE 6
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 16: // STATE 7
		;
		XX = 1;
		unrecv(now.network, XX-1, 0, 8, 1);
		unrecv(now.network, XX-1, 1, 4, 0);
		unrecv(now.network, XX-1, 2, ((P0 *)_this)->data.key, 0);
		unrecv(now.network, XX-1, 3, ((P0 *)_this)->data.content1, 0);
		unrecv(now.network, XX-1, 4, ((P0 *)_this)->data.content2, 0);
		((P0 *)_this)->data.key = trpt->bup.ovals[0];
		((P0 *)_this)->data.content1 = trpt->bup.ovals[1];
		((P0 *)_this)->data.content2 = trpt->bup.ovals[2];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 17: // STATE 12
		;
		((P0 *)_this)->messageAB.content2 = trpt->bup.ovals[3];
		((P0 *)_this)->messageAB.content1 = trpt->bup.ovals[2];
		((P0 *)_this)->messageAB.key = trpt->bup.ovals[1];
		((P0 *)_this)->pnonce = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 18: // STATE 13
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 19: // STATE 14
		;
		now.statusA = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 15
		;
		p_restor(II);
		;
		;
		goto R999;
	}

