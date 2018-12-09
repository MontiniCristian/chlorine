import 'package:chlorine/ChlorineNetwork/chlorine_network.dart';
import 'package:chlorine/ChlorineNetwork/chlorine_response.dart';
import 'package:chlorine/chlorine_target.dart';

class Chlorine {
  final ChlorineNetwork _chlorineNetwork = ChlorineNetwork();

  jsonRequest(ChlorineTarget request, onSuccess(ChlorineSuccessResponse res),
      onError(ChlorineErrorResponse res)) async {
    try {
      await this._chlorineNetwork.networkRequest(request, (response, error) {
        if (response != null)
          onSuccess(_createSuccessResponse(response, request));
        else if (error != null) onError(_createErrorResponse(response, request));
      });
    } catch (e) {
      throw ChlorineNetworkError();
    }
  }

  _createSuccessResponse(ChlorineResponse response, ChlorineTarget request) {
    return ChlorineSuccessResponse()
      ..statusCode = response.statusCode
      ..headers = response.headers
      ..results = request.successClosure(response.results);
  }

  _createErrorResponse(ChlorineResponse response, ChlorineTarget request) {
    return ChlorineErrorResponse()
      ..statusCode = response.statusCode
      ..headers = response.headers
      ..results = request.errorClosure(response.results);
  }
}

class ChlorineNetworkError extends Error {}
