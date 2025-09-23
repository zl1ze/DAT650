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

		 /* PROC Intruder */

	case 5: // STATE 1
		;
	/* 0 */	((P2 *)_this)->msg = trpt->bup.ovals[5];
		XX = 1;
		unrecv(now.network, XX-1, 0, ((P2 *)_this)->msg, 1);
		unrecv(now.network, XX-1, 1, trpt->bup.ovals[1], 0);
		unrecv(now.network, XX-1, 2, ((P2 *)_this)->data.key, 0);
		unrecv(now.network, XX-1, 3, ((P2 *)_this)->data.content1, 0);
		unrecv(now.network, XX-1, 4, ((P2 *)_this)->data.content2, 0);
		((P2 *)_this)->msg = trpt->bup.ovals[0];
		((P2 *)_this)->data.key = trpt->bup.ovals[2];
		((P2 *)_this)->data.content1 = trpt->bup.ovals[3];
		((P2 *)_this)->data.content2 = trpt->bup.ovals[4];
		;
		;
		ungrab_ints(trpt->bup.ovals, 6);
		goto R999;

	case 6: // STATE 4
		;
		((P2 *)_this)->intercepted.content2 = trpt->bup.ovals[2];
		((P2 *)_this)->intercepted.content1 = trpt->bup.ovals[1];
		((P2 *)_this)->intercepted.key = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 7: // STATE 8
		;
		((P2 *)_this)->msg = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 9
		;
		((P2 *)_this)->msg = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 10
		;
		((P2 *)_this)->msg = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 13
		;
		((P2 *)_this)->recpt = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 14
		;
		((P2 *)_this)->recpt = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 19
		;
		((P2 *)_this)->data.content2 = trpt->bup.ovals[2];
		((P2 *)_this)->data.content1 = trpt->bup.ovals[1];
		((P2 *)_this)->data.key = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 13: // STATE 20
		;
		((P2 *)_this)->data.content1 = trpt->bup.oval;
		;
		goto R999;

	case 14: // STATE 21
		;
		((P2 *)_this)->data.content1 = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 22
		;
		((P2 *)_this)->data.content1 = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 23
		;
		((P2 *)_this)->data.content1 = trpt->bup.oval;
		;
		goto R999;

	case 17: // STATE 31
		;
		((P2 *)_this)->data.content2 = trpt->bup.ovals[1];
		((P2 *)_this)->data.key = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 18: // STATE 31
		;
		((P2 *)_this)->data.content2 = trpt->bup.ovals[1];
		((P2 *)_this)->data.key = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 19: // STATE 31
		;
		((P2 *)_this)->data.content2 = trpt->bup.ovals[1];
		((P2 *)_this)->data.key = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 20: // STATE 31
		;
		((P2 *)_this)->data.content2 = trpt->bup.oval;
		;
		goto R999;

	case 21: // STATE 34
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 22: // STATE 38
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Bob */

	case 23: // STATE 1
		;
		now.partnerB = trpt->bup.oval;
		;
		goto R999;

	case 24: // STATE 2
		;
		((P1 *)_this)->pkey = trpt->bup.oval;
		;
		goto R999;

	case 25: // STATE 3
		;
		XX = 1;
		unrecv(now.network, XX-1, 0, 12, 1);
		unrecv(now.network, XX-1, 1, 6, 0);
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

	case 26: // STATE 7
		;
		((P1 *)_this)->messageAB.content2 = trpt->bup.ovals[3];
		((P1 *)_this)->messageAB.content1 = trpt->bup.ovals[2];
		((P1 *)_this)->messageAB.key = trpt->bup.ovals[1];
		((P1 *)_this)->pnonce = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 27: // STATE 8
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 28: // STATE 9
		;
		XX = 1;
		unrecv(now.network, XX-1, 0, 10, 1);
		unrecv(now.network, XX-1, 1, 6, 0);
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

	case 29: // STATE 10
		;
		now.statusB = trpt->bup.oval;
		;
		goto R999;

	case 30: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Alice */

	case 31: // STATE 5
		;
		((P0 *)_this)->i[4] = trpt->bup.ovals[4];
		((P0 *)_this)->i[3] = trpt->bup.ovals[3];
		((P0 *)_this)->i[2] = trpt->bup.ovals[2];
		((P0 *)_this)->i[1] = trpt->bup.ovals[1];
		((P0 *)_this)->i[0] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;

	case 32: // STATE 7
		;
		((P0 *)_this)->h = trpt->bup.oval;
		;
		goto R999;

	case 33: // STATE 10
		;
		((P0 *)_this)->h = trpt->bup.oval;
		;
		goto R999;

	case 34: // STATE 13
		;
		((P0 *)_this)->h = trpt->bup.oval;
		;
		goto R999;

	case 35: // STATE 18
		;
		((P0 *)_this)->h = trpt->bup.oval;
		;
		goto R999;

	case 36: // STATE 21
		;
		((P0 *)_this)->h = trpt->bup.oval;
		;
		goto R999;

	case 37: // STATE 25
		;
		now.partnerA = trpt->bup.oval;
		;
		goto R999;

	case 38: // STATE 26
		;
		((P0 *)_this)->pkey = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 39: // STATE 28
		;
		((P0 *)_this)->h = trpt->bup.oval;
		;
		goto R999;

	case 40: // STATE 31
		;
		((P0 *)_this)->h = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 41: // STATE 35
		;
		now.partnerA = trpt->bup.oval;
		;
		goto R999;

	case 42: // STATE 39
		;
		((P0 *)_this)->messageAB.content2 = trpt->bup.ovals[3];
		((P0 *)_this)->messageAB.content1 = trpt->bup.ovals[2];
		((P0 *)_this)->messageAB.key = trpt->bup.ovals[1];
		((P0 *)_this)->pkey = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 43: // STATE 40
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 44: // STATE 41
		;
		XX = 1;
		unrecv(now.network, XX-1, 0, 11, 1);
		unrecv(now.network, XX-1, 1, 7, 0);
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

	case 45: // STATE 46
		;
		((P0 *)_this)->messageAB.content2 = trpt->bup.ovals[3];
		((P0 *)_this)->messageAB.content1 = trpt->bup.ovals[2];
		((P0 *)_this)->messageAB.key = trpt->bup.ovals[1];
		((P0 *)_this)->pnonce = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 46: // STATE 47
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 47: // STATE 48
		;
		now.statusA = trpt->bup.oval;
		;
		goto R999;

	case 48: // STATE 49
		;
		p_restor(II);
		;
		;
		goto R999;
	}

