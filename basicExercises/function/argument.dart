// 定义函数execute 它的参数类型为函数
void execute(var callback) {
  callback();
}
execute(() => print('xxx'))

// 函数可以声明可选参数
String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

void enableFlags(bool bold, bool hidden) {
  
}
// 可以使用命名参数
enableFlags(bold: true, hidden: false);