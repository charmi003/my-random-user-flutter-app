import 'package:flutter/material.dart';
import 'package:my_random_user_app/HomePage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'My Random User App',
      debugShowCheckedModeBanner: false,
      theme:ThemeData.dark(),
      home:HomePage()
    );
  }
}