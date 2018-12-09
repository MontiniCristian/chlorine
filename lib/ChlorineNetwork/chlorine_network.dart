import 'dart:core';

import 'package:chlorine/ChlorineNetwork/chlorine_http.dart';
import 'package:chlorine/ChlorineNetwork/chlorine_response.dart';
import 'package:chlorine/chlorine_target.dart';
import 'package:http/http.dart' as http;

class ChlorineNetwork {
  ChlorineHttp chlorineHttp = ChlorineHttp();

  networkRequest(ChlorineTarget target, completion(response, error)) async {
    try {
      http.Response response = await chlorineHttp.delegate(target);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        completion(
            ChlorineResponse()
              ..statusCode = response.statusCode
              ..results = response.body
              ..headers = response.headers,
            null);
      } else if (response.statusCode >= 400 && response.statusCode <= 599) {
        completion(
            null,
            ChlorineResponse()
              ..statusCode = response.statusCode
              ..results = response.body
              ..headers = response.headers);
      }
    } catch (e) {
      throw Error();
    }
  }
}
