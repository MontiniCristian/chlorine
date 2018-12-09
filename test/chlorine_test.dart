import 'package:flutter_test/flutter_test.dart';
import 'package:chlorine/chlorine.dart';
import 'package:chlorine/chlorine_target.dart';

void main() {
  test('getUsers()', () {
    Chlorine chlorine = Chlorine();
    chlorine.jsonRequest(UserTarget().getUsers(), (response) {
      expect(response.statusCode, 200);
    }, (error) {
      return null;
    });
  });

  test('getUser()', () {
    Chlorine chlorine = Chlorine();
    chlorine.jsonRequest(UserTarget().getUser(2), (response) {
      expect(response.statusCode, 200);
      expect(response.results.contains('Clementine Bauch'), true);
    }, (error) {
      return null;
    });
  });

  test('getUser() should fail', () {
    Chlorine chlorine = Chlorine();
    chlorine.jsonRequest(UserTarget().getUser(9999999999), (response) {
      expect(response.statusCode, 401);
    }, (error) {
      return null;
    });
  });
}

class UserTarget {
  String baseUrl = 'https://jsonplaceholder.typicode.com/';

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
