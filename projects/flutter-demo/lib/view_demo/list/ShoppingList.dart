import 'package:flutter/material.dart';
import 'ShoppingListItem.dart';

/// ListView 购物清单 demo
void main() {
  runApp(
    new MaterialApp(
      title: 'Flutter教程',
      home: new ShoppingList(products: _kProducts),
    ),
  );
}

// 创建Products集合
final List<Product> _kProducts = <Product>[
  new Product(name: '番茄'),
  new Product(name: '辣椒'),
  new Product(name: '茄子'),
  new Product(name: '芥蓝'),
  new Product(name: '黄瓜'),
  new Product(name: '白菜'),
  new Product(name: '西蓝花'),
  new Product(name: '韭菜'),
  new Product(name: '莲藕'),
  new Product(name: '西芹'),
  new Product(name: '土豆'),
  new Product(name: '冬瓜'),
  new Product(name: '胡瓜'),
  new Product(name: '豇豆'),
  new Product(name: '四季豆'),
  new Product(name: '红萝卜'),
  new Product(name: '白萝卜'),
  new Product(name: '胡萝卜'),
  new Product(name: '豆腐'),
  new Product(name: '山药'),
  new Product(name: '洋葱'),
  new Product(name: '豆芽'),
  new Product(name: '金针菇'),
  new Product(name: '香菇'),
];

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);
  final List<Product> products;

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('购物清单'),
        leading: new IconButton(
            icon: new Icon(Icons.menu), tooltip: '导航菜单', onPressed: null),
      ),
      body: new ListView(
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            //监听
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
