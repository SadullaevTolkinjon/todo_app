import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_test_app/core/constants/constant.dart';
import 'package:to_do_test_app/core/model/model.dart';
import 'package:to_do_test_app/core/utils/routes/routes.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<NotesModel>("notes");
  Hive.registerAdapter(NotesModelAdapter());
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
