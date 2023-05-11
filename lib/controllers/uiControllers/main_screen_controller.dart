import 'dart:convert';

import 'package:get/get.dart';
import 'package:tiktok_clone/models/following_model.dart';

class MainScreenController extends GetxController{
  var indexPage = 0.obs;
  var followingModel = FollowingModel.fromMap({}).obs;
}