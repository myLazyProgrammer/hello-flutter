void main() {
  Stream.fromFuture([
    Future.delayed(Duration(seconds: 1), () {
      return 'hello 1'
    }),
    Future.delayed(Duration(seconds: 2), () {
      throw AssertionError('Error')
    }),
    Future.delayed(Duration(seconds: 3), () {
      return 'hello 3'
    })
  ]).listen((event) { 
    print(event);
  }, onError: (e) {
    print(e.message);
  }, onDone: () {
    
  });
}