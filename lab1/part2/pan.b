	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM propB */
;
		
	case 3: // STATE 1
		goto R999;

	case 4: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Intruder */

	case 5: // STATE 1
		;
		now.knows_nonceA = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 2
		;
		now.knows_nonceB = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 3
		;
	/* 0 */	((P2 *)_this)->msg = trpt->bup.ovals[6];
		XX = 1;
		unrecv(now.network, XX-1, 0, ((P2 *)_this)->msg, 1);
		unrecv(now.network, XX-1, 1, trpt->bup.ovals[1], 0);
		unrecv(now.network, XX-1, 2, ((P2 *)_this)->data.key, 0);
		unrecv(now.network, XX-1, 3, ((P2 *)_this)->data.content1, 0);
		unrecv(now.network, XX-1, 4, ((P2 *)_this)->data.content2, 0);
		unrecv(now.network, XX-1, 5, ((P2 *)_this)->data.content3, 0);
		((P2 *)_this)->msg = trpt->bup.ovals[0];
		((P2 *)_this)->data.key = trpt->bup.ovals[2];
		((P2 *)_this)->data.content1 = trpt->bup.ovals[3];
		((P2 *)_this)->data.content2 = trpt->bup.ovals[4];
		((P2 *)_this)->data.content3 = trpt->bup.ovals[5];
		;
		;
		ungrab_ints(trpt->bup.ovals, 7);
		goto R999;

	case 8: // STATE 6
		;
		((P2 *)_this)->intercepted.content2 = trpt->bup.ovals[2];
		((P2 *)_this)->intercepted.content1 = trpt->bup.ovals[1];
		((P2 *)_this)->intercepted.key = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		;
		;
		;
		
	case 11: // STATE 12
		;
		now.knows_nonceA = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 13: // STATE 14
		;
		now.knows_nonceB = trpt->bup.oval;
		;
		goto R999;

	case 14: // STATE 23
		;
		((P2 *)_this)->msg = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 24
		;
		((P2 *)_this)->msg = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 25
		;
		((P2 *)_this)->msg = trpt->bup.oval;
		;
		goto R999;

	case 17: // STATE 28
		;
		((P2 *)_this)->recpt = trpt->bup.oval;
		;
		goto R999;

	case 18: // STATE 29
		;
		((P2 *)_this)->recpt = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 34
		;
		((P2 *)_this)->data.content2 = trpt->bup.ovals[2];
		((P2 *)_this)->data.content1 = trpt->bup.ovals[1];
		((P2 *)_this)->data.key = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 20: // STATE 35
		;
		((P2 *)_this)->data.content1 = trpt->bup.oval;
		;
		goto R999;

	case 21: // STATE 36
		;
		((P2 *)_this)->data.content1 = trpt->bup.oval;
		;
		goto R999;

	case 22: // STATE 37
		;
		((P2 *)_this)->data.content1 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 24: // STATE 39
		;
		((P2 *)_this)->data.content1 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 26: // STATE 41
		;
		((P2 *)_this)->data.content1 = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 44
		;
		((P2 *)_this)->data.key = trpt->bup.oval;
		;
		goto R999;

	case 28: // STATE 45
		;
		((P2 *)_this)->data.key = trpt->bup.oval;
		;
		goto R999;

	case 29: // STATE 46
		;
		((P2 *)_this)->data.key = trpt->bup.oval;
		;
		goto R999;

	case 30: // STATE 50
		;
		((P2 *)_this)->data.content2 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 32: // STATE 53
		;
		((P2 *)_this)->data.content2 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 34: // STATE 55
		;
		((P2 *)_this)->data.content2 = trpt->bup.oval;
		;
		goto R999;

	case 35: // STATE 57
		;
		((P2 *)_this)->data.content2 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 37: // STATE 63
		;
		((P2 *)_this)->data.content3 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 39: // STATE 65
		;
		((P2 *)_this)->data.content3 = trpt->bup.oval;
		;
		goto R999;

	case 40: // STATE 67
		;
		((P2 *)_this)->data.content3 = trpt->bup.oval;
		;
		goto R999;

	case 41: // STATE 72
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 42: // STATE 76
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Bob */

	case 43: // STATE 1
		;
		now.partnerB = trpt->bup.oval;
		;
		goto R999;

	case 44: // STATE 2
		;
		((P1 *)_this)->pkey = trpt->bup.oval;
		;
		goto R999;

	case 45: // STATE 3
		;
		XX = 1;
		unrecv(now.network, XX-1, 0, 12, 1);
		unrecv(now.network, XX-1, 1, 6, 0);
		unrecv(now.network, XX-1, 2, ((P1 *)_this)->data.key, 0);
		unrecv(now.network, XX-1, 3, ((P1 *)_this)->data.content1, 0);
		unrecv(now.network, XX-1, 4, ((P1 *)_this)->data.content2, 0);
		unrecv(now.network, XX-1, 5, ((P1 *)_this)->data.content3, 0);
		((P1 *)_this)->data.key = trpt->bup.ovals[0];
		((P1 *)_this)->data.content1 = trpt->bup.ovals[1];
		((P1 *)_this)->data.content2 = trpt->bup.ovals[2];
		((P1 *)_this)->data.content3 = trpt->bup.ovals[3];
		;
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 46: // STATE 8
		;
		((P1 *)_this)->messageAB.content3 = trpt->bup.ovals[4];
		((P1 *)_this)->messageAB.content2 = trpt->bup.ovals[3];
		((P1 *)_this)->messageAB.content1 = trpt->bup.ovals[2];
		((P1 *)_this)->messageAB.key = trpt->bup.ovals[1];
		((P1 *)_this)->pnonce = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;

	case 47: // STATE 9
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 48: // STATE 10
		;
		XX = 1;
		unrecv(now.network, XX-1, 0, 10, 1);
		unrecv(now.network, XX-1, 1, 6, 0);
		unrecv(now.network, XX-1, 2, ((P1 *)_this)->messageAB.key, 0);
		unrecv(now.network, XX-1, 3, ((P1 *)_this)->messageAB.content1, 0);
		unrecv(now.network, XX-1, 4, ((P1 *)_this)->messageAB.content2, 0);
		unrecv(now.network, XX-1, 5, ((P1 *)_this)->messageAB.content3, 0);
		((P1 *)_this)->messageAB.key = trpt->bup.ovals[0];
		((P1 *)_this)->messageAB.content1 = trpt->bup.ovals[1];
		((P1 *)_this)->messageAB.content2 = trpt->bup.ovals[2];
		((P1 *)_this)->messageAB.content3 = trpt->bup.ovals[3];
		;
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 49: // STATE 11
		;
		now.statusB = trpt->bup.oval;
		;
		goto R999;

	case 50: // STATE 12
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Alice */

	case 51: // STATE 1
		;
		now.partnerA = trpt->bup.oval;
		;
		goto R999;

	case 52: // STATE 9
		;
		((P0 *)_this)->messageAB.content2 = trpt->bup.ovals[3];
		((P0 *)_this)->messageAB.content1 = trpt->bup.ovals[2];
		((P0 *)_this)->messageAB.key = trpt->bup.ovals[1];
		((P0 *)_this)->pkey = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 53: // STATE 3
		;
		now.partnerA = trpt->bup.oval;
		;
		goto R999;

	case 54: // STATE 9
		;
		((P0 *)_this)->messageAB.content2 = trpt->bup.ovals[3];
		((P0 *)_this)->messageAB.content1 = trpt->bup.ovals[2];
		((P0 *)_this)->messageAB.key = trpt->bup.ovals[1];
		((P0 *)_this)->pkey = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 55: // STATE 9
		;
		((P0 *)_this)->messageAB.content2 = trpt->bup.ovals[2];
		((P0 *)_this)->messageAB.content1 = trpt->bup.ovals[1];
		((P0 *)_this)->messageAB.key = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 56: // STATE 10
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 57: // STATE 11
		;
		XX = 1;
		unrecv(now.network, XX-1, 0, 11, 1);
		unrecv(now.network, XX-1, 1, 7, 0);
		unrecv(now.network, XX-1, 2, ((P0 *)_this)->data.key, 0);
		unrecv(now.network, XX-1, 3, ((P0 *)_this)->data.content1, 0);
		unrecv(now.network, XX-1, 4, ((P0 *)_this)->data.content2, 0);
		unrecv(now.network, XX-1, 5, ((P0 *)_this)->data.content3, 0);
		((P0 *)_this)->data.key = trpt->bup.ovals[0];
		((P0 *)_this)->data.content1 = trpt->bup.ovals[1];
		((P0 *)_this)->data.content2 = trpt->bup.ovals[2];
		((P0 *)_this)->data.content3 = trpt->bup.ovals[3];
		;
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;
;
		;
		
	case 59: // STATE 16
		;
		((P0 *)_this)->messageAB.content2 = trpt->bup.ovals[3];
		((P0 *)_this)->messageAB.content1 = trpt->bup.ovals[2];
		((P0 *)_this)->messageAB.key = trpt->bup.ovals[1];
		((P0 *)_this)->pnonce = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 60: // STATE 17
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 61: // STATE 18
		;
		statusA = trpt->bup.oval;
		;
		goto R999;

	case 62: // STATE 19
		;
		p_restor(II);
		;
		;
		goto R999;
	}

