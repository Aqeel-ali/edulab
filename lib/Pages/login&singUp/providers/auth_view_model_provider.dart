import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authViewModelProvider = ChangeNotifierProvider<AuthViewModelP>((ref) {
  return AuthViewModelP();
});

class AuthViewModelP extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  Stream<User?> get userStream => _auth.authStateChanges();

  String _email = '';
  String _password = '';
  String _name = '';
  String _confirmPassword = '';

  String get email => _email;
  String get password => _password;
  String get name => _name;
  String get confirmPassword => _confirmPassword;
  bool _obscurepassword = true;
  bool _obscureconfirmPassword = true;

  set email(String value) => _email = value;
  set name(String value) => _name = value;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set confirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  bool get obscureconfirmPassword => _obscureconfirmPassword;
  set obscureconfirmPassword(bool value) {
    _obscureconfirmPassword = value;
    notifyListeners();
  }

  bool get obscurepassword => _obscurepassword;
  set obscurepassword(bool value) {
    _obscurepassword = value;
    notifyListeners();
  }

  String? validateEmail(String value) {
    final String format =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

    if (value.isEmpty) {
      return 'ادخل بريد الكتروني';
    }
    return RegExp(format).hasMatch(value) ? null : 'ادخل بريد الكتروني صحيح';
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'ادخل كلمة المرور';
    }
    if (value.length < 6) {
      return 'ادخل كلمة مرور اكثر من 6 احرف';
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return 'ادخل كلمة المرور';
    }
    if (value != password) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'ادخل الاسم';
    }
    List newname = value.split(" ");
    if (newname.length < 3) {
      return 'ادخل الاسم الكامل';
    }
    return null;
  }

  Future<void> login() async {
    loading = true;
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      _loading = false;
    } on FirebaseException catch (e) {
      print(e.code);
      loading = false;
      if (e.code == "wrong-password") {
        return Future.error("كلمة المرور خاطئة");
      } else if (e.code == "user-not-found") {
        return Future.error("البريد الالكتروني غير موجود");
      } else {
        return Future.error("حدث خطأ ما");
      }
    }
    loading = false;
  }

  Future<void> signup() async {
    loading = true;
    try {
      await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      sendEmail();
      _loading = false;
    } on FirebaseException catch (e) {
      loading = false;
      if (e.code == "weak-password") {
        return Future.error("كلمة المرور ضعيفة");
      } else if (e.code == "email-already-in-use") {
        return Future.error("البريد الالكتروني مستخدم");
      } else {
        return Future.error(e.message ?? "حدث خطأ ما");
      }
    } catch (e) {
      loading = false;
      if (kDebugMode) print(e);
      print(e);
    }
    loading = false;
  }

  //logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> reload() async {
    await _auth.currentUser!.reload();
    notifyListeners();
  }

  void sendEmail() {
    _auth.currentUser!.sendEmailVerification();
  }
}
