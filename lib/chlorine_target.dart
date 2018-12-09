import 'package:chlorine/ChlorineNetwork/chlorine_method.dart';

export 'package:chlorine/ChlorineNetwork/chlorine_method.dart';
class ChlorineTarget {
  String baseUrl;

  String path;

  ChlorineMethod method;

  Map<String, String> headers;

  Function successClosure;

  Function errorClosure;

  Map<dynamic, dynamic> jsonBody;

  ChlorineTarget() {
    this.successClosure = (res) {
      return res;
    };
    this.errorClosure = (err) {
      return err;
    };
  }

  // Map<String, dynamic> parameters;
}
