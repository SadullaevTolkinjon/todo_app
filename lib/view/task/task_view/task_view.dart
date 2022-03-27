import 'package:flutter/material.dart';
import 'package:to_do_test_app/core/constants/constant.dart';
import 'package:to_do_test_app/core/data/local_data/local_data.dart';
import 'package:to_do_test_app/core/utils/size_config/size_config.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(500),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: getHeight(20),
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: getWidth(18), right: getWidth(20)),
            child: Container(
              height: getHeight(180),
              width: getWidth(160),
              decoration: BoxDecoration(
                color: ConstantsMy.scaffoldBackColor,
                boxShadow: [
                  BoxShadow(
                      color: ConstantsMy.boxShadColor,
                      offset: const Offset(4, 4),
                      blurRadius: 10,
                      spreadRadius: 5)
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: getHeight(40),
                    child: Image.asset(taskData[index]["rasm"].toString()),
                    backgroundColor: taskData[index]["rang"],
                  ),
                  Text(
                    taskData[index]["name"],
                    style: TextStyle(
                        fontSize: getHeight(17),
                        color: ConstantsMy.textColorKok),
                  ),
                  SizedBox(
                    height: getHeight(25),
                  ),
                  Text(
                    "${taskData[index]["task"]} Task",
                    style: TextStyle(
                        fontSize: getHeight(11),
                        color: ConstantsMy.litleTextColor),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: taskData.length,
      ),
    );
  }
}
