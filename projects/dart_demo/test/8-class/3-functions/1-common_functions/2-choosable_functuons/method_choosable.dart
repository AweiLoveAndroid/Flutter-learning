
// 可选参数使用： 
void main() {


  // 普通参数使用：

  //你随意使用其中的参数都是可以的，例如我使用了其中的参数1，参数4和参数5
  work2(address:'hangzhou', workTime:'9:00-5:00', workerNumbers:500);

  // 可选参数使用：

  // 缺一个参数都会报错
  work('hangzhou','XXCompany',1000000.00,'9:00-5:00',500);
}



// 工作：地址、公司名、工资、工作时长、公司人数
void work(String address, String cpompany, double money, String workTime,
  int workerNumbers) {
  //TODO:... 
}

// 设置了可选参数
void work2({String address, String cpompany, double money, String workTime,
  int workerNumbers}) {
  //TODO:... 
}