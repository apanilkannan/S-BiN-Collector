import 'package:firebase_auth/firebase_auth.dart';
import 'package:s_bin_collector/src/common/app_utils.dart';

class AuthService {
  Future<String?> registration({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppUtils().showErrorBar('${e.message}');
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        AppUtils().showErrorBar('${e.message}');
        return 'Wrong password provided for that user.';
      } else {
        AppUtils().showErrorBar('${e.message}');
        return e.message;
      }
    } catch (e) {
      AppUtils().showErrorBar('$e');
      return e.toString();
    }
  }
}
