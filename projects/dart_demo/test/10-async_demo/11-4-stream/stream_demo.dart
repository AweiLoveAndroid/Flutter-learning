import 'dart:io';
import 'dart:convert';

void main() {
  test();
}

// await for循环的使用示例
// 这里是读取本地文件的内容
Future test() async {
  var config = File('d:\\test.txt');
  // 打开io流进行文件读取
  Stream<List<int>> inputStream = config.openRead();
  var lines = inputStream
    // 设置编码格式为utf-8
    .transform(utf8.decoder)
    .transform(LineSplitter());
  try {
    await for (var line in lines) {
      print('从Stream中获取到的内容是： ${line} \r文本内容长度为：'+
       '${line.length}\r=======');
    }
    print('文件现在没有关闭。。。');
  } catch (e) {
    print(e);
  }
}