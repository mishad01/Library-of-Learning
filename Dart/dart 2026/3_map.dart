void main() {
  Map<String, int> ages = {'Ann': 25, 'Bob': 30};
  print(ages['Ann']);
  print(ages.length);

  var a = {'one': 1, 'two': 2};

  var b = <String, int>{};
  Map<String, int> c = {};

  var d = Map<String, int>.from(a);
  var e = Map<String, int>.of(a);

  var f = Map.fromEntries([MapEntry('x', 1), MapEntry('y', 2)]);

  var g = Map<int, int>.fromIterable(
    [1, 2, 3],
    key: (element) => element,
    value: (element) => element,
  );
}
