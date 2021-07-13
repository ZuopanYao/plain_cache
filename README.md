# plain_cache

[![Pub Package](https://img.shields.io/pub/v/plain_cache.svg)](https://pub.dartlang.org/packages/plain_cache)

Persistent cache library for Dart(Flutter for iOS and Android).

## Installing

With Flutter:

```shell
flutter pub add plain_cache
```

This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

``` yaml
dependencies:
  plain_cache: ^1.0.3
```
  
Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.

## Usage

### Enable plain cache

```dart
import 'package:plain_cache/plain_cache.dart';

void main() {
  // Enable Plain Cache
  PlainCache.enable();

  runApp(MyApp());
}
```

### simple usage example:

Save to persistent cache / 保存数据到持久性缓存

```dart
 storage.setValue('newValue', forKey: 'MyKey');
```

Read from persistent cache / 从持久性缓存中读取数据

```dart
final boolValue = storage.getBool(forKey: 'MyKey');
final doubleValue = storage.getDouble(forKey: 'MyKey');
final intValue = storage.getInt(forKey: 'MyKey');
final listValue = storage.getList(forKey: 'MyKey');
final mapValue = storage.getMap(forKey: 'MyKey');
final stringValue = storage.getString(forKey: 'MyKey');

```

Remove from persistent cache / 从持久性缓存中删除数据

```dart
storage.remove(forKey: 'MyKey');

```


## License / 许可证

plain_cache is released under the MIT license. See [LICENSE](./LICENSE) for details.

plain_cache 是在 MIT 许可下发布的，有关详情请查看该许可证。