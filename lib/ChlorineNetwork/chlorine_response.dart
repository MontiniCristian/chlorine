class ChlorineResponse {
  int statusCode;
  Map<String, String> headers;
  String results;
}

class ChlorineSuccessResponse extends ChlorineResponse {}

class ChlorineErrorResponse extends ChlorineResponse {}
