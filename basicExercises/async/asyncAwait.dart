Future<void> getData() async {
  try {
    String data = await getUserInfo();
    print(data);
  } catch (e) {
    print(e);
  }
}


Future<String> getUserInfo(){
	return Future.delayed(const Duration(seconds: 2), () => 'userInfo');
}



void main() {
  getData();
}