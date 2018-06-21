// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';

/// 本示例来源于官方文档

/// 这里显示了一个与应用程序特定的 ListModel 保持同步的卡片列表，
/// 当条item被添加到model或从model中删除时，相应的卡片会以动画的方式在UI中插入或移除。
/// 点击一个条目选择它，再次点击取消选择。点击’+’在选定条目插入一个条目，点击’-‘移除选定条目。
/// tap 处理器添加或删除 ListModel<E> 中的条目，这是 List<E> 的简单封装，可使 AnimatedList 保持同步。
/// 列表模型为其动画列表提供了一个 GlobalKey ，它使用该键来调用由 AnimatedListState 定义的 insertItem 和 removeItem 方法。
void main() {
  runApp(new AnimatedListSample());
}

class AnimatedListSample extends StatefulWidget {
  @override
  _AnimatedListSampleState createState() => new _AnimatedListSampleState();
}

class _AnimatedListSampleState extends State<AnimatedListSample> {
  final GlobalKey<AnimatedListState> _listKey =
      new GlobalKey<AnimatedListState>();
  ListModel<int> _list;
  int _selectedItem;
  int _nextItem; // 当用户按下“+”按钮时插入的下一个item。

  @override
  void initState() {
    super.initState();
    _list = new ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 3;
  }

  /// 在从列表中删除后，用于构建项目。
  /// 这个方法是必需的，因为移除的item在动画完成之前是可见的(尽管它已经在这个列表模型中消失了)。
  /// 控件被 [AnimatedListState.removeItem] 方法的 [AnimatedListRemovedItemBuilder] 参数所调用。
  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: item,
      selected: false,
      //这里没有手势检测:我们不希望删除的项目是交互式的。
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('AnimatedList'),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: _insert,
              tooltip: 'insert a new item',
            ),
            new IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: _remove,
              tooltip: 'remove the selected item',
            ),
          ],
        ),
        body: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new AnimatedList(
            key: _listKey,
            initialItemCount: _list.length,
            itemBuilder: _buildItem,
          ),
        ),
      ),
    );
  }

  // 插入下一个item到列表model中
  void _insert() {
    final int index =
        _selectedItem == null ? _list.length : _list.indexOf(_selectedItem);
    _list.insert(index, _nextItem++);
  }

  // 从列表model中移除选中的item
  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem));
      setState(() {
        _selectedItem = null;
      });
    }
  }

  /// 用于构建未被删除的item。
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }
}

/// 将Dart的List与动画列表保持同步。
/// [insert]和[removeAt]方法应用于内部列表和属于[listKey]的动画列表。
/// 这个类只公开示例应用程序所需的Dart列表API。很容易添加更多的列表方法，
/// 但是修改列表的方法必须按照[AnimatedListState.insertItem]和[AnimatedList.removeItem]对动画列表进行相同的更改。
class ListModel<E> {
  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  ListModel({
    @required this.listKey,
    @required this.removedItemBuilder,
    Iterable<E> initialItems,
  })  : assert(listKey != null),
        assert(removedItemBuilder != null),
        _items = new List<E>.from(initialItems ?? <E>[]);

  AnimatedListState get _animatedList => listKey.currentState;

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      // 匿名函数，省去参数类型也是可以的。
      // 相当于 _animatedList.removeItem(index, (BuildContext context, Animation<double> animation) {
      _animatedList.removeItem(index, (context, animation) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }
}

/// 将其整数项显示为“item N”，其颜色基于该item的值。如果选择为true，文本将显示为teal颜色。
/// 这个控件的高度（高度是128，我们传入的）基于动画参数（这个值介于0到128之间），因为动画从0.0到1.0不等。
class CardItem extends StatelessWidget {
  // 动画
  final Animation<double> animation;

  // 监听事件
  final VoidCallback onTap;

  // item
  final int item;

  // 是否选中
  final bool selected;

  const CardItem(
      {Key key,
      @required this.animation,
      this.onTap,
      @required this.item,
      this.selected: false})
      : assert(animation != null),
        assert(item != null && item >= 0),
        assert(selected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected) {
      textStyle = textStyle.copyWith(color: Colors.teal);
    }
    return new Padding(
      padding: const EdgeInsets.all(2.0),
      child: new SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        child: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: new SizedBox(
            height: 128.0,
            child: new Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: new Center(
                child: new Text('Item $item', style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
