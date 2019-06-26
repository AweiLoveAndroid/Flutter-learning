import 'dart:ui';

void main() {
  test();
}

/// Color 类的所有 Api 完整使用示例
void test() {
  // 方式1：使用16进制颜色值
  // #FFB5B5 粉红色 255 181 181
  Color color = new Color(0xFFB5B5);
  int red = color.red;
  int green = color.green;
  int blue = color.blue;
  print("color: " +
      "    red: " +
      red.toString() +
      "    green: " +
      green.toString() +
      "    blue: " +
      blue.toString()); // red: 255    green: 181    blue: 181

  // 前两位为透明度：不透明度（00是完全透明，FF是完全不透明）
  Color color1 = new Color(0xFFFFB5B5);
  int alpha1 = color1.alpha;
  int red1 = color1.red;
  int green1 = color1.green;
  int blue1 = color1.blue;
  print("color1: " +
      "    alpha: " +
      alpha1.toString() +
      "    red: " +
      red1.toString() +
      "    green: " +
      green1.toString() +
      "    blue: " +
      blue1.toString()); // alpha: 255    red: 255    green: 181    blue: 181

  // 方式2：  参数4为：不透明度（0是完全透明，255是完全不透明）
  Color color2 = Color.fromARGB(255, 255, 181, 181);
  int alpha2 = color2.alpha;
  int red2 = color2.red;
  int green2 = color2.green;
  int blue2 = color2.blue;
  print("color2: " +
      "    alpha: " +
      alpha1.toString() +
      "    red: " +
      red2.toString() +
      "    green: " +
      green2.toString() +
      "    blue: " +
      blue2.toString()); // alpha: 255    red: 255    green: 181    blue: 181

  // 方式3： 参数4为：不透明度（0.0是完全透明，1.0是完全不透明）
  Color color3 = Color.fromRGBO(255, 181, 181, 1.0);
  int red3 = color3.red;
  int green3 = color3.green;
  int blue3 = color3.blue;
  double opacity3 = color3.opacity;
  print("color3: " +
      "    red: " +
      red3.toString() +
      "    green: " +
      green3.toString() +
      "    blue: " +
      blue3.toString() +
      "    " +
      opacity3.toString()); //  red: 255    green: 181    blue: 181    1.0

  // 方式4： 参数3：从0.0到1.0
  // 算法：a + (b - a) * t
  // 从红色到蓝色，线性插值系数为0.5
  Color color4 = Color.lerp(new Color(0x88FF0000), new Color(0x880000FF), 0.5);
  int alpha4 = color4.alpha;
  int red4 = color4.red;
  int green4 = color4.green;
  int blue4 = color4.blue;
  double opacity4 = color4.opacity;
  print("color4: " +
      "    alpha: " +
      alpha4.toString() +
      "    red: " +
      red4.toString() +
      "    green: " +
      green4.toString() +
      "    blue: " +
      blue4.toString() +
      "    opacity:" +
      opacity4
          .toString()); // alpha: 136    red: 127    green: 0    blue: 127    opacity:0.5333333333333333

  // 方式5：把前景色作为透明色盖在背景色上面
  Color color5 = Color.alphaBlend(new Color(0x88FF0000), new Color(0x880000FF));
  int alpha5 = color5.alpha;
  int red5 = color5.red;
  int green5 = color5.green;
  int blue5 = color5.blue;
  double opacity5 = color4.opacity;
  print("color5: " +
      "    alpha: " +
      alpha5.toString() +
      "    red: " +
      red5.toString() +
      "    green: " +
      green5.toString() +
      "    blue: " +
      blue5.toString() +
      "    opacity:" +
      opacity5
          .toString()); // alpha: 199    red: 174    green: 0    blue: 80    opacity:0.5333333333333333

  // 颜色的亮度 0是最暗，1是最亮
  Color color6 = new Color(0x88FF0000);
  double computeLuminance = color.computeLuminance();
  print("color6: " + computeLuminance.toString()); // 0.5764394295278801

  // 替换掉原来颜色中的 alpha 值
  color6.withAlpha(100);
  // 替换掉原来颜色中的 red 值
  color6.withRed(100);
  // 替换掉原来颜色中的 green 值
  color6.withGreen(100);
  // 替换掉原来颜色中的 blue 值
  color6.withBlue(100);
  // 替换掉原来颜色中的 opacity 值
  color6.withOpacity(0.8);
  
  
  // 测试 fromRGBA 的用法
  Color rgbaColor = fromRGBA(255, 181, 181, 255);
  int red7 = rgbaColor.red;
  int green7 = rgbaColor.green;
  int blue7 = rgbaColor.blue;
  int alpha7 = rgbaColor.alpha;
  print("rgbaColor: " +
      "    red: " +
      red7.toString() +
      "    green: " +
      green7.toString() +
      "    blue: " +
      blue7.toString() +
       "   alpha: " +
      alpha7.toString()); // red: 255    green: 181    blue: 181  alpha: 255
}

// 设置把原有的ARGB方式转换成 RGBA，更符合某一些人的使用习惯
Color fromRGBA(int red, int green, int blue, int alpha){
  // 方式2：  参数4为：不透明度（0是完全透明，255是完全不透明）
  Color color2 = Color.fromARGB(255, 255, 181, 181);
  int alpha2 = color2.alpha;
  int red2 = color2.red;
  int green2 = color2.green;
  int blue2 = color2.blue;
  print("color2: " +
      "    alpha: " +
      alpha1.toString() +
      "    red: " +
      red2.toString() +
      "    green: " +
      green2.toString() +
      "    blue: " +
      blue2.toString()); // alpha: 255    red: 255    green: 181    blue: 181
}
