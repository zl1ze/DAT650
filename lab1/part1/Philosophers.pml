#define N 4

chan fork[N]= [1] of { bit }; // Channel array of forks

int held[N];
int eating[N];

proctype phil(int id) {
  bit inuse;
  do
  :: printf("Philosopher %d is thinking\n", id);
  
     if
     :: id == 0 -> // Philosopher 0 is LEFT-HANDED
        fork[(id + N -1)%N] ? inuse; // Pick up LEFT fork first
        atomic { held[(id + N -1)%N]++; }
        fork[id] ? inuse;             // Then pick up RIGHT fork
        atomic { held[id]++; }
     :: else -> // The rest are RIGHT-HANDED
        fork[id] ? inuse;             // Pick up RIGHT fork first
        atomic { held[id]++; }
        fork[(id + N -1)%N] ? inuse;  // Then pick up LEFT fork
        atomic { held[(id + N -1)%N]++; }
     fi;

     printf("Philosopher %d is eating with forks %d and %d\n", id, id, (id + N -1)%N);

     atomic { eating[id]++; }
     atomic { eating[id]--; }

     // Release both forks
     atomic { held[id]--; }
     fork[id] ! 1; // Drop right
     atomic { held[(id + N -1)%N]--; }
     fork[(id + N -1)%N] ! 1; // Drop left

  od
}

init  {
  int i;

  atomic {
    i = 0;
    do
    :: i < N -> fork[i] ! 1; // Initialize forks
        i++
    :: else -> break
    od

    i = 0;
    do
    :: i < N -> run phil(i);
        i++
    :: else -> break
    od
  }
}

ltl NoSharedForks {
  [] (held[0] <= 1 && held[1] <= 1 && held[2] <= 1 && held[3] <= 1)
}

ltl EventuallyEats {
  []<> (eating[0] == 0 || eating[1] == 0 || eating[2] == 0 || eating[3] == 0)
}
