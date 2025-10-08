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

	case 8: // STATE 7
		;
		((P2 *)_this)->intercepted.content3 = trpt->bup.ovals[3];
		((P2 *)_this)->intercepted.content2 = trpt->bup.ovals[2];
		((P2 *)_this)->intercepted.content1 = trpt->bup.ovals[1];
		((P2 *)_this)->intercepted.key = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;
;
		;
		;
		;
		
	case 11: // STATE 13
		;
		now.knows_nonceA = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 13: // STATE 15
		;
		now.knows_nonceB = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 15: // STATE 17
		;
		now.knows_nonceA = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 17: // STATE 19
		;
		now.knows_nonceB = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 19: // STATE 26
		;
		now.knows_nonceB = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 21: // STATE 28
		;
		now.knows_nonceA = trpt->bup.oval;
		;
		goto R999;

	case 22: // STATE 35
		;
		((P2 *)_this)->msg = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 36
		;
		((P2 *)_this)->msg = trpt->bup.oval;
		;
		goto R999;

	case 24: // STATE 37
		;
		((P2 *)_this)->msg = trpt->bup.oval;
		;
		goto R999;

	case 25: // STATE 40
		;
		((P2 *)_this)->recpt = trpt->bup.oval;
		;
		goto R999;

	case 26: // STATE 41
		;
		((P2 *)_this)->recpt = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 47
		;
		((P2 *)_this)->data.content3 = trpt->bup.ovals[3];
		((P2 *)_this)->data.content2 = trpt->bup.ovals[2];
		((P2 *)_this)->data.content1 = trpt->bup.ovals[1];
		((P2 *)_this)->data.key = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 28: // STATE 48
		;
		((P2 *)_this)->data.content1 = trpt->bup.oval;
		;
		goto R999;

	case 29: // STATE 49
		;
		((P2 *)_this)->data.content1 = trpt->bup.oval;
		;
		goto R999;

	case 30: // STATE 50
		;
		((P2 *)_this)->data.content1 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 32: // STATE 52
		;
		((P2 *)_this)->data.content1 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 34: // STATE 54
		;
		((P2 *)_this)->data.content1 = trpt->bup.oval;
		;
		goto R999;

	case 35: // STATE 57
		;
		((P2 *)_this)->data.key = trpt->bup.oval;
		;
		goto R999;

	case 36: // STATE 58
		;
		((P2 *)_this)->data.key = trpt->bup.oval;
		;
		goto R999;

	case 37: // STATE 59
		;
		((P2 *)_this)->data.key = trpt->bup.oval;
		;
		goto R999;

	case 38: // STATE 63
		;
		((P2 *)_this)->data.content2 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 40: // STATE 66
		;
		((P2 *)_this)->data.content2 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 42: // STATE 68
		;
		((P2 *)_this)->data.content2 = trpt->bup.oval;
		;
		goto R999;

	case 43: // STATE 70
		;
		((P2 *)_this)->data.content2 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 45: // STATE 76
		;
		((P2 *)_this)->data.content3 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 47: // STATE 78
		;
		((P2 *)_this)->data.content3 = trpt->bup.oval;
		;
		goto R999;

	case 48: // STATE 80
		;
		((P2 *)_this)->data.content3 = trpt->bup.oval;
		;
		goto R999;

	case 49: // STATE 85
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 50: // STATE 89
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Bob */

	case 51: // STATE 1
		;
		now.partnerB = trpt->bup.oval;
		;
		goto R999;

	case 52: // STATE 2
		;
		((P1 *)_this)->pkey = trpt->bup.oval;
		;
		goto R999;

	case 53: // STATE 3
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

	case 54: // STATE 8
		;
		((P1 *)_this)->messageAB.content3 = trpt->bup.ovals[4];
		((P1 *)_this)->messageAB.content2 = trpt->bup.ovals[3];
		((P1 *)_this)->messageAB.content1 = trpt->bup.ovals[2];
		((P1 *)_this)->messageAB.key = trpt->bup.ovals[1];
		((P1 *)_this)->pnonce = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;

	case 55: // STATE 9
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 56: // STATE 10
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

	case 57: // STATE 11
		;
		now.statusB = trpt->bup.oval;
		;
		goto R999;

	case 58: // STATE 12
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Alice */

	case 59: // STATE 1
		;
		now.partnerA = trpt->bup.oval;
		;
		goto R999;

	case 60: // STATE 9
		;
		((P0 *)_this)->messageAB.content2 = trpt->bup.ovals[3];
		((P0 *)_this)->messageAB.content1 = trpt->bup.ovals[2];
		((P0 *)_this)->messageAB.key = trpt->bup.ovals[1];
		((P0 *)_this)->pkey = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 61: // STATE 3
		;
		now.partnerA = trpt->bup.oval;
		;
		goto R999;

	case 62: // STATE 9
		;
		((P0 *)_this)->messageAB.content2 = trpt->bup.ovals[3];
		((P0 *)_this)->messageAB.content1 = trpt->bup.ovals[2];
		((P0 *)_this)->messageAB.key = trpt->bup.ovals[1];
		((P0 *)_this)->pkey = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 63: // STATE 9
		;
		((P0 *)_this)->messageAB.content2 = trpt->bup.ovals[2];
		((P0 *)_this)->messageAB.content1 = trpt->bup.ovals[1];
		((P0 *)_this)->messageAB.key = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 64: // STATE 10
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 65: // STATE 11
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
		
	case 67: // STATE 16
		;
		((P0 *)_this)->messageAB.content2 = trpt->bup.ovals[3];
		((P0 *)_this)->messageAB.content1 = trpt->bup.ovals[2];
		((P0 *)_this)->messageAB.key = trpt->bup.ovals[1];
		((P0 *)_this)->pnonce = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 68: // STATE 17
		;
		_m = unsend(now.network);
		;
		goto R999;

	case 69: // STATE 18
		;
		statusA = trpt->bup.oval;
		;
		goto R999;

	case 70: // STATE 19
		;
		p_restor(II);
		;
		;
		goto R999;
	}

