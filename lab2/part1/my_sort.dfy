  twostate predicate sorted(a: array<int>, l: int, u: int)
    reads a
    {
      forall i, j :: 0 <= l <= i <= j < u <= a.Length ==> a[i] <= a[j]
    }

  twostate predicate Preserved(a: array<int>, left: nat, right: nat)
    reads a
    requires left <= right <= a.Length
  {
    multiset(a[left..right]) == multiset(old(a[left..right]))
  }

  method MySort(a: array<int>)
    modifies a
    //ensures sorted(a,0,a.Length)
    ensures Preserved(a,0,a.Length)
  {
    if a.Length == 0 {
      return;
    }
    var n := a.Length - 1;
    for i := 0 to a.Length
      invariant sorted(a,n,a.Length)
      invariant 0 <= n 
      invariant forall k, k' :: 0 <= k <= n < k' < a.Length ==> a[k] <= a[k']
      invariant Preserved(a,0,a.Length)
    {
      assert sorted(a,n,a.Length);
      assert n < a.Length;
      assert n >= 0;

      var minValue := a[i];
      var minPos := i;
      for j := i + 1 to a.Length
        invariant minPos < a.Length
        invariant a[minPos] == minValue
      {
        if a[j] < minValue {
          minValue := a[j];
          minPos := j;
        }
      }
      if i != minPos {
        a[i], a[minPos] := minValue, a[i];
      }
    }
  }
  