import 'dart:convert';

import 'package:get/get.dart';

import '../models/baseModel/base_model.dart';
import '../utils/constants.dart';
import '../utils/handlers.dart';
import '../utils/utils.dart';
import 'package:http/http.dart' as http;

class Webservice {
  static final Webservice _singleton = Webservice._internal();

  factory Webservice() {
    return _singleton;
  }

  Webservice._internal();

  Map<String, String> appHeaders() {
    Map<String, String> headers = {
      "accept": "*/*",
      "Content-Type": "application/json",
    };
    return headers;
  }

  Future<BaseModel> apiCallFollowingData(Map<String, dynamic> jsonMap, RxBool isLoading) async {
    if (await appHasInternetConnectivity()) {
      isLoading.value = true;

      Map<String, String> headers = appHeaders();

      var uri = Uri(
          scheme: Uri.parse(APIEndpoints.FOLLOWING).scheme,
          host: Uri.parse(APIEndpoints.FOLLOWING).host,
          path: Uri.parse(APIEndpoints.FOLLOWING).path,
          queryParameters: jsonMap);

      var response = await http.get(
        uri,
        headers: headers,
      );

      isLoading.value = false;
      logMessage('${response.statusCode} ${uri.path} ${response.body}');
      if (response.statusCode == 200) {
        var responseMap = jsonDecode(response.body);
        return BaseModel.fromMap({
          'error':false,
          'code':'200',
          'message':'Success',
          'data':responseMap,
        });
      } else {
        Handlers().apiResponseHandler(response);
        return BaseModel.fromMap(null);
      }
    } else {
      Handlers().apiResponseHandler(null, hasConnectivity: false);
      return BaseModel.fromMap(null);
    }
  }
}
