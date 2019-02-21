void main() {
  int a = 10;
  int b = 15;
  while (a > 5) {
    if (b > 5) {
      print(a);
      break;
    }
  }

  while (a > 5) {
    if (b < 10) {
      print(b);
      continue;
    }
  }
}
