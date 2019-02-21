import '1-create_mixin.dart';

// 使用mixin

void main() {
  // 姓名：张三
  // 发现和解决难题
  // 精通数据结构和算法
  // 会架构设计
  ACompanySoftwareArchitect architect1 = new ACompanySoftwareArchitect('张三');
  architect1.develop();
  print('====');
  // 姓名：李四
  // 发现和解决难题
  // 精通数据结构和算法
  // 会架构设计
  // 熟练掌握性能优化
  // 熟练掌握计算机系统
  // 有效率的
  // 和蔼的
  BCompanySoftwareArchitect architect2 = new BCompanySoftwareArchitect('李四');
  architect2.develop();
  architect2.getEfficientAttrs();
  architect2.getKindAttrs();
}


// 使用mixin

// A公司的软件架构师，继承自软件架构师，拥有专家的特性。
class ACompanySoftwareArchitect extends SoftwareArchitect with Expert {
  String name;
  ACompanySoftwareArchitect(String name) {
    this.name = name;
    print('姓名：' + name);
    solveProblems = true;
    dataStructureAndAlgorithms = true;
    architectureDesign = true;
  }

  @override
  void develop() {
    super.develop();
  }
}

//  B公司的软件架构师，继承自软件架构师，
class BCompanySoftwareArchitect extends SoftwareArchitect
    with Expert, Efficient, Kind {
  String name;

  BCompanySoftwareArchitect(String name) {
    this.name = name;
    print('姓名：' + name);
    solveProblems = true;
    dataStructureAndAlgorithms = true;
    architectureDesign = true;
    performanceOptimization = true;
    computerSystem = true;
  }
}