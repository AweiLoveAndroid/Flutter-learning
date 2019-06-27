// 测试一下 把数字转成中文金额大写
void main() {
  //  输出结果：
  //  转换前数字： 45.12
  //  转换后的中文大写： 肆拾伍元壹角贰分
  //
  //  转换前数字： 97953164651665.123
  //  转换后的中文大写： 玖拾柒万玖仟伍佰叁拾壹亿陆仟肆佰陆拾伍万壹仟陆佰陆拾伍元壹角贰分叁厘
  //
  //  转换前数字： 25000
  //  转换后的中文大写： 贰万伍仟元
  //
  //  转换前数字： 363,5
  //  转换后的中文大写： 叁仟陆佰叁拾伍元

  String number = "45.12";
  ConvertNumberToChineseMoneyWords numbers =
      new ConvertNumberToChineseMoneyWords();
  print("转换前数字： " + number + " ，转换后的中文大写： " + numbers.toChinese(number) + "\n");
  number = "97953164651665.123";
  print("转换前数字： " + number + " ，转换后的中文大写： " + numbers.toChinese(number) + "\n");
  number = "25000";
  print("转换前数字： " + number + " ，转换后的中文大写： " + numbers.toChinese(number) + "\n");
  number = "363,5";
  print("转换前数字： " + number + " ，转换后的中文大写： " + numbers.toChinese(number) + "\n");
}


//////////////////////////////////////////////////////////////////////////////////
/////////
/////////     以下才是工具类的完整内容   
////////
//////////////////////////////////////////////////////////////////////////////////


/*
 * 把数字转换成中文金额大写工具类
 */
class ConvertNumberToChineseMoneyWords {
  // 大写数字
  List<String> NUMBERS = ["零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"];

  // 整数部分的单位
  List<String> IUNIT = [
    "元",
    "拾",
    "佰",
    "仟",
    "万",
    "拾",
    "佰",
    "仟",
    "亿",
    "拾",
    "佰",
    "仟",
    "万",
    "拾",
    "佰",
    "仟"
  ];

  // 小数部分的单位
  List<String> DUNIT = ["角", "分", "厘"];

  //转成中文的大写金额
  String toChinese(String str) {
    if (str == "0" || str == "0.00") {
      return "零元";
    }
    // 去掉","
    str = str.replaceAll(",", "");
    // 整数部分数字
    String integerStr;
    // 小数部分数字
    String decimalStr;

    // 初始化：分离整数部分和小数部分
    if (str.indexOf(".") > 0) {
      integerStr = str.substring(0, str.indexOf("."));
      decimalStr = str.substring(str.indexOf(".") + 1);
    } else if (str.indexOf(".") == 0) {
      integerStr = "";
      decimalStr = str.substring(1);
    } else {
      integerStr = str;
      decimalStr = "";
    }

    // 超出计算能力，直接返回
    if (integerStr.length > IUNIT.length) {
      print(str + "：超出计算能力");
      return str;
    }

    // 整数部分数字
    var integers = toIntArray(integerStr);
    // 设置万单位
    bool isWan = isWanYuan(integerStr);
    // 小数部分数字
    var decimals = toIntArray(decimalStr);
    // 返回最终的大写金额
    return getChineseInteger(integers, isWan) + getChineseDecimal(decimals);
  }

  // 将字符串转为int数组
  static List<int> toIntArray(String number) {
    List<int> array = [];
    if (array.length > number.length) {
      throw new Exception("数组越界异常");
    } else {
      for (int i = 0; i < number.length; i++) {
        array.insert(i, int.parse(number.substring(i, i + 1)));
      }
      return array;
    }
  }

  // 判断当前整数部分是否已经是达到【万】
  static bool isWanYuan(String integerStr) {
    int length = integerStr.length;
    if (length > 4) {
      String subInteger = "";
      if (length > 8) {
        subInteger = integerStr.substring(length - 8, length - 4);
      } else {
        subInteger = integerStr.substring(0, length - 4);
      }
      return int.parse(subInteger) > 0;
    } else {
      return false;
    }
  }

  // 将整数部分转为大写的金额
  String getChineseInteger(var integers, bool isWan) {
    StringBuffer chineseInteger = new StringBuffer("");
    int length = integers.length;
    for (int i = 0; i < length; i++) {
      String key = "";
      if (integers[i] == 0) {
        // 万（亿）
        if ((length - i) == 13)
          key = IUNIT[4];
        else if ((length - i) == 9) {
          // 亿
          key = IUNIT[8];
        } else if ((length - i) == 5 && isWan) {
          // 万
          key = IUNIT[4];
        } else if ((length - i) == 1) {
          // 元
          key = IUNIT[0];
        }
        if ((length - i) > 1 && integers[i + 1] != 0) {
          key += NUMBERS[0];
        }
      }
      chineseInteger.write(integers[i] == 0
          ? key
          : (NUMBERS[integers[i]] + IUNIT[length - i - 1]));
    }
    return chineseInteger.toString();
  }

  // 将小数部分转为大写的金额
  String getChineseDecimal(var decimals) {
    StringBuffer chineseDecimal = new StringBuffer("");
    for (int i = 0; i < decimals.length; i++) {
      if (i == 3) {
        break;
      }
      chineseDecimal
          .write(decimals[i] == 0 ? "" : (NUMBERS[decimals[i]] + DUNIT[i]));
    }
    return chineseDecimal.toString();
  }
}
