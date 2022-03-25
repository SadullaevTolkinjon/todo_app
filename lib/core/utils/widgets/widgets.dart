import 'package:flutter/material.dart';
import 'package:to_do_test_app/core/constants/constant.dart';
import 'package:to_do_test_app/core/utils/size_config/size_config.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(106),
      width: getWidth(339),
      decoration: BoxDecoration(
          color: ConstantsMy.reminderColor,
          borderRadius: BorderRadius.circular(getHeight(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: getWidth(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today Reminder",
                  style: TextStyle(
                      fontSize: getHeight(20),
                      color: ConstantsMy.whiteColortext),
                ),
                Text(
                  "Meeting with client",
                  style: TextStyle(
                      color: ConstantsMy.whiteColortext,
                      fontSize: getHeight(11)),
                ),
                Text(
                  "13.00 PM",
                  style: TextStyle(
                    color: ConstantsMy.whiteColortext,
                    fontSize: getHeight(11),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                Icons.close_rounded,
                size: getHeight(15),
                color: ConstantsMy.whiteColortext,
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: getWidth(30), top: getHeight(10)),
                child: SizedBox(
                  height: getHeight(66),
                  width: getWidth(52),
                  child: Image.asset("assets/images/bell.png"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
