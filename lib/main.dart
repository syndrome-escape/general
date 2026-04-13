import 'package:flutter/material.dart';
import 'package:for_global/umumiy_balance/balance_page.dart';
import 'beeline/main_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: balancepage(),
    );
  }
}
