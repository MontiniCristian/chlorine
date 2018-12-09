import 'package:chlorine/chlorine.dart';
import 'package:chlorine/chlorine_target.dart';

void main() {
  Chlorine chlorine = Chlorine();

  // Passing a builder method as the first argument
  chlorine.jsonRequest(UserTarget().getUsers(), (response) {
    // Access the response in this closure
    print(response.results);
  }, (error) {
    // Eventually access the error in this closure
    print(error.results);
  });
}

/// Define your own target and configure ChlorineTarget builders
class UserTarget {
  String baseUrl = 'https://jsonplaceholder.typicode.com/';

  /// This is a [ChlorineTarget] builder method.
  /// Every method that you pass to as a first argument to
  /// Chlorine.jsonRequest() should return a [ChlorineTarget]
  getUsers() {
    return ChlorineTarget()
      ..baseUrl = this.baseUrl
      ..path = 'users'
      ..method = ChlorineMethod.GET
      ..headers = Map.from({'Content-Type': 'application/json'})
      ..successClosure = (users) {
        print(users);
      }
      ..successClosure = (error) {
        print(error);
      };
  }

  getUser(int id) {
    return ChlorineTarget()
      ..baseUrl = this.baseUrl
      ..path = 'users/$id'
      ..method = ChlorineMethod.GET
      ..headers = Map.from({'Content-Type': 'application/json'})
      ..successClosure = (users) {
        print(users);
      }
      ..successClosure = (error) {
        print(error);
      };
  }
}
