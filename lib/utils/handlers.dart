import 'dart:convert';

import 'constants.dart';

class Handlers {
  static final Handlers _singleton = Handlers._internal();

  factory Handlers() {
    return _singleton;
  }

  Handlers._internal();

  void apiResponseHandler(response, {hasConnectivity = true}) {
    if (hasConnectivity) {
      if (response.statusCode == 401) {
      } else if (response.statusCode == 404) {
      } else if ((response.statusCode ?? 500) >= 500) {
      } else if (response.statusCode == 400) {
      } else {
      }
    } else {
    }
  }

  void apiExceptionHandler(e, Function(String errMsg) onError) {
    // if(e is FirebaseAuthException){
    //   if(e.code == 'account-exists-with-different-credential'){
    //     onError(tr('This email is already registered'));
    //   }else if(e.code == 'invalid-credential'){
    //     onError(tr('Your credentials has expired. Please try again'));
    //   }else if(e.code == 'user-not-found'){
    //     onError(tr('No user exists with the provided email'));
    //   }else if(e.code == 'invalid-verification-code'){
    //     onError(tr('Verification code mismatched'));
    //   }else if(e.code == 'invalid-verification-id'){
    //     onError(tr('Verification ID is not valid'));
    //   }else if(e.code == 'invalid-phone-number'){
    //     onError(tr('Provided Phone number is not valid. (E.g, Valid Ph No: +923481234567)'));
    //   }else{
    //     if(isNotEmpty(e.message)){
    //       if(e.message!.contains('blocked')) {
    //         onError('${e.message}');
    //       }
    //     }
    //   }
    // }
  }
}
