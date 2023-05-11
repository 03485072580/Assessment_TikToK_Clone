import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void logMessage(message) {
  if (kDebugMode) {
    print("####--->${message}");
  }
}

bool isNotEmpty(value) {
  if (value != null && value != '') {
    return true;
  }
  return false;
}

bool isEmpty(value) {
  if (value == null || value == '') {
    return true;
  }
  return false;
}

verticalSpace({height = 10}) {
  return SizedBox(
    height: (height as int).toDouble(),
  );
}

horizontalSpace({width = 10}) {
  return SizedBox(
    width: (width as int).toDouble(),
  );
}

Future<bool> appHasInternetConnectivity() async =>
    await InternetConnectionChecker().hasConnection;