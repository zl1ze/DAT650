#define N 4

chan fork[N]= [1] of { bit }; // Channel with array of forks

int held[N]
int eating[N]

proctype phil(int id) {
  bit inuse; // bit to set that fork is used
  do
    :: printf("Philosopher %d is thinking\n", id);
      fork[id] ? inuse; // Right fork
      atomic{
        held[id]++;
      }
      fork[(id + N -1)%N] ? inuse; // Left fork
      atomic{
        held[(id + N -1)%N]++;
      }

      printf("Philosopher %d is eating with forks %d and %d \n", id, id, (id + N -1)%N);

      atomic{
        eating[id]++;
      }
      atomic{
        eating[id]--;
      }

      atomic{
        held[id]--;
      }
      fork[id] ! 1; // Drop right
      atomic{
        held[(id + N -1)%N]--;
      }
      fork[(id + N -1)%N] ! 1 // Drop left
  od
}

init  {
  int i;

  atomic{ // Only one run per atomic operation
    i = 0;
    do
    :: i < N -> fork[i] ! 1; // All forks need to be initialized
        i++
    :: else -> break
    od

    i = 0;
    do
    :: i >= N -> break
    :: else -> run phil(i);
	     i++
    od
  }
}

ltl NoSharedForks{
  [] (held[0] <= 1 && held[1] <= 1 && held[2] <= 1 && held[3] <= 1)
}

ltl EventuallyEats {
  []<> (eating[0] == 0 || eating[1] == 0 || eating[2] == 0 || eating[3] == 0)
}