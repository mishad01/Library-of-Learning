void main() {
  //   List<int> num = [1, 2, 3];
  //   print(num.length);
  //   print(num[0]);

  //   var a = [1, 2, 3];

  //   var b = <String>['a', 'b'];

  //   List<int> c = [];
  //   var d = <int>[];

  //   var e = List<int>.empty(growable: true);

  //   var l = [1, 2, 3];

  //   // Adding
  //   l.add(4); // [1, 2, 3, 4]
  //   l.addAll([5, 6]); // [1, 2, 3, 4, 5, 6]
  //   l.insert(0, 0); // [0, 1, 2, 3, 4, 5, 6]
  //   l.insertAll(1, [10, 11]); // insert multiple at index

  //   var list = ['a', 'b', 'c'];

  //   for (var i = 0; i < list.length; i++) {
  //     print(list[i]);
  //   }

  //   for (var item in list) {
  //     print(item);
  //   }

  //   print('--------------------');

  //   list.forEach((element) => print(element));

  //   print('--------------------');

  //   list.asMap().forEach((key, value) => print('$key  ---- $value'));

  var nums = [1, 2, 3, 4];
  var doubled = nums.map((e) => e * 2).toList();
  print(doubled);

  var evens = nums.where((x) => x.isEven).toList();
  print(evens);

  var pairs = nums.expand((x) => [x, x + 2]).toList();
  print(pairs);
  var mixed = [1, 'a', 2, 'b', 3];
  var onlyInts = mixed.whereType<String>().toList();
  print(onlyInts);

  var combined = [1, 2].followedBy([3, 4]).toList();
  print(combined);

  var nums2 = [1, 2, 18, 12, 78, 67, 99, 3, 4];
  nums2.skip(2).toList();
  print(nums2);

  var sum = nums.reduce((a, b) => a + b);
  print(sum);

  var max = nums.reduce((a, b) => a > b ? a : b);
  print(max);

  var total = nums.fold<int>(
    0,
    (previousValue, element) => previousValue + element,
  );
  print(total);
  //  nums2.sort();

  nums2.sort((a, b) => b.compareTo(a));

  print(nums2);
}
