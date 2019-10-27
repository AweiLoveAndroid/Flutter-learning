import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FRouter extends StatefulWidget {
  // 是否是首页 默认为非首页
  bool isFirstPage;

  // 是否显示AppBar
  bool isShowAppBar;

  Widget child;
  String title;
  ThemeData theme;
  ThemeData darkTheme;
  Color color;
  GlobalKey<NavigatorState> navigatorKey;
  GenerateAppTitle onGenerateTitle;

  // 路由集合 所有的路由跳转都放在这里集中管理
  Map<String, WidgetBuilder> routes;
  ThemeMode themeMode;

  // 默认初始路由
  String initialRoute = '/';
  RouteFactory onGenerateRoute;
  RouteFactory onUnknownRoute;
  List<NavigatorObserver> navigatorObservers;
  TransitionBuilder builder;
  Locale locale;
  Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  LocaleListResolutionCallback localeListResolutionCallback;
  LocaleResolutionCallback localeResolutionCallback;
  Iterable<Locale> supportedLocales;
  bool debugShowMaterialGrid;
  bool showPerformanceOverlay;
  bool checkerboardRasterCacheImages;
  bool checkerboardOffscreenLayers;
  bool showSemanticsDebugger;
  bool debugShowCheckedModeBanner;

  // AppBar有关
  Widget appBarleading;
  bool automaticallyImplyLeading;
  Widget appBarTitle;
  List<Widget> appBarActions;
  Widget appBarFlexibleSpace;
  PreferredSizeWidget appBarBottom;
  double appBarElevation;
  ShapeBorder appBarShape;
  Color appBarBackgroundColor;
  Brightness appBarBrightness;
  IconThemeData appBarIconTheme;
  IconThemeData appBarActionsIconTheme;
  TextTheme appBarTextTheme;
  bool appBarPrimary;
  bool appBarCenterTitle;
  double appBarTitleSpacing = NavigationToolbar.kMiddleSpacing;
  double appBarToolbarOpacity;
  double appBarBottomOpacity;

  // Scaffod有关
  Widget body;
  Widget floatingActionButton;
  FloatingActionButtonLocation floatingActionButtonLocation;
  FloatingActionButtonAnimator floatingActionButtonAnimator;
  List<Widget> persistentFooterButtons;
  Widget drawer;
  Widget endDrawer;
  Color drawerScrimColor;
  double drawerEdgeDragWidth;
  DragStartBehavior drawerDragStartBehavior;
  Color backgroundColor;
  Widget bottomNavigationBar;
  Widget bottomSheet;
  bool resizeToAvoidBottomPadding;
  bool resizeToAvoidBottomInset;
  bool primary;

  bool extendBody;

  FRouter({
    Key key,
    this.isFirstPage = false,
    this.isShowAppBar = false,
    this.child,
    this.title = '',
    this.theme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.color,
    // 路由有关
    this.navigatorKey,
    this.onGenerateTitle,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    // 本地化有关
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    // debug有关
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,

    // AppBar有关
    this.appBarleading,
    this.automaticallyImplyLeading = true,
    this.appBarTitle,
    this.appBarActions,
    this.appBarFlexibleSpace,
    this.appBarBottom,
    this.appBarElevation,
    this.appBarShape,
    this.appBarBackgroundColor,
    this.appBarBrightness,
    this.appBarIconTheme,
    this.appBarActionsIconTheme,
    this.appBarTextTheme,
    this.appBarPrimary = true,
    this.appBarCenterTitle,
    this.appBarTitleSpacing = NavigationToolbar.kMiddleSpacing,
    this.appBarToolbarOpacity = 1.0,
    this.appBarBottomOpacity = 1.0,

    // Scaffod有关
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomPadding,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
  })  : assert(isFirstPage != null),
        assert(isShowAppBar != null),
  //        MaterialApp 有关
        assert(routes != null),
        assert(navigatorObservers != null),
        assert(title != null),
        assert(debugShowMaterialGrid != null),
        assert(showPerformanceOverlay != null),
        assert(checkerboardRasterCacheImages != null),
        assert(checkerboardOffscreenLayers != null),
        assert(showSemanticsDebugger != null),
        assert(debugShowCheckedModeBanner != null),
  //        appbar有关
        assert(automaticallyImplyLeading != null),
        assert(appBarElevation == null || appBarElevation >= 0.0),
        assert(appBarPrimary != null),
        assert(appBarTitleSpacing != null),
        assert(appBarToolbarOpacity != null),
        assert(appBarBottomOpacity != null),
  //        Scaffold 有关
        assert(primary != null),
        assert(extendBody != null),
        assert(drawerDragStartBehavior != null),
        super(key: key);

  @override
  FRouterState createState() => FRouterState();

  /// 发送路由到新页面
  static sendRouterPage(BuildContext context, Widget page) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  /// 发送命名路由 这个需要配合 [routes] 属性使用
  static sendRouter(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  get getDatas => routes;

  set setDatas(Map<String, WidgetBuilder> datas) => datas = routes;

  /// 返回上个页面的路由  参数2：要传递给上个页面的数据
  static backPageRouter<T extends Object>(BuildContext context, {T backData}) {
    Navigator.of(context).pop(backData);
  }

  /// 接收路由返回的数据 参数2：路由名称
  Future<T> receiverRouterData<T extends Object>(
      BuildContext context, String routeName) async {
    var data = await Navigator.of(context).pushNamed(routeName);
    return data;
  }
}

class FRouterState extends State<FRouter> {
  @override
  Widget build(BuildContext context) {
    if (widget.isFirstPage == true) {
      return MaterialApp(
        home: widget.isShowAppBar == true
            ? Scaffold(
          appBar: AppBar(
            key: widget.key,
            leading: widget.appBarleading,
            automaticallyImplyLeading: widget.automaticallyImplyLeading,
            title: widget.appBarTitle,
            actions: widget.appBarActions,
            flexibleSpace: widget.appBarFlexibleSpace,
            bottom: widget.appBarBottom,
            elevation: widget.appBarElevation,
            shape: widget.appBarShape,
            backgroundColor: widget.appBarBackgroundColor,
            brightness: widget.appBarBrightness,
            iconTheme: widget.appBarIconTheme,
            actionsIconTheme: widget.appBarActionsIconTheme,
            textTheme: widget.appBarTextTheme,
            primary: widget.appBarPrimary,
            centerTitle: widget.appBarCenterTitle,
            titleSpacing: widget.appBarTitleSpacing,
            toolbarOpacity: widget.appBarToolbarOpacity,
            bottomOpacity: widget.appBarBottomOpacity,
          ),
          body: widget.body,
          floatingActionButton: widget.floatingActionButton,
          floatingActionButtonLocation:
          widget.floatingActionButtonLocation,
          floatingActionButtonAnimator:
          widget.floatingActionButtonAnimator,
          persistentFooterButtons: widget.persistentFooterButtons,
          drawer: widget.drawer,
          endDrawer: widget.endDrawer,
          bottomNavigationBar: widget.bottomNavigationBar,
          bottomSheet: widget.bottomSheet,
          backgroundColor: widget.backgroundColor,
          resizeToAvoidBottomPadding: widget.resizeToAvoidBottomPadding,
          resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
          primary: widget.primary,
          drawerDragStartBehavior: widget.drawerDragStartBehavior,
          extendBody: widget.extendBody,
          drawerScrimColor: widget.drawerScrimColor,
          drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
        )
            : widget.child,
        title: widget.title,
        theme: widget.theme,
        darkTheme: widget.darkTheme,
        themeMode: widget.themeMode,
        color: widget.color,
        navigatorKey: widget.navigatorKey,
        onGenerateTitle: widget.onGenerateTitle,
        routes: widget.routes,
        initialRoute: widget.initialRoute,
        onGenerateRoute: widget.onGenerateRoute,
        onUnknownRoute: widget.onUnknownRoute,
        navigatorObservers: widget.navigatorObservers,
        builder: widget.builder,
        locale: widget.locale,
        localizationsDelegates: widget.localizationsDelegates,
        localeListResolutionCallback: widget.localeListResolutionCallback,
        localeResolutionCallback: widget.localeResolutionCallback,
        supportedLocales: widget.supportedLocales,
        debugShowMaterialGrid: widget.debugShowMaterialGrid,
        showPerformanceOverlay: widget.showPerformanceOverlay,
        checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
        showSemanticsDebugger: widget.showSemanticsDebugger,
        debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      );
    } else {
      widget.isShowAppBar == true
          ? Scaffold(
        appBar: AppBar(
          key: widget.key,
          leading: widget.appBarleading,
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
          title: widget.appBarTitle,
          actions: widget.appBarActions,
          flexibleSpace: widget.appBarFlexibleSpace,
          bottom: widget.appBarBottom,
          elevation: widget.appBarElevation,
          shape: widget.appBarShape,
          backgroundColor: widget.appBarBackgroundColor,
          brightness: widget.appBarBrightness,
          iconTheme: widget.appBarIconTheme,
          actionsIconTheme: widget.appBarActionsIconTheme,
          textTheme: widget.appBarTextTheme,
          primary: widget.appBarPrimary,
          centerTitle: widget.appBarCenterTitle,
          titleSpacing: widget.appBarTitleSpacing,
          toolbarOpacity: widget.appBarToolbarOpacity,
          bottomOpacity: widget.appBarBottomOpacity,
        ),
        body: widget.body,
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
        persistentFooterButtons: widget.persistentFooterButtons,
        drawer: widget.drawer,
        endDrawer: widget.endDrawer,
        bottomNavigationBar: widget.bottomNavigationBar,
        bottomSheet: widget.bottomSheet,
        backgroundColor: widget.backgroundColor,
        resizeToAvoidBottomPadding: widget.resizeToAvoidBottomPadding,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        primary: widget.primary,
        drawerDragStartBehavior: widget.drawerDragStartBehavior,
        extendBody: widget.extendBody,
        drawerScrimColor: widget.drawerScrimColor,
        drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
      )
          : widget.child;
    }
  }
}
