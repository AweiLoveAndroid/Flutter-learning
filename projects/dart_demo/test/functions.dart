void main() {
  /// 调用可选的命名参数
  enableFlags(bold: true, hidden: false);

  /// 调用可选的位置参数
  say('Bob', 'Howdy'); //结果是： Bob says Howdy
  /// 用第三个参数调用这个函数的例子：
  say('Bob', 'Howdy', 'smoke signal'); //结果是：Bob says Howdy with a smoke signal

  /// 调用为命名参数设置默认值 调用的时候：bold will be true; hidden will be false.
  enableFlags2(bold: true);

  /// 调用为位置参数设置默认值
  say2('Bob', 'Howdy'); //结果是：Bob says Howdy with a carrier pigeon
}

/// 可选的命名参数
//设置[bold]和[hidden]标志
void enableFlags({bool bold, bool hidden}) {
  // ...
}

/// 可选的位置参数
String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

/// 如何为命名参数设置默认值
void enableFlags2({bool bold = false, bool hidden = false}) {
  // ...
}

/// 如何为位置参数设置默认值
String say2(String from, String msg,
    [String device = 'carrier pigeon', String mood]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  if (mood != null) {
    result = '$result (in a $mood mood)';
  }
  return result;
}

/// 使用list 或者map设置默认值
void doStuff(
    {List<int> list = const [1, 2, 3],
    Map<String, String> gifts = const {
      'first': 'paper',
      'second': 'cotton',
      'third': 'leather'
    }}) {
  print('list:  $list');
  print('gifts: $gifts');
}
