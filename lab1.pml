#define N 4

proctype phil(int id) {
  do
    :: printf("thinking\n");
       /* ... */
       printf("eating\n");
       /* ... */
  od
}

init  {
  int i = 0;

  do
  :: i >= N -> break
  :: else -> run phil(i);
	     i++
  od
}

