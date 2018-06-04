import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Product {
  const Product({this.name});

  final String name;
}

typedef void CartChangedCallback(Product p, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({this.product, this.inCart, this.onCartChanged});

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    // 默认是主题颜色，选中状态是deepPurpleAccent
    return inCart
        ? Colors.deepPurpleAccent
        : Theme.of(context).primaryColorDark;
  }

  /// type: 用于区分是图形还是文字 0表示图形标识
  /// style：用于区分图形和文字哪个要绘制删除线，0表示需要给文字添加删除线。
  TextStyle _getTextStyle(BuildContext context, int type, int style) {
    if (!inCart) {
      //默认的状态
      return new TextStyle(
        color: type == 0 ? Colors.white : Theme.of(context).primaryColor,
        fontSize: 20.0,
      );
    } else {
      //选中状态
      return new TextStyle(
        color: type == 0 ? Colors.white : Colors.purpleAccent, //字体颜色
        decoration: style == 0 ? TextDecoration.lineThrough : null, //删除线
        decorationColor: style == 0 ? Colors.purple : null, //删除线颜色
        fontSize: 20.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
        Fluttertoast.showToast(
          msg: "点击了：" + "${product.name}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      },
      leading: new CircleAvatar(
        //左边的圆形标识
        backgroundColor: _getColor(context), //背景颜色
        child: new Text(product.name[0], //文字内容
            style: _getTextStyle(context, 0, 1)), //文字格式
      ),
      title: new Text(product.name, // 文字内容
          style: _getTextStyle(context, 1, 0)), //文字格式
    );
  }
}
