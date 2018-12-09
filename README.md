# Chlorine

A lightweight json api network abstraction for flutter.

Chlorine uses async functions and give a easy way to access
by binding responses and errors to two different closures.

## Usage
Import this package adding it [in your pubspec.yaml](https://flutter.io/docs/development/packages-and-plugins/using-packages#using-packages).

```yaml
...
dependencies:
  flutter:
    sdk: flutter
  chlorine: ">=0.1.0"
  ...
```

Create a Target:
```dart
import 'package:chlorine/chlorine_target.dart';

class UserTarget {

  String baseUrl = 'https://jsonplaceholder.typicode.com/';

  getUsers() {
    return ChlorineTarget()
        ..baseUrl = this.baseUrl
        ..path = 'users'
        ..method = ChlorineMethod.GET
        ..headers = Map.from({'Content-Type' : 'application/json'})

        //optional closures which will compute te results just before returning the response
        ..successClosure = (users) {
          print(users);
          return users;
        }
        ..errorClosure = (error) {
          print(error);
          return error;
        };
  }

  getUser(int id) {
    return ChlorineTarget()
      ..baseUrl = this.baseUrl
      ..path = 'users/$id'
      ..method = ChlorineMethod.GET
      ..headers = Map.from({'Content-Type' : 'application/json'})
  }
}
```

As you can see a builder methods like getUser() and getUsers() should return a ChlorineTarget.
Dart's [cascade notation](https://www.dartlang.org/guides/language/language-tour#cascade-notation-) make it very easy
to build different instances of the same object.

Create a Chlorine instance and pass to it a builder method from
your target class and relative success and error closure:

```dart

void main() {
    Chlorine chlorine = Chlorine();
    chlorine.jsonRequest(UserTarget().getUsers(),
        (response) {
            print(response.jsonBody);
        },
        (error) {
            print(error.jsonBody);
        }
    );
    chlorine.jsonRequest(UserTarget().getUser(2),
            (response) {
                print(response.jsonBody);
            },
            (error) {
                print(error.jsonBody);
            }
        );
}
```
## Testing
```dart
void main() {
  test('getUsers()', () {
    Chlorine chlorine = Chlorine();
    chlorine.jsonRequest(UserTarget().getUsers(), (response) {
      expect(response.statusCode, 200);
    }, (error) {
      return null;
    });
  });
 }
```

## Contributing
* Fork it!
* Create your feature branch: git checkout -b my-new-feature
* Commit your changes: git commit -am 'Add some feature'
* Push to the branch: git push origin my-new-feature
* Submit a pull request.
