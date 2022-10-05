import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/home/tabbar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
              color: Theme.of(context)
                  .scaffoldBackgroundColor),
          tabBarTheme: const TabBarTheme(
              labelColor: CupertinoColors.activeBlue,
              unselectedLabelColor:
                  CupertinoColors.inactiveGray)),
      home: TabbarView(),
    );
  }
}
