import 'dart:math';

import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

class AuthServices {
  final LocalAuthentication localauth = LocalAuthentication();
  Future<bool> authenticateLocally() async {
    bool isauthenticate = false;
    try {
      isauthenticate = await localauth.authenticate(
          localizedReason: "We need to Athencate for using this app",
          options: AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs: true,
          ));
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        // Add handling of no hardware here.
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        // ...
      } else {
        // ...
      }
    } catch (e) {
      isauthenticate = false;
      print("Error: $e");
    }
    return isauthenticate;
  }
}
