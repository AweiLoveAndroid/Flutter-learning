// mixin


// 声明mixin

// 专家
mixin Expert {
  // 发现和解决难题
  bool solveProblems = false;

  // 精通数据结构和算法
  bool dataStructureAndAlgorithms = false;

  // 会架构设计
  bool architectureDesign = false;

  // 性能优化
  bool performanceOptimization = false;

  // 熟练掌握计算机系统
  bool computerSystem = false;

  void develop() {
    // 娱乐节目
    if (solveProblems) {
      print('发现和解决难题');
    }
    if (dataStructureAndAlgorithms) {
      print('精通数据结构和算法');
    }
    if (architectureDesign) {
      print('会架构设计');
    }
    if (performanceOptimization) {
      print('熟练掌握性能优化');
    }
    if (computerSystem) {
      print('熟练掌握计算机系统');
    }
  }
}

// 特性

// 有效率的
mixin Efficient {
  void getEfficientAttrs() {
    print('有效率的');
  }
}

// 和蔼的
mixin Kind {
  void getKindAttrs() {
    print('和蔼的');
  }
}

// 软件架构师
class SoftwareArchitect {
  SoftwareArchitect() {
    print('软件架构师');
  }
}