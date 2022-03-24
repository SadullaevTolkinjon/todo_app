import 'package:flutter/material.dart';
import 'package:to_do_test_app/core/constants/constant.dart';
import 'package:to_do_test_app/core/utils/size_config/size_config.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: getWidth(100), top: getHeight(180)),
              child: SizedBox(
                height: getHeight(196),
                width: getWidth(180),
                child: Image.asset("assets/images/initail.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: getHeight(80), left: getWidth(62)),
              child: Text(
                "Reminders made simple",
                style: TextStyle(
                    color: ConstantsMy.textColorKok, fontSize: getHeight(22)),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: getWidth(62),top: getHeight(170)),
              
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize:Size(getWidth(258), getHeight(56))
                ),
                  onPressed: () {}, child: const Text("Get Started"),),
            )
          ],
        ),
      ),
    );
  }
}
