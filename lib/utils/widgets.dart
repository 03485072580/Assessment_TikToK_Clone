import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/utils/styles.dart';
import 'package:tiktok_clone/utils/utils.dart';

import '../controllers/apiControllers/api_controller.dart';

class MyScaffold extends StatelessWidget {
  final Widget? body, drawer, bottomNavigationBar, floatingActionButton;
  final PreferredSizeWidget? appBar;
  final Color backgroundColor;
  final Key? scaffoldKey;
  final FloatingActionButtonLocation? floatingActionLocation;
  final bool extendBodyBehindAppBar, resizeToAvoidBottomInset;

  const MyScaffold({
    Key? key,
    this.body,
    this.drawer,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionLocation,
    this.backgroundColor = Colors.white,
    this.scaffoldKey,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: body,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      extendBody: true,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionLocation,
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 0.0),
      ),
    );
  }
}

class CircularAvatar extends StatelessWidget {
  final String imagePath;
  final double imageSize, imageWidth, imageHeight;
  final bool isNetworkImage, blendmood;
  final BoxFit? fit;

  const CircularAvatar({
    Key? key,
    required this.imagePath,
    required this.imageSize,
    this.imageWidth = 0.0,
    this.imageHeight = 0.0,
    this.isNetworkImage = true,
    this.blendmood = false,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (imageWidth > 0) ? imageWidth : imageSize,
      height: (imageHeight > 0) ? imageHeight : imageSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imageSize),
        child: (isNetworkImage)
            ? GenericCachedNetworkImage(
                imagePath: imagePath,
                blendmood: blendmood,
                fit: fit,
              )
            : Image.asset(imagePath),
      ),
    );
  }
}

class GenericCachedNetworkImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  bool? blendmood;

  GenericCachedNetworkImage({
    Key? key,
    required this.imagePath,
    this.width,
    this.height,
    this.blendmood = false,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      colorBlendMode: (blendmood!) ? BlendMode.darken : null,
      color: (blendmood!) ? Colors.black.withOpacity(0.4) : null,
      memCacheWidth: 620,
      memCacheHeight: 620,
      width: width,
      height: height,
      imageUrl: imagePath,
      placeholder: (_, url) => PlaceholderWidget(),
      errorWidget: (_, url, error) => PlaceholderWidget(),
      fit: fit,
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/ic_placeholder_widget.png',
      fit: BoxFit.cover,
    );
  }
}

class SweetButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const SweetButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minSize: double.minPositive,
      child: child,
    );
  }
}

class FadeIndexedStack extends StatefulWidget {
  final int index;
  final List<Widget> children;
  final Duration duration;

  const FadeIndexedStack({
    Key? key,
    required this.index,
    required this.children,
    this.duration = const Duration(
      milliseconds: 300,
    ),
  }) : super(key: key);

  @override
  _FadeIndexedStackState createState() => _FadeIndexedStackState();
}

class _FadeIndexedStackState extends State<FadeIndexedStack>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void didUpdateWidget(FadeIndexedStack oldWidget) {
    if (widget.index != oldWidget.index) {
      _controller.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: IndexedStack(
        index: widget.index,
        children: widget.children,
      ),
    );
  }
}

class CustomizedButton extends StatelessWidget {
  final String text;
  final String img;
  final double verticalPadding;
  final Color textColor;

  const CustomizedButton(
      {Key? key,
      required this.text,
      this.verticalPadding = 0,
      this.textColor = Colors.white,
      this.img = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isEmpty(img)
                ? Container()
                : Row(
                    children: [
                      Image.asset(
                        img,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
            Text(
              text,
              style: boldWhiteText14(textColor),
            ),
          ],
        ),
      ),
    );
  }
}

class GenericProgressBar extends StatelessWidget {
  final String tag;

  GenericProgressBar({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    APIController controller = Get.find(tag: tag);
    return Obx(() {
      return (controller.isLoading.value)
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            )
          : Container();
    });
  }
}
