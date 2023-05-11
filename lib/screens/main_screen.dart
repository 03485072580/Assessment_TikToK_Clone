
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/models/following_model.dart';
import 'package:tiktok_clone/utils/styles.dart';

import '../controllers/apiControllers/api_controller.dart';
import '../controllers/uiControllers/main_screen_controller.dart';
import '../utils/constants.dart';
import '../utils/decorations.dart';
import '../utils/json.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _pages = <Widget>[
    HomeScreen(),
  ];

  late MainScreenController controller;
  late APIController apiController;

  @override
  void initState() {
    super.initState();

    controller = Get.put(MainScreenController(), tag: NamedRoutes.routeMain);
    apiController = Get.put(APIController(), tag: NamedRoutes.routeMain);

    //API Data Listeners
    apiController.baseModel.listen((baseModel) {
      if(!(baseModel.error!)){
        controller.followingModel.value =  FollowingModel.fromMap(baseModel.data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyScaffold(
      body: getBody(size),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getBottomNavigationBar(size),
    );
  }

  getBottomNavigationBar(Size size) {
    return Obx(() {
      return Container(
        decoration: rectangularWhiteBoxDecorationWithRadiusElevation(0, 4),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(bottomBarIcons.length, (index) {
              int length = bottomBarIcons.length;
              return SweetButton(
                onPressed: () {
                  controller.indexPage.value = index;
                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          controller.indexPage.value == index
                              ? bottomBarIcons[index]['image']
                              : bottomBarIcons[index]['unselected_image'],
                          width: 36,
                          height: 36,
                        ),
                        verticalSpace(height: 5),
                        Text(bottomBarIcons[index]['title'], style: regularWhiteText12(Colors.black),)
                      ],
                    )),
              );
            }),
          ),
        ),
      );
    });
  }

  getBody(Size size) {
    return Obx(() {
      return FadeIndexedStack(
        index: controller.indexPage.value,
        children: _pages,
      );
    });
  }
}
