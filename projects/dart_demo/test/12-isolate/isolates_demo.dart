import 'dart:isolate';
import 'dart:io';
import 'dart:convert';

// 在另一个隔离区()中同步读取“D://file.json”
// 结果是{msg: [{title: 你好1, contents: yes}, {title: 你好2, contents: NO}]}
main() async {
  // 在其他隔离(isolate)中同步读取文件，然后对其进行解码。
  print(await readIsolate());
}

// 同步读取'D//file.json'（在同一个线程中）
Map readSync() {
JsonCodec().decode(new File('D://file.json').readAsStringSync());
}

// 在另一个隔离区()中同步读取“D://file.json”
Future readIsolate() async {
  final response = new ReceivePort();
  await Isolate.spawn(_isolate, response.sendPort);
  return response.first;
}

/// 期望通过[Isolate.spawn]创建
void _isolate(SendPort sendPort) {
  sendPort.send(readSync());
}

// 下面是file.json文件的内容：
// {
//     "msg": [
//         {
//             "title": "你好1",
//             "contents": "yes"
//         },
//         {
//             "title": "你好2",
//             "contents": "NO"
//         }
//     ]
// }
