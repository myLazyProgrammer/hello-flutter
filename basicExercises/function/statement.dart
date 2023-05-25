bool isNoble(int atomicNumber) {
  return _noblegased[atomicNumber] != null;
}

typedef bool CALLBACK();
void test(CALLBACK cb){
   print(cb()); 
}
//报错，isNoble不是bool类型
test(isNoble);



// 可以使用箭头函数简写
bool isNoble () => true;