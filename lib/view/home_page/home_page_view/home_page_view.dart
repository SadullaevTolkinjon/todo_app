import 'package:flutter/material.dart';
import 'package:to_do_test_app/core/constants/constant.dart';
import 'package:to_do_test_app/core/utils/size_config/size_config.dart';
import 'package:to_do_test_app/core/utils/widgets/widgets.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ConstantsMy.scaffoldBackColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: getHeight(248),
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
                    child: const NotificationContainer(),
                  )
                ],
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(((context, index) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Today"),
                    SizedBox(
                      height: getHeight(200),
                      child: ListView.builder(itemBuilder: (_, __) {
                        return  Card(
                          child: ListTile(title: Text("salom")),
                        );
                      }),
                    )
                  ],
                ),
              );
            }), childCount: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1),
          )
        ],
      ),
    );
  }

  LinearGradient linearGradient() {
    return LinearGradient(
      colors: [ConstantsMy.blueGradient1, ConstantsMy.blueGradient2],
    );
  }
}
