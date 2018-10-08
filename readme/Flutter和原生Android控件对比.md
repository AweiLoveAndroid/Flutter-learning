Flutter和原生Android控件对比：

Flutter控件|Android控件
-|-
AppBar|ActionBar/ToolBar
ListView|ListView/RecyclerView
Text|TextView
Center|ViewGroup
FloatingActionButton|FloatingActionButton(design库里面的)
BottomNavigationBar|BottomNavigation(design库里面的)
RaisedButton/Button|Button
Column|LinearLayout的android:orientation="vertical"
Row|android:orientation="horizontal"
DecorationImage|ImageView
Image|ImageView
Stack|FrameLayout/RelativeLayout
Container|RelativeLayout
CustomMultiChildLayout|RelativeLayout
Algin|alginParentXXX属性
resizeToAvoidBottomPadding|android:windowSoftInputMode=”adjustResize属性
SingleChildScrollView|ScrollView
CustomScrollerView|Recyclerview


----


Image里面的BoxFit参数介绍：（相当于Android的ImageView的scaleType参数）
  
// fill 通过篡改原始宽高比来填充目标box

![](https://flutter.github.io/assets-for-api-docs/assets/painting/box_fit_fill.png)


/// contain 在尽可能大的情况下，仍然将源完全包含在目标框中。

![](https://flutter.github.io/assets-for-api-docs/assets/painting/box_fit_contain.png)

/// cover 尽可能小，同时仍然覆盖整个目标框。

![](https://flutter.github.io/assets-for-api-docs/assets/painting/box_fit_cover.png)

/// fitWidth 确保显示源的全部宽度，而不管这是否意味着源垂直溢出目标框。

![](https://flutter.github.io/assets-for-api-docs/assets/painting/box_fit_fitWidth.png)

/// fitHeight 确保显示源的全部高度，而不管这是否意味着源水平地溢出目标框。

![](https://flutter.github.io/assets-for-api-docs/assets/painting/box_fit_fitHeight.png)

  /// none 在目标框中对齐源（默认为居中），并放弃位于框外的源的任何部分。源图像未调整大小。

![](https://flutter.github.io/assets-for-api-docs/assets/painting/box_fit_none.png)

/// scaleDown 在目标框中对齐源(默认为居中)，如果需要，将源缩小以确保源适合该框。这与contain的内容相同，如果该内容会收缩图像，那么它就是none。

![](https://flutter.github.io/assets-for-api-docs/assets/painting/box_fit_scaleDown.png)

