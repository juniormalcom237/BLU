import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:openxtech_starter/Application/Features/business_logic/generate_code.dart';
import 'package:openxtech_starter/Application/Features/http/code.dart';
import 'package:openxtech_starter/Application/Features/login/presentation/login.dart';
import 'package:provider/provider.dart';

import 'Application/Features/data_layer/code_data.dart';

Future<void> main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  var value;
  void initState() {
    // TODO: implement initState
    super.initState();
    // value =  Future.value(Database().getPrivateKey()).then((value) => );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Database()),
        FutureProvider<String>(
            create: (ctx) => Database().getPrivateKey(), initialData: '')
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<String>(
          builder: (ctx, data, child) {
            if (data == "") {
              return MyHomePage(title: "Home");
            } else {
              return LoginScreen();
            }
          },
        ),
        routes: {
          LoginScreen.url: (ctx) => LoginScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    Navigator.of(context).pushNamed(LoginScreen.url);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlueGenerator.generateRandomString();

    Keys().fetchPrivateKey();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(LoginScreen.url);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
