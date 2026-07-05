# Dart `List` — From Basic to Advanced

A `List` is an ordered collection of objects, indexed from `0`. It is Dart's equivalent of an array. This guide covers everything from creating a list to advanced functional operations, performance, and gotchas.

---

## Table of Contents

1. [What is a List?](#1-what-is-a-list)
2. [Creating Lists](#2-creating-lists)
3. [Fixed-length vs Growable Lists](#3-fixed-length-vs-growable-lists)
4. [Accessing & Indexing](#4-accessing--indexing)
5. [Adding & Removing Elements](#5-adding--removing-elements)
6. [Searching & Checking](#6-searching--checking)
7. [Iterating](#7-iterating)
8. [Transforming: map, where, expand](#8-transforming-map-where-expand)
9. [Reducing: reduce, fold](#9-reducing-reduce-fold)
10. [Sorting](#10-sorting)
11. [Sublists, Ranges & Slicing](#11-sublists-ranges--slicing)
12. [Spread, Collection-if, Collection-for](#12-spread-collection-if-collection-for)
13. [Nested Lists & Matrices](#13-nested-lists--matrices)
14. [List of Objects](#14-list-of-objects)
15. [Immutability & const Lists](#15-immutability--const-lists)
16. [Copying: shallow vs deep](#16-copying-shallow-vs-deep)
17. [Null Safety with Lists](#17-null-safety-with-lists)
18. [Iterable vs List (lazy vs eager)](#18-iterable-vs-list-lazy-vs-eager)
19. [Performance & Big-O](#19-performance--big-o)
20. [Common Patterns & Recipes](#20-common-patterns--recipes)
21. [Gotchas](#21-gotchas)
22. [Full Method Reference](#22-full-method-reference)

---

## 1. What is a List?

- Ordered, index-based, allows duplicates.
- Backed by a growable array by default.
- Generic: `List<int>`, `List<String>`, `List<User>`.
- Implements `Iterable<E>`.

```dart
List<int> numbers = [1, 2, 3];
print(numbers.length); // 3
print(numbers[0]);     // 1
```

---

## 2. Creating Lists

```dart
// Literal (most common, growable)
var a = [1, 2, 3];

// Typed literal
var b = <String>['a', 'b'];

// Empty literal — always annotate the type
List<int> c = [];
var d = <int>[];

// List.empty (fixed-length by default; growable optional)
var e = List<int>.empty(growable: true);

// List.filled — n copies of the same value
var f = List<int>.filled(3, 0);      // [0, 0, 0]  (fixed-length)
var g = List<int>.filled(3, 0, growable: true);

// List.generate — build from an index function
var squares = List<int>.generate(5, (i) => i * i); // [0, 1, 4, 9, 16]

// List.from / List.of — copy another iterable
var h = List<int>.from([1, 2, 3]);
var i = List<int>.of([1, 2, 3]);     // preferred, type-safe

// List.unmodifiable — read-only view
var j = List<int>.unmodifiable([1, 2, 3]);
```

> **`List.of` vs `List.from`:** `of` is type-safe (`List.of<int>(...)`), `from` is looser and can downcast dynamic. Prefer `List.of`.

---

## 3. Fixed-length vs Growable Lists

```dart
var fixed = List<int>.filled(3, 0);  // fixed-length
fixed[0] = 9;                        // OK — you can mutate elements
fixed.add(4);                        // ❌ throws: Cannot add to a fixed-length list

var growable = <int>[];
growable.add(1);                     // OK
```

- Literals (`[]`) and `List.generate` are **growable** by default.
- `List.filled` and `List.empty` are **fixed-length** unless `growable: true`.

---

## 4. Accessing & Indexing

```dart
var list = ['a', 'b', 'c'];

list[0];            // 'a'
list.first;         // 'a'
list.last;          // 'c'
list.length;        // 3
list.isEmpty;       // false
list.isNotEmpty;    // true

list.elementAt(1);  // 'b' (works on any Iterable)
list.indexOf('b');  // 1
list.lastIndexOf('c'); // 2

// Safe access (avoid RangeError)
list.elementAtOrNull(10); // null  (Dart 3+)
list.firstOrNull;         // 'a'   (Dart 3+, or from package:collection)
list.lastOrNull;

// single — throws unless exactly one element
[42].single;        // 42
```

Out-of-range access throws `RangeError`:

```dart
list[99]; // ❌ RangeError
```

---

## 5. Adding & Removing Elements

```dart
var l = [1, 2, 3];

// Adding
l.add(4);                 // [1, 2, 3, 4]
l.addAll([5, 6]);         // [1, 2, 3, 4, 5, 6]
l.insert(0, 0);           // [0, 1, 2, 3, 4, 5, 6]
l.insertAll(1, [10, 11]); // insert multiple at index

// Removing
l.remove(10);             // removes first occurrence of value 10 -> returns bool
l.removeAt(0);            // remove by index -> returns removed element
l.removeLast();           // remove & return last
l.removeWhere((x) => x.isEven); // remove all matching
l.removeRange(0, 2);      // remove index [0,2)
l.retainWhere((x) => x > 3);    // keep only matching
l.clear();                // empty the list

// Replacing a range
var r = [1, 2, 3, 4, 5];
r.replaceRange(1, 3, [20, 30, 40]); // [1, 20, 30, 40, 4, 5]
r.setRange(0, 2, [100, 200]);       // overwrite in place
r.fillRange(0, 2, 0);               // fill range with a value
```

---

## 6. Searching & Checking

```dart
var nums = [1, 2, 3, 4, 5];

nums.contains(3);              // true
nums.indexOf(3);              // 2
nums.indexWhere((x) => x > 3); // 3 (first index matching)
nums.lastIndexWhere((x) => x.isEven); // 3

nums.any((x) => x > 4);       // true
nums.every((x) => x > 0);     // true

// firstWhere / lastWhere / singleWhere with orElse
nums.firstWhere((x) => x > 3);                 // 4
nums.firstWhere((x) => x > 10, orElse: () => -1); // -1 (avoids StateError)
nums.lastWhere((x) => x.isOdd);                // 5
```

> Without `orElse`, `firstWhere`/`lastWhere`/`singleWhere` throw `StateError` when nothing matches.

---

## 7. Iterating

```dart
var list = ['a', 'b', 'c'];

// for-in
for (var item in list) print(item);

// classic index loop
for (var i = 0; i < list.length; i++) print('$i: ${list[i]}');

// forEach
list.forEach((item) => print(item));

// with index (functional)
for (var (i, item) in list.indexed) {   // Dart 3 records
  print('$i -> $item');
}

// asMap gives an index->value Map
list.asMap().forEach((i, v) => print('$i: $v'));
```

> **Do not modify a list while iterating** with for-in / forEach — it throws `ConcurrentModificationError`. Collect changes first, or use `removeWhere`.

---

## 8. Transforming: map, where, expand

```dart
var nums = [1, 2, 3, 4];

// map — transform each element (returns lazy Iterable)
var doubled = nums.map((x) => x * 2).toList(); // [2, 4, 6, 8]

// where — filter
var evens = nums.where((x) => x.isEven).toList(); // [2, 4]

// expand / flatMap — map then flatten
var pairs = nums.expand((x) => [x, x]).toList(); // [1,1,2,2,3,3,4,4]

// whereType — filter by type
var mixed = [1, 'a', 2, 'b', 3];
var onlyInts = mixed.whereType<int>().toList(); // [1, 2, 3]

// followedBy — lazy concatenation
var combined = [1, 2].followedBy([3, 4]).toList(); // [1, 2, 3, 4]

// take / skip
nums.take(2).toList();      // [1, 2]
nums.skip(2).toList();      // [3, 4]
nums.takeWhile((x) => x < 3).toList(); // [1, 2]
nums.skipWhile((x) => x < 3).toList(); // [3, 4]
```

> `map`, `where`, `expand`, `take`, `skip` are **lazy** — they return an `Iterable` and do nothing until iterated (e.g. by `.toList()` or a for-loop).

---

## 9. Reducing: reduce, fold

```dart
var nums = [1, 2, 3, 4];

// reduce — combine elements, same type as elements. Throws on empty list.
var sum = nums.reduce((a, b) => a + b);     // 10
var max = nums.reduce((a, b) => a > b ? a : b); // 4

// fold — like reduce but with an initial value & any result type. Safe on empty.
var total = nums.fold<int>(0, (acc, x) => acc + x);  // 10
var concat = nums.fold<String>('', (acc, x) => '$acc$x'); // "1234"

// Practical: sum of a property
var prices = [9.99, 4.50, 12.00];
var grandTotal = prices.fold<double>(0, (s, p) => s + p);
```

| | `reduce` | `fold` |
|---|---|---|
| Initial value | none (uses first element) | you provide one |
| Empty list | throws `StateError` | returns initial value |
| Result type | same as element | any type |

---

## 10. Sorting

```dart
var nums = [3, 1, 4, 1, 5, 9, 2];

// In place, ascending (mutates original)
nums.sort();                         // [1, 1, 2, 3, 4, 5, 9]

// Custom comparator
nums.sort((a, b) => b.compareTo(a)); // descending

// Sort objects by field
var users = [User('Bob', 30), User('Ann', 25)];
users.sort((a, b) => a.age.compareTo(b.age));       // by age asc
users.sort((a, b) => a.name.compareTo(b.name));     // by name

// Multi-key sort: by age, then name
users.sort((a, b) {
  final byAge = a.age.compareTo(b.age);
  return byAge != 0 ? byAge : a.name.compareTo(b.name);
});

// Non-mutating sort: copy first
var sorted = [...nums]..sort();

// Reverse (returns lazy Iterable)
nums.reversed.toList();
```

> `sort()` mutates in place and returns `void`. Use the cascade `..sort()` if you want the list back in an expression.

Comparator contract: return **negative** if `a` before `b`, **0** if equal, **positive** if `a` after `b`.

---

## 11. Sublists, Ranges & Slicing

```dart
var list = [0, 1, 2, 3, 4, 5];

list.sublist(2);       // [2, 3, 4, 5]  (from index to end)
list.sublist(1, 4);    // [1, 2, 3]     (end is exclusive)
list.getRange(1, 4);   // lazy Iterable [1, 2, 3]

// Chunking a list into batches of n
List<List<T>> chunk<T>(List<T> list, int size) => [
  for (var i = 0; i < list.length; i += size)
    list.sublist(i, i + size > list.length ? list.length : i + size)
];
chunk([1,2,3,4,5], 2); // [[1,2],[3,4],[5]]
```

---

## 12. Spread, Collection-if, Collection-for

```dart
var a = [1, 2, 3];

// Spread operator
var b = [0, ...a, 4];         // [0, 1, 2, 3, 4]

// Null-aware spread
List<int>? maybe;
var c = [0, ...?maybe];       // [0]  (no crash if null)

// Collection-if
bool loggedIn = true;
var nav = ['Home', if (loggedIn) 'Profile', 'About'];

// Collection-for
var doubled = [for (var x in a) x * 2]; // [2, 4, 6]

// Combined — great for building Flutter widget lists
var widgets = [
  const Header(),
  for (var item in items) ItemTile(item),
  if (items.isEmpty) const EmptyState(),
];
```

These are compile-time features — cleaner and often faster than chained `map`/`where`.

---

## 13. Nested Lists & Matrices

```dart
// 2D list (matrix)
var grid = List.generate(3, (r) => List.generate(3, (c) => r * 3 + c));
// [[0,1,2],[3,4,5],[6,7,8]]

grid[1][2]; // 5

// ⚠️ Pitfall: List.filled with a mutable element shares the SAME reference
var bad = List.filled(3, [0]);   // all three point to the SAME inner list
bad[0].add(9);                   // affects bad[1] and bad[2] too!

// Correct way:
var good = List.generate(3, (_) => [0]); // three independent lists

// Flatten a nested list
var nested = [[1, 2], [3, 4], [5]];
var flat = nested.expand((e) => e).toList(); // [1,2,3,4,5]
```

---

## 14. List of Objects

```dart
class User {
  final String name;
  final int age;
  User(this.name, this.age);
  @override
  String toString() => 'User($name, $age)';
}

var users = [User('Ann', 25), User('Bob', 30), User('Cara', 25)];

// Extract a field
var names = users.map((u) => u.name).toList();

// Filter
var adults = users.where((u) => u.age >= 18).toList();

// Find
var bob = users.firstWhere((u) => u.name == 'Bob');

// Sum a field
var totalAge = users.fold<int>(0, (s, u) => s + u.age);

// Group by a field -> Map
Map<int, List<User>> byAge = {};
for (var u in users) {
  byAge.putIfAbsent(u.age, () => []).add(u);
}
```

For value equality (so `contains`, `indexOf`, `Set` dedup work on objects), override `==` and `hashCode`, or use `Equatable` / records.

---

## 15. Immutability & const Lists

```dart
// Compile-time constant list — deeply immutable, canonicalized
const primes = [2, 3, 5, 7];
primes.add(11); // ❌ Unsupported: cannot modify an unmodifiable list

// Runtime unmodifiable
var view = List<int>.unmodifiable([1, 2, 3]);

// Two identical const lists are the SAME object
const x = [1, 2];
const y = [1, 2];
identical(x, y); // true
```

Prefer exposing `List.unmodifiable(...)` or `UnmodifiableListView` (from `dart:collection`) from your APIs to prevent callers mutating your internal state.

---

## 16. Copying: shallow vs deep

```dart
var original = [1, 2, 3];

// Shallow copies (new list, same element references)
var s1 = [...original];
var s2 = List.of(original);
var s3 = original.toList();
var s4 = original.sublist(0);

// For objects, a shallow copy shares the objects:
var users = [User('Ann', 25)];
var copy = [...users];
copy[0].name; // same User instance as users[0]

// Deep copy needs per-element cloning:
var deep = users.map((u) => User(u.name, u.age)).toList();
```

Dart has no built-in deep copy — you clone each element yourself (often via a `copyWith` method).

---

## 17. Null Safety with Lists

```dart
List<int> a;             // non-nullable list of non-nullable ints
List<int>? b;            // the list itself may be null
List<int?> c = [1, null]; // list of nullable ints
List<int?>? d;           // both may be null

// Guard the list
print(b?.length);        // null-safe
var len = b?.length ?? 0;

// Remove nulls and get a non-nullable list
List<int?> nullable = [1, null, 2, null, 3];
List<int> clean = nullable.whereType<int>().toList(); // [1, 2, 3]
// or
List<int> clean2 = nullable.where((e) => e != null).cast<int>().toList();
```

---

## 18. Iterable vs List (lazy vs eager)

- `List` is a concrete, indexable, materialized collection.
- `Iterable` is a lazy sequence — `map`/`where`/`expand` return `Iterable`, computed on demand.

```dart
var it = [1, 2, 3].map((x) {
  print('mapping $x');
  return x * 2;
});
// nothing printed yet — lazy!

var result = it.toList(); // NOW it prints mapping 1/2/3
```

Consequences:
- Chaining `map().where().map()` builds a pipeline that runs **once** per element when materialized — efficient, no intermediate lists.
- But a lazy `Iterable` **re-runs** every time you iterate it. Call `.toList()` once if you'll use the result multiple times.

```dart
var doubled = nums.map((x) => x * 2); // Iterable
doubled.length;  // iterates
doubled.first;   // iterates AGAIN
var fixed = doubled.toList(); // materialize once
```

---

## 19. Performance & Big-O

| Operation | Complexity | Notes |
|---|---|---|
| `list[i]` (index access) | O(1) | direct |
| `add` | amortized O(1) | may reallocate |
| `insert(0, x)` / `removeAt(0)` | O(n) | shifts elements |
| `add`/`removeLast` at end | O(1) amortized | cheap |
| `contains` / `indexOf` | O(n) | linear scan |
| `remove(value)` | O(n) | scans then shifts |
| `sort` | O(n log n) | in place |
| `sublist` | O(k) | copies k elements |
| `insertAll` in middle | O(n) | shifts |

Tips:
- Frequent front insert/remove → use a `Queue` (`dart:collection`, `ListQueue`/`DoubleLinkedQueue`).
- Need fast membership tests → use a `Set`, not `list.contains` in a loop (O(n²)).
- Building a big list → prefer collection-for or `List.generate` over repeated `add`.

---

## 20. Common Patterns & Recipes

```dart
// Remove duplicates (preserving order)
var unique = list.toSet().toList();

// Remove duplicates by key
final seen = <int>{};
var dedup = users.where((u) => seen.add(u.age)).toList();

// Sum / average / min / max (import 'dart:math' or use package:collection)
var sum = nums.reduce((a, b) => a + b);
var avg = nums.reduce((a, b) => a + b) / nums.length;
var mn = nums.reduce(min); // import 'dart:math';
var mx = nums.reduce(max);

// Group by (package:collection has groupBy; manual version:)
Map<K, List<T>> groupBy<T, K>(Iterable<T> items, K Function(T) key) {
  final map = <K, List<T>>{};
  for (final item in items) {
    map.putIfAbsent(key(item), () => []).add(item);
  }
  return map;
}

// Partition into [matching, notMatching]
List<List<T>> partition<T>(List<T> l, bool Function(T) test) {
  final yes = <T>[], no = <T>[];
  for (final e in l) (test(e) ? yes : no).add(e);
  return [yes, no];
}

// Zip two lists
List<R> zip<A, B, R>(List<A> a, List<B> b, R Function(A, B) f) => [
  for (var i = 0; i < a.length && i < b.length; i++) f(a[i], b[i])
];

// Rotate
var rotated = [...list.skip(2), ...list.take(2)];

// Frequency count
var freq = <String, int>{};
for (var w in words) freq[w] = (freq[w] ?? 0) + 1;

// Reverse in place
list.setRange(0, list.length, list.reversed.toList());
```

`package:collection` is worth adding — it provides `groupBy`, `firstWhereOrNull`, `sortedBy`, `whereNotNull`, `mapIndexed`, `sum`, `maxBy`, `minBy`, `ListEquality`, and more.

---

## 21. Gotchas

```dart
// 1) List.filled shares references for mutable elements (see §13)

// 2) Modifying during iteration
for (var x in list) { if (x.isEven) list.remove(x); } // ❌ ConcurrentModificationError
list.removeWhere((x) => x.isEven);                     // ✅

// 3) firstWhere throws when nothing matches — pass orElse
list.firstWhere((x) => x > 100, orElse: () => -1);

// 4) sort() returns void, not the list
var wrong = list.sort();      // ❌ wrong is void
var right = [...list]..sort(); // ✅

// 5) == compares identity for lists, not contents
[1, 2] == [1, 2]; // false!
// Use ListEquality (package:collection):
const ListEquality().equals([1, 2], [1, 2]); // true

// 6) Lazy Iterable re-evaluates — materialize with toList()

// 7) Removing by value vs index
list.remove(2);   // removes the VALUE 2
list.removeAt(2); // removes element at INDEX 2

// 8) Fixed-length lists can't grow (List.filled without growable:true)
```

---

## 22. Full Method Reference

**Access:** `[]`, `first`, `last`, `single`, `length`, `isEmpty`, `isNotEmpty`, `elementAt`, `elementAtOrNull`, `firstOrNull`, `lastOrNull`, `reversed`

**Add/Remove:** `add`, `addAll`, `insert`, `insertAll`, `remove`, `removeAt`, `removeLast`, `removeWhere`, `removeRange`, `retainWhere`, `clear`, `replaceRange`, `setRange`, `setAll`, `fillRange`

**Search:** `contains`, `indexOf`, `lastIndexOf`, `indexWhere`, `lastIndexWhere`, `firstWhere`, `lastWhere`, `singleWhere`, `any`, `every`

**Transform:** `map`, `where`, `whereType`, `expand`, `followedBy`, `take`, `takeWhile`, `skip`, `skipWhile`, `cast`, `asMap`, `indexed`

**Reduce:** `reduce`, `fold`, `join`

**Order:** `sort`, `shuffle`, `reversed`

**Slice/Copy:** `sublist`, `getRange`, `toList`, `toSet`

**Iterate:** `forEach`, `for-in`

Full docs: <https://api.dart.dev/stable/dart-core/List-class.html>

---

## Quick Cheat Sheet

```dart
var l = [1, 2, 3];
l.add(4);                          // append
l.map((x) => x * 2);               // transform (lazy)
l.where((x) => x.isEven);          // filter (lazy)
l.fold(0, (a, b) => a + b);        // reduce with seed
l.firstWhere((x) => x > 1, orElse: () => -1);
[...l]..sort();                    // copy + sort
l.toSet().toList();                // dedup
List.generate(n, (i) => i);        // build
[for (var x in l) if (x > 1) x];   // collection-for + if
```
