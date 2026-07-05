import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/features/auth/services/auth_firebase_services.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  final authServices _authServices = authServices();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> singup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _authServices.singupUser(
        name: name,
        email: email,
        password: password,
      );
    } catch (e) {
      throw e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _authServices.loginUser(email: email, password: password);
    } catch (e) {
      throw e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      _isLoading = true;
      notifyListeners();
      _authServices.forgotPassword(email: email);
    } catch (e) {
      throw (e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      _isLoading = true;
      notifyListeners();
      _authServices.logoutUser();
    } catch (e) {
      throw (e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // profileData
  Future<DocumentSnapshot<Map<String, dynamic>>> getProfileData() async {
    _isLoading = true;
    notifyListeners();
    var profileData = await _authServices.profileData();

    _isLoading = false;
    return profileData;
  }
}
