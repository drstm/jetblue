import 'package:flutter/material.dart';
import 'pages/main_page.dart';
import 'pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    MainPage.tag: (context) => MainPage(),
  };
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Hack'
        )
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}