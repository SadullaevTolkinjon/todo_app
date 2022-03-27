import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_test_app/core/constants/constant.dart';
import 'package:to_do_test_app/core/data/local_data/local_data.dart';
import 'package:to_do_test_app/core/utils/size_config/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_test_app/view/home_page/home_page_cubit/home_page_cubit.dart';

class TaskHave extends StatelessWidget {
  const TaskHave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(18)),
      child: SizedBox(
        height: getHeight(500),
        child: SizedBox(
          height: getHeight(500),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: getHeight(55.21),
                mainAxisSpacing: getHeight(13)),
            itemBuilder: (context, index) {
              return Slidable(
                key: UniqueKey(),
                endActionPane: ActionPane(
                  children: [
                    SlidableAction(
                      onPressed: (val) {
                        context.read<HomePageCubit>().deleteIndexOfData(index);
                      },
                      backgroundColor: ConstantsMy.slideColRed,
                      foregroundColor: ConstantsMy.whiteColor,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: (val) {},
                      backgroundColor: ConstantsMy.slideColBlue,
                      foregroundColor: ConstantsMy.whiteColor,
                      icon: Icons.share,
                      label: 'Share',
                    ),
                  ],
                  motion: const ScrollMotion(),
                ),
                child: Container(
                  height: getHeight(55.21),
                  width: getWidth(339),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius:
                        BorderRadius.all(Radius.circular(getHeight(5))),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: getWidth(4),
                          height: getHeight(55),
                          color: Colors.amber,
                        ),
                        left: 0,
                      ),
                      Positioned(
                        child: Checkbox(
                          value: context
                              .watch<HomePageCubit>()
                              .checkBoxValue[index],
                          activeColor: ConstantsMy.greenGradient,
                          onChanged: (val) {
                            context
                                .read<HomePageCubit>()
                                .changeCheckboxVal(index);
                          },
                          shape: const StadiumBorder(),
                        ),
                        top: getHeight(10),
                      ),
                      Positioned(
                        child: Text(
                          "07:00 AM",
                          style: TextStyle(
                              fontSize: getHeight(11),
                              color: ConstantsMy.boxShadColor),
                        ),
                        left: getWidth(40),
                        top: getHeight(21),
                      ),
                      Positioned(
                        child: SizedBox(
                          width: getWidth(180),
                          child: AutoSizeText(
                            data[index].toString(),
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: getHeight(14),
                                color: ConstantsMy.textColorKok),
                          ),
                        ),
                        left: getWidth(100),
                        top: getHeight(19),
                      ),
                      Positioned(
                        child: SvgPicture.asset("assets/images/bel.svg"),
                        top: getHeight(21),
                        right: 10,
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: data.length,
          ),
        ),
      ),
    );
  }
}
