import 'package:flutter/material.dart';
import 'package:order_management_app/layout/login.dart';
import 'package:order_management_app/layout/sign_up.dart';
import 'package:order_management_app/layout/stock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ordering App',
      initialRoute: "/",
      routes: {
        "/":(BuildContext context) => const LoginPage(title:'Login'),
        "/sign_up":(BuildContext context) => const SignUpPage(title:'Sign Up'),
        "/stock":(BuildContext context) => const ItemsPage(title:'Available Stock')
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}

//**Old Widget        change to    New Widget      
//FlatButton   =>      TextButton      
//RaisedButton =>      ElevatedButton  
//OutlineButton =>    OutlinedButton**
