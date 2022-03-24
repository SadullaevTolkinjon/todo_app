import 'package:flutter/material.dart';
import 'package:to_do_test_app/core/constants/constant.dart';
import 'package:to_do_test_app/core/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: ConstantsMy.fontFamilyRubik,
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) => GenrateRouterr.routeGenerate(settings),
    );
  }
}
