import 'package:flutter/material.dart';
import 'package:openxtech_starter/Application/Features/data_layer/code_data.dart';

import 'package:openxtech_starter/main.dart';
import 'package:provider/provider.dart';

import '../Features/login/presentation/login.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Database(),
        ),
        FutureProvider<String>(
          create: (ctx) => Future.value(Database().getPrivateKey()),
          initialData: "",
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<String>(
          builder: (ctx, data, child) {
            if (data == "") {
              return LoginScreen1();
            } else {
              return LoginScreen1();
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
