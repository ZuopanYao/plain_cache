import 'package:flutter/material.dart';
import 'package:plain_cache/plain_cache.dart';

void main() {
  // Enable Simple Cache
  PlainCache.enable();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          TextButton(
              // 从持久性缓存中读取数据
              // Read from persistent cache
              onPressed: () {
                final boolValue = storage.getBool(forKey: 'MyKey');
                final doubleValue = storage.getDouble(forKey: 'MyKey');
                final intValue = storage.getInt(forKey: 'MyKey');
                final listValue = storage.getList(forKey: 'MyKey');
                final mapValue = storage.getMap(forKey: 'MyKey');
                final stringValue = storage.getString(forKey: 'MyKey');

                print(boolValue);
                print(doubleValue);
                print(intValue);
                print(listValue);
                print(mapValue);
                print(stringValue);
              },
              child: Text('Read')),
          TextButton(
              // 保存数据到持久性缓存
              // Save to persistent cache
              onPressed: () {
                storage.setValue('newValue', forKey: 'MyKey');
              },
              child: Text('Save')),
          TextButton(
              // 从持久性缓存中删除数据
              // Remove from persistent cache
              onPressed: () {
                storage.remove(forKey: 'MyKey');
              },
              child: Text('Remove'))
        ],
      ),
    );
  }
}
