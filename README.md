# simple_cache

Persistent cache library for Dart(Flutter for iOS and Android).

## Usage

### Enable Simple Cache

```dart
import 'package:simple_cache/simple_cache.dart';

void main() {
  // Enable Simple Cache
  SimpleCache.enable();

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

simple_cache is released under the MIT license. See [LICENSE](./LICENSE) for details.

simple_cache 是在 MIT 许可下发布的，有关详情请查看该许可证。