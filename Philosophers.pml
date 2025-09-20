#define N 4

chan fork[N]= [1] of { bit }; // Channel with array of forks

int held[N]

proctype phil(int id) {
  bit inuse; // bit to set that fork is used
  do
    :: printf("Philosopher %d is thinking\n", id);
      fork[id] ? inuse; // Right fork
      atomic{
        held[id]++;
        assert(held[id] == 1)
      }
      fork[(id + N -1)%N] ? inuse; // Left fork
      atomic{
        held[(id + N -1)%N]++;
        assert(held[(id + N -1)%N] == 1)
      }

      printf("Philosopher %d is eating with forks %d and %d \n", id, id, (id + N -1)%N);
      atomic{
        held[id]--;
        assert(held[id] == 0)
      }
      fork[id] ! 1; // Drop right
      atomic{
        held[(id + N -1)%N]--;
        assert(held[(id + N -1)%N] == 0)
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

