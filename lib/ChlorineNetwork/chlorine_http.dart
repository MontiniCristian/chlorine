import 'dart:async';

import 'package:chlorine/ChlorineNetwork/chlorine_method.dart';
import 'package:chlorine/chlorine_target.dart';
import 'package:http/http.dart' as http;

class ChlorineHttp {
  Future<http.Response> delegate(ChlorineTarget target) async {
    http.Response response = await performRequest(target);
    return response;
  }

  Future<http.Response> performRequest(ChlorineTarget target) async {
    String url = target.baseUrl + target.path;
    try {
      switch (target.method) {
        case (ChlorineMethod.GET):
          return await http.get(url, headers: target.headers);
        case (ChlorineMethod.POST):
          return await http.post(url,
              headers: target.headers, body: target.jsonBody);
        case (ChlorineMethod.HEAD):
          return await http.head(url, headers: target.headers);
        case (ChlorineMethod.DELETE):
          return await http.delete(url, headers: target.headers);
        case (ChlorineMethod.PATCH):
          return await http.patch(url,
              headers: target.headers, body: target.jsonBody);
        case (ChlorineMethod.PUT):
          return await http.put(url,
              headers: target.headers, body: target.jsonBody);

        default:
          return null;
      }
    } catch (e) {
      throw Error();
    }
  }
}

class ChlorineHttpError extends Error {}
