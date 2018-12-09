import 'package:chlorine/ChlorineNetwork/chlorine_network.dart';
import 'package:chlorine/ChlorineNetwork/chlorine_response.dart';
import 'package:chlorine/chlorine_target.dart';

class Chlorine {
  final ChlorineNetwork _chlorineNetwork = ChlorineNetwork();

  jsonRequest(ChlorineTarget target, onSuccess(ChlorineSuccessResponse res),
      onError(ChlorineErrorResponse res)) async {
    try {
      await this._chlorineNetwork.networkRequest(target, (response, error) {
        if (response != null)
          onSuccess(_createSuccessResponse(response, target));
        else if (error != null) onError(_createErrorResponse(response, target));
      });
    } catch (e) {
      throw ChlorineNetworkError();
    }
  }

  _createSuccessResponse(ChlorineResponse response, ChlorineTarget target) {
    return ChlorineSuccessResponse()
      ..statusCode = response.statusCode
      ..headers = response.headers
      ..results = target.successClosure(response.results);
  }

  _createErrorResponse(ChlorineResponse response, ChlorineTarget request) {
    return ChlorineErrorResponse()
      ..statusCode = response.statusCode
      ..headers = response.headers
      ..results = request.errorClosure(response.results);
  }
}

class ChlorineNetworkError extends Error {}
