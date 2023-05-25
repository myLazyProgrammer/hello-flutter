// 默认定义 不为空
int i = 8;

// 定义可为空类型,对于可空变量,使用前必须判空
int? j;

class Test {
  int? i;
  Function? fun;
  say() {
    if (i != null) {
      print(i!*8); //因为已经判定过空,所以可以使用!来告诉预处理器不为空
    }

    // 如果fun不为空 则调用函数
    fun?.call();
  }
}