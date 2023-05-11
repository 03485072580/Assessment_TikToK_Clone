import 'package:get/get.dart';

List<Map<String, dynamic>> bottomBarIcons = [
  {
    'unselected_image': 'assets/images/ic_home.png',
    'image': 'assets/images/ic_home_selected.png',
    'title': 'Home',
  },
  {
    'unselected_image': 'assets/images/ic_search.png',
    'image': 'assets/images/ic_search_filled.png',
    'title': 'Leaderboard',
  },
  {
    'unselected_image': 'assets/images/ic_comment.png',
    'image': 'assets/images/ic_comment.png',
    'title': 'Activity',
  },
  {
    'unselected_image': 'assets/images/ic_collections_filled.png',
    'image': 'assets/images/ic_collections_filled.png',
    'title': 'Bookmarks',
  },
  {
    'unselected_image': 'assets/images/ic_account.png',
    'image': 'assets/images/ic_account.png',
    'title': 'Profile',
  }
];

RxList<Map<String, dynamic>> homeTabs = [
  {
    'title': 'Following',
    'selected': true,
  },
  {
    'title': 'For You',
    'selected': false,
  }
].obs;