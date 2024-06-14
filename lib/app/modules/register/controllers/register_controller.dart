import 'package:flutter/material.dart';
import 'package:flutter_embed_unity_android_example/app/helpers/alert_success.dart';
import 'package:get/get.dart';

import '../../../data/models/class.dart';
import '../../../data/models/school.dart';
import '../../../helpers/alert_error.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';

class RegisterController extends GetxController {
  bool? isRemindMe = false;
  bool obsecureText = true;
  bool obsecureTextConfirm = true;
  List<School> schoolList = [];
  List<SchoolClass> classList = [];
  String namaLengkap = "";
  bool isLoading = false;

  String email = "";
  String password = "";
  String passwordConfirmation = "";
  String classId = "";
  String schoolId = "";

  bool isClassLoad = true;
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode passwordConfirmationNode = FocusNode();
  @override
  void onInit() {
    getSchoolList();
    super.onInit();
  }
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

  void showObsecureConfirm() {
    obsecureTextConfirm = !obsecureTextConfirm;
    update();
  }

  void onChangeEmail(String? value) {
    email = value!;
    update();
  }

  void onChangePassword(String? value) {
    password = value!;
    update();
  }

  void onChangeConfirmPassword(String? value) {
    passwordConfirmation = value!;
    update();
  }

  String? onEmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Mohon diisi terlebih dahulu";
    }
    return null;
  }

  String? onPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Mohon diisi terlebih dahulu";
    }
    return null;
  }

  void onChangeNamaLengkap(String? value) {
    namaLengkap = value ?? "";
    update();
  }

  String? onNamaLengkapValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Mohon diisi terlebih dahulu";
    }
    return null;
  }

  String? onPasswordConfirmation(String? value) {
    if (value!.isEmpty) {
      return "Mohon diisi terlebih dahulu";
    } else if (value != password) {
      return "Konfirmasi tidak sama dengan password";
    }
    return null;
  }

  void register() async {
    isLoading = true;
    update();

    try {
      if (formKey.currentState?.validate() ?? false) {
        bool isSuccessLogin = await authService.register(
          email: emailController.text,
          password: passwordController.text,
          idKelas: classId,
          idSekolah : schoolId,
          namaLengkap: namaLengkapController.text,
          passwordConfirmation: passwordConfirmationController.text,
        );
        if (isSuccessLogin) {
          alertSuccess(
              title: 'Registrasi Berhasil',
              subtitle:
                  "Selamat anda berhasil daftar, anda akan diarahkan ke login kembali");
          Get.offAndToNamed(Routes.LOGIN);
        } else {
          alertError(title: 'Login gagal', subtitle: authService.message);
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
    FocusScope.of(Get.context!).requestFocus(emailFocusNode);
  }

  void onEditingCompletePassord() {
    FocusScope.of(Get.context!).requestFocus(passwordFocusNode);
  }

  void onEditingCompletePasswordConfirmation() {
    FocusScope.of(Get.context!).requestFocus(passwordConfirmationNode);
  }
  void getSchoolList() async{
    isClassLoad = true;
    schoolList = await AuthService().getAllSchool();
    isClassLoad = false;
    update();
  }
 
  
}
