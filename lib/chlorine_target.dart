import 'package:chlorine/ChlorineNetwork/chlorine_method.dart';

export 'package:chlorine/ChlorineNetwork/chlorine_method.dart';

/// This class represent the model of ad-hoc request which
/// Chlorine can understand. Use ChlorineTarget() constructor
/// as a builder inside a method into your own target classes
/// and return the result as this:
///
/// ```
/// class MyTarget {
///   getTodo(String todoId) {
///     return ChlorineTarget()
///       ..baseUrl = this.baseUrl
///       ..path = 'todos/$todoId'
///       ..method = ChlorineMethod.GET
///       ..headers = Map.from({'Content-Type': 'application/json'})
///       ..successClosure = (users) {
///         print(users);
///       }
///       ..successClosure = (error) {
///         print(error);
///       };
///   }
/// }
/// ```
class ChlorineTarget {

  /// The base url of the request
  String baseUrl;

  /// The path of the request.
  /// A path is a fragment of url specifying the location
  /// of the requested resource.
  ///
  /// Use:
  ///
  /// ```
  /// class UserTarget {
  ///   getUserProfile(String userId) {
  ///     return ChlorineTarget()
  ///       ..baseUrl = this.baseUrl // https://chlorine-api-example.com/api/
  ///       ..path = 'users/$userId/profile' // the user profile resource path.
  ///       ..method = ChlorineMethod.GET
  ///       ..headers = Map.from({'Content-Type': 'application/json'})
  ///       ..successClosure = (users) {
  ///         print(users);
  ///       }
  ///       ..successClosure = (error) {
  ///         print(error);
  ///       };
  ///   }
  /// }
  ///```
  String path;

  /// The http method of the request.
  /// It should be a valid http method from [ChlorineMethod] enum class.
  ChlorineMethod method;

  Map<String, String> headers;

  /// This closure is optionally executed before
  /// returning a [ChlorineSuccessResponse]. It can
  /// be used for applying computation just before
  /// returning the results.
  ///
  /// If no successClosure is provided by the builder
  /// no action will be performed on results.
  Function successClosure;

  /// This closure is optionally executed before
  /// returning a [ChlorineErrorResponse]. It can
  /// be used for applying computation just before
  /// returning the results.
  ///
  /// If no errorClosure is provided by the builder
  /// no action will be performed on results.
  Function errorClosure;

  /// The json body of the request.
  ///
  /// This parameter is considered only if the [method] is
  /// set to [ChlorineMethod.POST], [ChlorineMethod.PUT] or
  /// [ChlorineMethod.PATCH].
  Map<dynamic, dynamic> jsonBody;

  /// This is the builder constructor used to instantiate
  /// new request models.
  ///
  /// It can be used to build your own requests as follows:
  ///
  /// ```
  /// class UserTarget {
  ///   getUserProfile(String userId) {
  ///     return ChlorineTarget()
  ///       ..baseUrl = this.baseUrl // https://chlorine-api-example.com/api/
  ///       ..path = 'users/$userId/profile' // the user profile resource path.
  ///       ..method = ChlorineMethod.GET
  ///       ..headers = Map.from({'Content-Type': 'application/json'})
  ///       ..successClosure = (users) {
  ///         print(users);
  ///       }
  ///       ..successClosure = (error) {
  ///         print(error);
  ///       };
  ///   }
  /// }
  /// ```
  ///
  /// By default the closures [successClosure] and [errorClosure]
  /// will return the unprocessed response or error.
  ChlorineTarget() {
    this.successClosure = (res) {
      return res;
    };
    this.errorClosure = (err) {
      return err;
    };
  }
  //TODO: add support for url parameters
  // Map<String, dynamic> parameters;
}
