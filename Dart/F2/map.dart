void main() {
  var map_name = {
    'key1': 'value1',
    'key2': 2,
    'key3': 3.0,
    'key4': true,
  };
  map_name['key1'] = 1;

  var mapName = Map();

  mapName['Num1'] = 1;
  mapName['Num2'] = 2;

  print(mapName);
}
