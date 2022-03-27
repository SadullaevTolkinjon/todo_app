import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:to_do_test_app/core/constants/constant.dart';
import 'package:to_do_test_app/core/data/local_data/local_data.dart';
import 'package:to_do_test_app/core/utils/size_config/size_config.dart';
import 'package:to_do_test_app/view/home_page/home_page_cubit/home_page_cubit.dart';
import 'package:to_do_test_app/view/home_page/home_page_state/home_page_state.dart';

Future<dynamic> modalSheet(BuildContext context) {
  TextEditingController notes = TextEditingController();
  return showMaterialModalBottomSheet(
    context: context,
    expand: false,
    //background color for modal bottom screen
    backgroundColor: ConstantsMy.whiteColor,
    //elevates modal bottom screen
    elevation: 10,
    // gives rounded corner to modal bottom screen
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.elliptical(170, 30),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: BlocProvider(
            create: (_) => HomePageCubit(),
            child: BlocBuilder<HomePageCubit, HomePageState>(
                builder: (context, state) {
              return SizedBox(
                height: getHeight(691),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: getWidth(141)),
                        child: FloatingActionButton(
                          backgroundColor: ConstantsMy.addIconColor,
                          onPressed: () {},
                          child: SvgPicture.asset(
                            "assets/images/add.svg",
                            color: ConstantsMy.whiteColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: getWidth(125), top: getHeight(5)),
                        child: Text(
                          "Add new task",
                          style: TextStyle(fontSize: getHeight(13)),
                        ),
                      ),
                      TextFormField(
                        controller: notes,
                        decoration: const InputDecoration(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: getHeight(22), bottom: getHeight(13)),
                        child: SizedBox(
                          height: getHeight(50),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    mainAxisSpacing: getWidth(10),
                                    mainAxisExtent: getHeight(100)),
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: context
                                              .watch<HomePageCubit>()
                                              .tapped
                                              .contains(index)
                                          ? taskData[index]["rang"]
                                          : ConstantsMy.whiteColor),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: getHeight(5),
                                          backgroundColor: taskData[index]
                                              ["rang"],
                                        ),
                                        AutoSizeText(taskData[index]["name"])
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  context
                                      .read<HomePageCubit>()
                                      .tappedFunction(index);
                                },
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: taskData.length,
                          ),
                        ),
                      ),
                      Divider(thickness: getHeight(2)),
                      Padding(
                        padding: EdgeInsets.only(top: getHeight(43)),
                        child: const Text("Choose data"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getHeight(33)),
                        child: Row(
                          children: [
                            const Text("Today, 19:00 - 21:00"),
                            SvgPicture.asset("assets/images/path.svg")
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getHeight(62)),
                        child: GestureDetector(
                          child: Container(
                            height: getHeight(53),
                            width: getWidth(323),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                ConstantsMy.blueGradient1,
                                ConstantsMy.blueGradient2
                              ]),
                              boxShadow: [
                                BoxShadow(color: ConstantsMy.taskContainerColor)
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  getHeight(5),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Add task",
                                style: TextStyle(
                                    color: ConstantsMy.whiteColortext,
                                    fontSize: getHeight(18)),
                              ),
                            ),
                          ),
                          onTap: () {
                            context.read<HomePageCubit>().addData(notes.text);

                            Navigator.pushNamed(context, "/home");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ));
    },
  );
}
