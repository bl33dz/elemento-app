import 'package:flutter/material.dart';
import 'package:flutter_embed_unity_android_example/app/helpers/alert_error.dart';
import 'package:flutter_embed_unity_android_example/app/helpers/alert_success.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';

class LoginController extends GetxController {
  bool? isRemindMe = false;
  bool obsecureText = true;
  String email = "";
  String password = "";
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  final AuthService authService = AuthService();
  final formKey = GlobalKey<FormState>();

  void checkRemindMe(bool? remindMe) {
    isRemindMe = remindMe ?? false;
    update();
  }

  void showObsecure() {
    obsecureText = !obsecureText;
    update();
  }

  void onChangeEmail(String? value) {
    email = value ?? "";
    update();
  }

  void onChangePassword(String? value) {
    password = value ?? "";
    update();
  }

  String? onEmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    return null;
  }

  String? onPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  void login() async {
    isLoading = true;
    update();

    try {
      if (formKey.currentState?.validate() ?? false) {
        bool isSuccessLogin = await authService.login(
          email: emailController.text,
          password: passwordController.text,
        );
        if (isSuccessLogin) {
          alertSuccess(title: 'Login Berhasil', subtitle: "Selamat anda berhasil login ke akun anda");
          Get.offAndToNamed(Routes.BOTTOM_NAV);
        } else {
          alertError(title: 'Login Gagal', subtitle: authService.message);

        }
      }
    } catch (e) {
      isLoading = false;
    } finally {
      isLoading = false;
      update();
    }
  }

  void onEditingCompleteEmail() {
    FocusScope.of(Get.context!).requestFocus(passwordFocusNode);
  }
}
