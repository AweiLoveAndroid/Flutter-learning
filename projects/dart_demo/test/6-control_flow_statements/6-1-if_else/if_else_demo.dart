void main() {
  
  String text;
  int number = 50;
  String urlString = 'http://www.baidu.com/';

  // 确保变量具有非空值
  assert(text != null);
  // 确保值小于100
  assert(number < 100);
  // 确保这是一个 https 网址
  assert(urlString.startsWith('https'));

  // 要将消息附加到断言，请添加一个字符串作为第二个参数。
  assert(urlString.startsWith('https'),
      'URL ($urlString) should start with "https".');
}
