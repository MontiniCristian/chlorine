import 'dart:async';

import 'package:chlorine/ChlorineNetwork/chlorine_method.dart';
import 'package:chlorine/chlorine_target.dart';
import 'package:http/http.dart' as http;

class ChlorineHttp {
  Future<http.Response> delegate(ChlorineTarget request) async {
    http.Response response = await performRequest(request);
    return response;
  }

  Future<http.Response> performRequest(ChlorineTarget request) async {
    String url = request.baseUrl + request.path;
    try {
      switch (request.method) {
        case (ChlorineMethod.GET):
          return await http.get(url, headers: request.headers);
        case (ChlorineMethod.POST):
          return await http.post(url,
              headers: request.headers, body: request.jsonBody);
        case (ChlorineMethod.HEAD):
          return await http.head(url, headers: request.headers);
        case (ChlorineMethod.DELETE):
          return await http.delete(url, headers: request.headers);
        case (ChlorineMethod.PATCH):
          return await http.patch(url,
              headers: request.headers, body: request.jsonBody);
        case (ChlorineMethod.PUT):
          return await http.put(url,
              headers: request.headers, body: request.jsonBody);

        default:
          return null;
      }
    } catch (e) {
      throw Error();
    }
  }
}

class ChlorineHttpError extends Error {}
