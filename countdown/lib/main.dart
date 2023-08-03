import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const GetStateObjectRoute(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        child: Builder(builder: (context) {
          Scaffold? scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
          
          if (scaffold != null) {
            print((scaffold.appBar as AppBar).title);
            return Text((scaffold.appBar as AppBar).title.toString());
          }
          
          return Text('暂无数据');
        },),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, this.initvalue = 0});

  final int initvalue;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.initvalue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(child: TextButton(child: Text('$_counter'), onPressed: () => setState(() {
        () => ++_counter;
      }))),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble(){
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

class StateLifecycleTest extends StatelessWidget {
  const StateLifecycleTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterWidget();
  }
}

class GetStateObjectRoute extends StatefulWidget {
  const GetStateObjectRoute({super.key});

  @override
  State<GetStateObjectRoute> createState() => _GetStateObjectRoute();
}

class _GetStateObjectRoute extends State<GetStateObjectRoute>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("子树中获取State对象"),  backgroundColor: Theme.of(context).colorScheme.inversePrimary,),
      body: Center(
        child: Column(
          children: [
            Builder(builder: (context) {
              return ElevatedButton(onPressed: () {
                  ScaffoldState? _state = context.findAncestorStateOfType<ScaffoldState>();
                  if (_state != null) {
                    _state.openDrawer();
                  }
                }, child: Text("打开抽屉菜单1")
              );
            }),
            Builder(builder: (context) {
              return ElevatedButton(onPressed: () {
                  ScaffoldState _state = Scaffold.of(context);
                  _state.openDrawer();
                }, child: Text("打开抽屉菜单2")
              );
            }),
            Builder(builder: (context) {
              return ElevatedButton(onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("我是Snackbar")),
                );
              }, child: Text("显示SnackBar"));
            })
          ],
          )
        ),
        drawer: Drawer(),
    );
  }
}

class CustonWidget extends LeafRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomObject();
  }

  @override
  void updateRenderObject(BuildContext context, RenderCustomObject renderCustomObject) {
    super.updateRenderObject(context, renderObject) 
  }
}