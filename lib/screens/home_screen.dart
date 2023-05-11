import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controllers/uiControllers/main_screen_controller.dart';
import 'package:tiktok_clone/models/following_model.dart';
import 'package:tiktok_clone/utils/decorations.dart';

import '../controllers/apiControllers/api_controller.dart';
import '../utils/constants.dart';
import '../utils/json.dart';
import '../utils/styles.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _State();
}

class _State extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late APIController apiController;
  late MainScreenController mainScreenUIController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    apiController = Get.find<APIController>(tag: NamedRoutes.routeMain);
    mainScreenUIController =
        Get.find<MainScreenController>(tag: NamedRoutes.routeMain);

    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyScaffold(backgroundColor: Colors.blueAccent, body: getBody(size));
  }

  getBody(Size size) {
    return Stack(
      children: [
        Obx(() {
          var selectedItemIndex =
              homeTabs.indexWhere((element) => element['selected'] == true);
          return SafeArea(
            top: false,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: PageController(
                      initialPage: 0,
                      viewportFraction: 1,
                    ),
                    itemCount: 10,
                    onPageChanged: (index) {},
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Obx( () {
                        var following  = mainScreenUIController.followingModel.value;
                          return FollowingComponent(following: following,);
                        }
                      );
                    },
                  ),
                ),
                Container(
                  color: Colors.orange,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/ic_coin.png',
                              height: 24,
                              color: Colors.white,
                            ),
                            horizontalSpace(),
                            Text(
                              'Playlist- Unit 5: Period 5',
                              style: regularWhiteText12(Colors.white),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 24,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/ic_add_post.png',
                          height: 24,
                        ),
                        horizontalSpace(),
                        Text(
                          '10m',
                          style: boldWhiteText18(Colors.white),
                        )
                      ],
                    ),
                    Image.asset(
                      'assets/images/ic_search.png',
                      height: 24,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(homeTabs.length, (index) {
                    return Row(
                      children: [
                        Obx(() {
                          return SweetButton(
                            onPressed: () {
                              for (var element in homeTabs) {
                                if (element['selected'] == true) {
                                  element['selected'] = false;
                                }
                              }
                              homeTabs[index]['selected'] = true;
                              homeTabs.refresh();
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${homeTabs[index]['title']}',
                                  style: boldWhiteText14(Colors.white),
                                ),
                                verticalSpace(height: 5),
                                Visibility(
                                  visible: homeTabs[index]['selected'],
                                  child: Container(
                                    width: 40,
                                    height: 3,
                                    decoration: appSeparationLineDecoration(
                                        Colors.white),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                        (index == 0) ? horizontalSpace() : const SizedBox(),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        GenericProgressBar(tag: NamedRoutes.routeMain),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomLeft,
              child: Obx( () {
                var following  = mainScreenUIController.followingModel.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${following.user?.name}', style: regularWhiteText18(Colors.white),),
                      verticalSpace(height: 5),
                      Text('Topic 5.2 Manifest Destiny', style: regularWhiteText16(Colors.white),),
                      verticalSpace(height: 50)
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ],
    );
  }

  void fetchData() {
    apiController.webservice.apiCallFollowingData({}, apiController.isLoading).then((value) => apiController.baseModel.value = value);
  }
}

class FollowingComponent extends StatefulWidget {
  final FollowingModel following;
  const FollowingComponent({Key? key, required this.following}) : super(key: key);

  @override
  State<FollowingComponent> createState() => _FollowingComponentState();
}

class _FollowingComponentState extends State<FollowingComponent> {

  var flashcardClosed = true.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: 0.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/ic_add_post.png',
                          height: 24,
                        ),
                        horizontalSpace(),
                        Text(
                          '10m',
                          style: boldWhiteText18(Colors.white),
                        )
                      ],
                    ),
                    Image.asset(
                      'assets/images/ic_search.png',
                      height: 24,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(homeTabs.length, (index) {
                    return Row(
                      children: [
                        Obx(() {
                          return SweetButton(
                            onPressed: () {
                              for (var element in homeTabs) {
                                if (element['selected'] == true) {
                                  element['selected'] = false;
                                }
                              }
                              homeTabs[index]['selected'] = true;
                              homeTabs.refresh();
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${homeTabs[index]['title']}',
                                  style: boldWhiteText14(Colors.white),
                                ),
                                verticalSpace(height: 5),
                                Visibility(
                                  visible: homeTabs[index]['selected'],
                                  child: Container(
                                    width: 40,
                                    height: 3,
                                    decoration: appSeparationLineDecoration(
                                        Colors.white),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                        (index == 0) ? horizontalSpace() : const SizedBox(),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        verticalSpace(height: 20),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SweetButton(
                        onPressed: () {
                          flashcardClosed.value = !(flashcardClosed.value);
                        },
                        child: Text(
                          '${widget.following.flashcardFront}',
                          style: regularWhiteText16(Colors.white),
                        ),
                      ),
                      Obx(() {
                          return Visibility(
                            visible: !(flashcardClosed.value),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpace(height: 20),
                                Container(
                                  height: 1,
                                  decoration:
                                  appSeparationLineDecoration(Colors.grey),
                                ),
                                verticalSpace(height: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Answer',
                                      style: boldWhiteText12(Colors.orange),
                                    ),
                                    verticalSpace(),
                                    Text(
                                      '${widget.following.flashcardBack}',
                                      style: regularWhiteText12(Colors.white),
                                    ),
                                    verticalSpace(height: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${widget.following.description}',
                                          style: regularWhiteText12(Colors.white),
                                        ),
                                        verticalSpace(),
                                        SweetButton(
                                          onPressed: () {},
                                          child: Container(
                                              decoration:
                                              rectangularCustomColorBoxDecorationWithRadius(
                                                12,
                                                12,
                                                12,
                                                12,
                                                Colors.green,
                                              ),
                                              child: const CustomizedButton(
                                                text: '4',
                                                verticalPadding: 16,
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircularAvatar(
                      imagePath: '${widget.following.user?.avatar}',
                      imageSize: 56,
                    ),
                    verticalSpace(height: 20),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/ic_blocked_account.png',
                          height: 36,
                        ),
                        verticalSpace(height: 5),
                        Text(
                          '87',
                          style: regularWhiteText12(Colors.white),
                        ),
                      ],
                    ),
                    verticalSpace(),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/ic_blocked_account.png',
                          height: 36,
                        ),
                        verticalSpace(height: 5),
                        Text(
                          '87',
                          style: regularWhiteText12(Colors.white),
                        ),
                      ],
                    ),
                    verticalSpace(),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/ic_blocked_account.png',
                          height: 36,
                        ),
                        verticalSpace(height: 5),
                        Text(
                          '87',
                          style: regularWhiteText12(Colors.white),
                        ),
                      ],
                    ),
                    verticalSpace(),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/ic_blocked_account.png',
                          height: 36,
                        ),
                        verticalSpace(height: 5),
                        Text(
                          '87',
                          style: regularWhiteText12(Colors.white),
                        ),
                      ],
                    ),
                    verticalSpace(),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/ic_blocked_account.png',
                          height: 36,
                        ),
                        verticalSpace(height: 5),
                        Text(
                          '87',
                          style: regularWhiteText12(Colors.white),
                        ),
                      ],
                    ),
                    verticalSpace(),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

