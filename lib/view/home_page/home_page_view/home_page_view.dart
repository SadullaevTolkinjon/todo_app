import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_test_app/core/constants/constant.dart';
import 'package:to_do_test_app/core/data/local_data/local_data.dart';
import 'package:to_do_test_app/core/utils/size_config/size_config.dart';
import 'package:to_do_test_app/core/utils/widgets/widgets.dart';
import 'package:to_do_test_app/view/home_page/home_page_cubit/home_page_cubit.dart';
import 'package:to_do_test_app/view/home_page/home_page_state/home_page_state.dart';
import 'package:to_do_test_app/view/home_page/home_page_view/modal_shet.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => HomePageCubit(),
      child: BlocConsumer<HomePageCubit, HomePageState>(
        listener: ((context, state) {
          if (state is ModalShetState) {
            modalSheet(
              context,
            );
          } 
        }),
        builder: (context, state) => scaffoldMy(context, state),
      ),
    );
  }

  Scaffold scaffoldMy(BuildContext context, state) {
    return Scaffold(
      backgroundColor: ConstantsMy.scaffoldBackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: data.isEmpty ? getHeight(126) : getHeight(248),
              decoration: BoxDecoration(
                gradient: linearGradient(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: getHeight(40)),
                    child: ListTile(
                      title: Text(
                        "Hello Brenda!",
                        style: TextStyle(
                            fontSize: getHeight(18),
                            color: ConstantsMy.whiteColortext),
                      ),
                      subtitle: Text(
                        "Today you have 9 tasks",
                        style: TextStyle(
                            fontSize: getHeight(18),
                            color: ConstantsMy.whiteColortext),
                      ),
                      trailing: CircleAvatar(
                        radius: getHeight(50),
                        backgroundColor: ConstantsMy.whiteColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: getWidth(16), top: getHeight(10)),
                    child: data.isEmpty ? null : const NotificationContainer(),
                  )
                ],
              ),
            ),
            Container(height: data.isEmpty ?getHeight(620): getHeight(500),
            child: context
                  .watch<HomePageCubit>()
                  .bodies[context.watch<HomePageCubit>().indexOfNavBar],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ConstantsMy.blueGradient2,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(ConstantsMy.homeIcon), label: "Home"),
          BottomNavigationBarItem(
              icon: FloatingActionButton(
                onPressed: () {},
                child: SvgPicture.asset(
                  ConstantsMy.addIcon,
                  color: ConstantsMy.whiteColor,
                ),
                backgroundColor: ConstantsMy.addIconColor,
              ),
              label: "Add"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(ConstantsMy.tascIcon), label: "Task"),
        ],
        onTap: (val) {
          context.read<HomePageCubit>().changeIndexOfNavBar(val);
        },
      ),
    );
  }

  LinearGradient linearGradient() {
    return LinearGradient(
      colors: [ConstantsMy.blueGradient1, ConstantsMy.blueGradient2],
    );
  }
}
