# Dart `Map` — From Basic to Advanced

A `Map` is a collection of **key → value** pairs, where each key is unique. It is Dart's dictionary / hash table / associative array. This guide covers everything from a basic literal to advanced transformations, ordering guarantees, custom keys, and performance.

---

## Table of Contents

1. [What is a Map?](#1-what-is-a-map)
2. [Creating Maps](#2-creating-maps)
3. [Map Types: HashMap, LinkedHashMap, SplayTreeMap](#3-map-types-hashmap-linkedhashmap-splaytreemap)
4. [Accessing Values](#4-accessing-values)
5. [Adding & Updating](#5-adding--updating)
6. [Removing](#6-removing)
7. [Checking & Searching](#7-checking--searching)
8. [keys, values, entries](#8-keys-values-entries)
9. [Iterating](#9-iterating)
10. [putIfAbsent & update](#10-putifabsent--update)
11. [Transforming Maps](#11-transforming-maps)
12. [Building Maps from Lists](#12-building-maps-from-lists)
13. [Spread, Collection-if, Collection-for](#13-spread-collection-if-collection-for)
14. [Nested Maps & JSON](#14-nested-maps--json)
15. [Custom Keys (== / hashCode)](#15-custom-keys---hashcode)
16. [Null Safety with Maps](#16-null-safety-with-maps)
17. [Immutability & const Maps](#17-immutability--const-maps)
18. [Copying: shallow vs deep](#18-copying-shallow-vs-deep)
19. [Sorting a Map](#19-sorting-a-map)
20. [Performance & Big-O](#20-performance--big-o)
21. [Common Patterns & Recipes](#21-common-patterns--recipes)
22. [Gotchas](#22-gotchas)
23. [Full Method Reference](#23-full-method-reference)

---

## 1. What is a Map?

- Stores **unique keys**, each mapped to a value.
- Keys and values can be any type: `Map<String, int>`, `Map<int, User>`, `Map<String, dynamic>` (JSON).
- Default implementation preserves **insertion order** (`LinkedHashMap`).
- Looking up by key is O(1) on average (hash-based).

```dart
Map<String, int> ages = {'Ann': 25, 'Bob': 30};
print(ages['Ann']);   // 25
print(ages.length);   // 2
```

---

## 2. Creating Maps

```dart
// Literal (most common)
var a = {'one': 1, 'two': 2};

// Typed literal
var b = <String, int>{};      // empty typed map
Map<String, int> c = {};

// Map.from / Map.of — copy
var d = Map<String, int>.from(a);
var e = Map<String, int>.of(a);   // type-safe, preferred

// Map.fromEntries
var f = Map.fromEntries([
  MapEntry('x', 1),
  MapEntry('y', 2),
]);

// Map.fromIterable — build keys & values from an iterable
var g = Map<int, int>.fromIterable(
  [1, 2, 3],
  key: (e) => e,
  value: (e) => e * e,
); // {1: 1, 2: 4, 3: 9}

// Map.fromIterables — parallel keys & values lists
var h = Map<String, int>.fromIterables(['a', 'b'], [1, 2]); // {a:1, b:2}

// Map.identity — uses identical() for key equality
var i = Map<Object, String>.identity();

// Map.unmodifiable — read-only
var j = Map<String, int>.unmodifiable(a);
```

> `{}` is a **Map** literal, not a Set. `<int>{}` is a Set; `<int, int>{}` or `{}` typed as a Map is a Map. An empty `{}` defaults to `Map<dynamic, dynamic>` unless typed.

---

## 3. Map Types: HashMap, LinkedHashMap, SplayTreeMap

From `dart:collection`:

| Type | Order | Lookup | Use when |
|---|---|---|---|
| `LinkedHashMap` (default for `{}`) | insertion order | O(1) avg | you want predictable iteration order |
| `HashMap` | **no guaranteed order** | O(1) avg, slightly faster | order doesn't matter, want speed |
| `SplayTreeMap` | **sorted by key** | O(log n) | you need keys iterated in sorted order |

```dart
import 'dart:collection';

var hash = HashMap<String, int>();        // unordered
var linked = LinkedHashMap<String, int>(); // insertion order (same as {})
var tree = SplayTreeMap<String, int>();    // sorted keys

tree.addAll({'c': 3, 'a': 1, 'b': 2});
print(tree.keys); // (a, b, c) — sorted!

// SplayTreeMap with custom compare
var desc = SplayTreeMap<int, String>((a, b) => b.compareTo(a));
```

`SplayTreeMap` also offers `firstKey()`, `lastKey()`, `firstKeyAfter(k)`, `lastKeyBefore(k)` — handy for range queries.

---

## 4. Accessing Values

```dart
var m = {'a': 1, 'b': 2};

m['a'];          // 1
m['z'];          // null — missing key returns null, does NOT throw
m['z'] ?? 0;     // 0 (default fallback)

m.length;        // 2
m.isEmpty;       // false
m.isNotEmpty;    // true

// Safe access with default (does not insert)
m['x'] ?? -1;

// putIfAbsent DOES insert if missing (see §10)
```

> Unlike a `List`, indexing a `Map` with a missing key returns `null` instead of throwing. Combine with `??` for defaults.

---

## 5. Adding & Updating

```dart
var m = <String, int>{};

// Add or overwrite (same syntax)
m['a'] = 1;     // add
m['a'] = 10;    // overwrite

// Add many
m.addAll({'b': 2, 'c': 3});

// Add entries
m.addEntries([MapEntry('d', 4), MapEntry('e', 5)]);

// Merge two maps (right wins on conflict)
var merged = {...m, 'a': 99};
```

Assigning to an existing key **replaces** the value. There is no separate "insert vs update" — `m[k] = v` does both.

---

## 6. Removing

```dart
var m = {'a': 1, 'b': 2, 'c': 3};

m.remove('a');                       // returns removed value (1) or null
m.removeWhere((k, v) => v > 1);      // remove all matching entries
m.clear();                           // empty the map
```

---

## 7. Checking & Searching

```dart
var m = {'a': 1, 'b': 2};

m.containsKey('a');   // true
m.containsValue(2);   // true  (O(n) — scans values)

// Any / every over entries
m.entries.any((e) => e.value > 1);   // true
m.entries.every((e) => e.value > 0); // true

// Find a key by value
var key = m.entries
    .firstWhere((e) => e.value == 2, orElse: () => const MapEntry('', -1))
    .key; // 'b'
```

---

## 8. keys, values, entries

```dart
var m = {'a': 1, 'b': 2, 'c': 3};

m.keys;      // Iterable ('a', 'b', 'c')
m.values;    // Iterable (1, 2, 3)
m.entries;   // Iterable<MapEntry<String,int>>

m.keys.toList();     // ['a', 'b', 'c']
m.values.toList();   // [1, 2, 3]

// entries give you both
for (final e in m.entries) {
  print('${e.key} = ${e.value}');
}

// Sum values
var total = m.values.reduce((a, b) => a + b); // 6

// Filter keys/values
var bigKeys = m.entries.where((e) => e.value > 1).map((e) => e.key).toList();
```

> `keys` and `values` are **live, lazy views** — they reflect later changes to the map and are not snapshots. Call `.toList()` to snapshot.

---

## 9. Iterating

```dart
var m = {'a': 1, 'b': 2};

// forEach — key & value
m.forEach((key, value) => print('$key: $value'));

// for-in over entries (allows break/continue/await)
for (final entry in m.entries) {
  print('${entry.key} -> ${entry.value}');
}

// Destructure with records (Dart 3)
for (final MapEntry(:key, :value) in m.entries) {
  print('$key: $value');
}

// Iterate keys or values only
for (final k in m.keys) print(k);
for (final v in m.values) print(v);
```

> **Don't add/remove keys while iterating** — throws `ConcurrentModificationError`. (You *can* update the value of an existing key.) Collect keys first if you need to mutate:

```dart
for (final k in m.keys.toList()) {
  if (someCondition(k)) m.remove(k);
}
// or simply: m.removeWhere((k, v) => someCondition(k));
```

---

## 10. putIfAbsent & update

The two most useful "smart write" methods:

```dart
var m = <String, int>{'a': 1};

// putIfAbsent — insert only if key missing; returns the (existing or new) value
m.putIfAbsent('a', () => 99); // key exists -> stays 1, returns 1
m.putIfAbsent('b', () => 2);  // inserts b=2, returns 2

// update — modify an existing key; ifAbsent handles the missing case
m.update('a', (v) => v + 10);              // a -> 11
m.update('z', (v) => v + 1, ifAbsent: () => 0); // z missing -> inserts 0

// updateAll — transform every value
m.updateAll((k, v) => v * 2);
```

Classic counter / grouping idioms:

```dart
// Word frequency
var freq = <String, int>{};
for (final w in words) {
  freq.update(w, (c) => c + 1, ifAbsent: () => 1);
}

// Group items into lists
var byFirstLetter = <String, List<String>>{};
for (final name in names) {
  byFirstLetter.putIfAbsent(name[0], () => []).add(name);
}
```

> `putIfAbsent` takes a **function** (`() => value`) so the default is computed lazily — only when actually needed.

---

## 11. Transforming Maps

```dart
var m = {'a': 1, 'b': 2, 'c': 3};

// map — transform each entry into a new entry (can change key & value types)
var doubled = m.map((k, v) => MapEntry(k.toUpperCase(), v * 2));
// {A: 2, B: 4, C: 6}

// Filter (via entries or removeWhere on a copy)
var big = Map.fromEntries(m.entries.where((e) => e.value > 1));
// {b: 2, c: 3}

// Map values only, keep keys
var strVals = m.map((k, v) => MapEntry(k, 'val=$v'));

// Invert a map (value -> key). Assumes values are unique!
var inverted = {for (final e in m.entries) e.value: e.key};
// {1: a, 2: b, 3: c}

// cast
var casted = m.cast<String, num>();
```

---

## 12. Building Maps from Lists

```dart
var users = [User('Ann', 25), User('Bob', 30)];

// Index by a field (id/name -> object)
var byName = {for (final u in users) u.name: u};
// {Ann: User(Ann,25), Bob: User(Bob,30)}

// With Map.fromIterable
var byName2 = Map<String, User>.fromIterable(
  users, key: (u) => u.name, value: (u) => u,
);

// From two parallel lists
var scores = Map.fromIterables(['math', 'science'], [90, 85]);

// package:collection helpers
// import 'package:collection/collection.dart';
// var grouped = groupBy(users, (User u) => u.age); // Map<int, List<User>>
```

The collection-for form `{for (final x in list) key: value}` is the idiomatic, most readable way to build a map from a list.

---

## 13. Spread, Collection-if, Collection-for

```dart
var base = {'a': 1, 'b': 2};

// Spread — merge maps (later keys win)
var merged = {...base, 'c': 3, 'a': 99}; // {a:99, b:2, c:3}

// Null-aware spread
Map<String, int>? extra;
var safe = {...base, ...?extra};

// Collection-if
bool admin = true;
var config = {
  'name': 'app',
  if (admin) 'role': 'admin',
};

// Collection-for
var squares = {for (var i = 1; i <= 3; i++) i: i * i}; // {1:1, 2:4, 3:9}

// Combined
var settings = {
  'theme': 'dark',
  for (final f in features) f.key: f.enabled,
  if (isPro) 'pro': true,
};
```

---

## 14. Nested Maps & JSON

JSON decodes into `Map<String, dynamic>`:

```dart
import 'dart:convert';

var jsonStr = '{"user":{"name":"Ann","tags":["a","b"]},"active":true}';
Map<String, dynamic> data = jsonDecode(jsonStr);

// Accessing nested values (cast as you go)
var name = data['user']['name'] as String;             // 'Ann'
var tags = (data['user']['tags'] as List).cast<String>();

// Safe nested access
var city = (data['address'] as Map?)?['city'] ?? 'Unknown';

// Encode back to JSON
var out = jsonEncode(data);

// Deeply nested build
var config = {
  'server': {
    'host': 'localhost',
    'ports': [80, 443],
  },
};
config['server']['host'];  // dynamic — cast if you need a typed result
```

Tips for JSON maps:
- Values are `dynamic` — cast (`as String`, `as int`) when you read them.
- Missing keys give `null`; use `?? default`.
- For real apps, convert `Map<String, dynamic>` into typed model classes via `fromJson` factories (matches the model pattern in this repo's conventions).

---

## 15. Custom Keys (== / hashCode)

A `HashMap`/`LinkedHashMap` finds keys using `hashCode` and `==`. For your **own classes** used as keys, you must override both, or two "equal" objects will be treated as different keys.

```dart
class Point {
  final int x, y;
  Point(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      other is Point && other.x == x && other.y == y;

  @override
  int get hashCode => Object.hash(x, y);
}

var m = <Point, String>{};
m[Point(1, 2)] = 'A';
print(m[Point(1, 2)]); // 'A'  ✅ works because == & hashCode overridden
// Without the overrides this would print null.
```

Rules:
- Equal objects **must** have equal `hashCode`.
- Use `Object.hash(...)` / `Object.hashAll(...)` to combine fields.
- Prefer **immutable** keys — mutating a key's fields after insertion corrupts the map.
- Records (Dart 3) have built-in value equality — great as composite keys: `var m = <(int, int), String>{}; m[(1, 2)] = 'A';`

---

## 16. Null Safety with Maps

```dart
Map<String, int> a;          // map non-null; values non-null
Map<String, int>? b;         // the map itself may be null
Map<String, int?> c;         // values may be null
Map<String, int?>? d;        // both

// Lookup ALWAYS returns a nullable type (V?), because the key might be missing:
int? x = a['key'];           // even for Map<String, int>, result is int?
int y = a['key'] ?? 0;

// Guard a nullable map
b?['key'];
var len = b?.length ?? 0;

// Distinguish "missing" from "present but null" (for Map<String, int?>)
if (c.containsKey('k')) {
  // key exists, value might still be null
}
```

> Key subtlety: `map[k]` returns `null` both when the key is absent **and** when the key maps to `null`. Use `containsKey` to tell them apart.

---

## 17. Immutability & const Maps

```dart
// Compile-time constant map — deeply immutable
const settings = {'debug': false, 'level': 3};
settings['x'] = 1; // ❌ Unsupported: cannot modify unmodifiable map

// Runtime unmodifiable view
var view = Map<String, int>.unmodifiable({'a': 1});

// const keys must themselves be const-compatible
const config = {'a': 1, 'b': 2};
```

Expose `Map.unmodifiable(...)` (or `UnmodifiableMapView` from `dart:collection`) from APIs so callers can't mutate your internal state.

---

## 18. Copying: shallow vs deep

```dart
var original = {'a': 1, 'b': 2};

// Shallow copies (new map, same value references)
var s1 = {...original};
var s2 = Map.of(original);
var s3 = Map.from(original);

// For nested/object values, shallow copy shares them:
var nested = {'user': {'name': 'Ann'}};
var copy = {...nested};
copy['user']['name'] = 'Bob';   // ALSO changes original['user']['name']!

// Deep copy — clone values yourself
var deep = {
  for (final e in nested.entries)
    e.key: {...e.value as Map}   // clone inner maps
};
```

No built-in deep copy — recurse manually, use `copyWith`, or round-trip through `jsonEncode`/`jsonDecode` for pure-JSON data.

---

## 19. Sorting a Map

`LinkedHashMap` keeps insertion order; to get a sorted map you rebuild it or use `SplayTreeMap`.

```dart
var m = {'banana': 3, 'apple': 1, 'cherry': 2};

// Sort by key
var byKey = Map.fromEntries(
  m.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
);

// Sort by value (descending)
var byValueDesc = Map.fromEntries(
  m.entries.toList()..sort((a, b) => b.value.compareTo(a.value)),
);

// Always-sorted map by key
import 'dart:collection';
var tree = SplayTreeMap<String, int>.from(m); // iterates keys sorted

// Top-N by value
var top2 = (m.entries.toList()..sort((a, b) => b.value.compareTo(a.value)))
    .take(2)
    .toList();
```

> A regular `Map` has no in-place `sort`. You sort the `entries` list, then rebuild with `Map.fromEntries`.

---

## 20. Performance & Big-O

| Operation | HashMap / LinkedHashMap | SplayTreeMap |
|---|---|---|
| `m[k]` lookup | O(1) avg | O(log n) |
| `m[k] = v` insert/update | O(1) avg | O(log n) |
| `remove(k)` | O(1) avg | O(log n) |
| `containsKey` | O(1) avg | O(log n) |
| `containsValue` | **O(n)** | O(n) |
| iterate | O(n) | O(n), sorted |

Tips:
- `containsValue` scans all values — if you need reverse lookup often, keep an inverse map.
- Choose `HashMap` for max speed when order is irrelevant; `LinkedHashMap` (default) when you need insertion order; `SplayTreeMap` when you need sorted iteration.
- Custom key classes with a poor `hashCode` (collisions) degrade lookups toward O(n).

---

## 21. Common Patterns & Recipes

```dart
// Counter / frequency map
var freq = <String, int>{};
for (final w in words) freq.update(w, (c) => c + 1, ifAbsent: () => 1);

// Group by (manual)
Map<K, List<T>> groupBy<T, K>(Iterable<T> items, K Function(T) key) {
  final map = <K, List<T>>{};
  for (final item in items) {
    map.putIfAbsent(key(item), () => []).add(item);
  }
  return map;
}

// Invert a map
var inverted = {for (final e in m.entries) e.value: e.key};

// Merge maps summing values on conflict
Map<K, num> mergeSum<K>(Map<K, num> a, Map<K, num> b) {
  final r = Map<K, num>.of(a);
  b.forEach((k, v) => r.update(k, (x) => x + v, ifAbsent: () => v));
  return r;
}

// Default-dict style access
var buckets = <String, List<int>>{};
buckets.putIfAbsent('x', () => []).add(1);

// Get key with max value
var topKey = m.entries.reduce((a, b) => a.value >= b.value ? a : b).key;

// Filter a map
var filtered = Map.fromEntries(m.entries.where((e) => e.value > 0));

// Convert list of pairs to map
var pairs = [('a', 1), ('b', 2)];
var fromPairs = {for (final (k, v) in pairs) k: v};

// Two-level nested map access with defaults
var grid = <int, Map<int, String>>{};
grid.putIfAbsent(0, () => {})[1] = 'cell';
```

`package:collection` adds: `groupBy`, `mapMap`, `UnmodifiableMapView`, `DefaultDict`-like patterns, `CanonicalizedMap`, and `MapEquality` for content comparison.

---

## 22. Gotchas

```dart
// 1) Missing key returns null, doesn't throw
m['nope'];             // null
m['nope'] ?? default_;

// 2) null value vs missing key are indistinguishable via []
Map<String, int?> mm = {'a': null};
mm['a'];               // null
mm['b'];               // null too! use containsKey to tell apart

// 3) Custom key classes need == AND hashCode overridden (§15)

// 4) Modifying keys during iteration throws
for (final k in m.keys) m.remove(k);   // ❌ ConcurrentModificationError
m.removeWhere((k, v) => true);          // ✅
for (final k in m.keys.toList()) ...    // ✅ snapshot first

// 5) == compares identity, not contents
{'a': 1} == {'a': 1};   // false!
// Use MapEquality (package:collection):
const MapEquality().equals({'a': 1}, {'a': 1}); // true

// 6) {} is an empty MAP, not a Set. Use <int>{} for an empty Set.

// 7) keys/values are live views — {...m.keys} snapshots them
var snapshot = m.keys.toList();

// 8) Map.fromIterable / fromIterables lose type inference — annotate types

// 9) Spread merge: later keys win, silently overwriting
var x = {...a, ...b}; // b's duplicate keys overwrite a's
```

---

## 23. Full Method Reference

**Access:** `[]`, `length`, `isEmpty`, `isNotEmpty`, `keys`, `values`, `entries`

**Write:** `[]=`, `addAll`, `addEntries`, `putIfAbsent`, `update`, `updateAll`

**Remove:** `remove`, `removeWhere`, `clear`

**Query:** `containsKey`, `containsValue`

**Transform:** `map`, `forEach`, `cast`

**Construct:** `Map()`, `Map.from`, `Map.of`, `Map.fromEntries`, `Map.fromIterable`, `Map.fromIterables`, `Map.identity`, `Map.unmodifiable`

**dart:collection:** `HashMap`, `LinkedHashMap`, `SplayTreeMap`, `UnmodifiableMapView`

Full docs: <https://api.dart.dev/stable/dart-core/Map-class.html>

---

## Quick Cheat Sheet

```dart
var m = {'a': 1};
m['b'] = 2;                                  // add/update
m['x'] ?? 0;                                 // safe read
m.putIfAbsent('c', () => 3);                 // insert if absent
m.update('a', (v) => v + 1, ifAbsent: () => 0); // upsert
m.containsKey('a');                          // check
m.removeWhere((k, v) => v > 1);              // conditional remove
m.map((k, v) => MapEntry(k, v * 2));         // transform
{for (final u in users) u.id: u};            // build from list
{...a, ...b};                                // merge (b wins)
{for (final e in m.entries) e.value: e.key}; // invert
Map.fromEntries(m.entries.toList()..sort(...)); // sort
```
