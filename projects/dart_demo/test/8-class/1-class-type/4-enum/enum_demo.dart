//枚举示例

void main() {
  // 判断枚举的索引值是多少
  assert(Color.red.index == 0);
  print(Color.green.index == 1);
  print(Color.blue.index == 2);

  // 获取枚举中所有值的列表
  List<Color> colors = Color.values;
  print(colors[2] == Color.blue);

  // switch中使用枚举
  var aColor = Color.blue;
  switch (aColor) {
    case Color.red:
      print('Red');
      break;
    case Color.green:
      print('Green');
      break;
    default: // 你没有这个 你会看到一个警告
      print(aColor); // 'Color.blue'
  }
}

// 声明枚举类型
enum Color { red, green, blue }
