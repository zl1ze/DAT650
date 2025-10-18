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
    ensures sorted(a,0,a.Length)
    ensures Preserved(a,0,a.Length)
  {
    for i := 0 to a.Length
      invariant 0 <= i <= a.Length
      invariant sorted(a,0,i)
      invariant forall k,j: nat :: 0 <= k < i <= j < a.Length ==> a[k] <= a[j]
      invariant Preserved(a,0,a.Length)
    {
      assert sorted(a,0,i);
      assert forall k, j :: 0 <= 0 <= k <= j < i <= a.Length ==> a[k] <= a[j];

      var minValue := a[i];
      var minPos := i;
      for j := i + 1 to a.Length
        invariant minPos < a.Length
        invariant a[minPos] == minValue
        invariant forall k: nat :: i <= k < j ==> minValue <= a[k]
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
  