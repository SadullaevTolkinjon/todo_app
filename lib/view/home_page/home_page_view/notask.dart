import 'package:flutter/material.dart';
import 'package:to_do_test_app/core/constants/constant.dart';
import 'package:to_do_test_app/core/utils/size_config/size_config.dart';

class NoTaskPage extends StatelessWidget {
  const NoTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getWidth(500),
      child: Image.asset(ConstantsMy.noTask),
    );
  }
}
