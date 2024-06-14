import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_embed_unity_android_example/app/data/models/class.dart';
import 'package:flutter_embed_unity_android_example/app/services/auth_service.dart';

import 'package:get/get.dart';

import '../../../data/models/school.dart';
import '../../../routes/app_pages.dart';
import '../../login/views/login_view.dart';
import '../../splash_1/views/splash_1_view.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (_) {
      return Form(
        key: controller.formKey,
        child: SafeArea(
          child: controller.isClassLoad
              ? const Material(
                  child: Center(child: CircularProgressIndicator()))
              : Scaffold(
                  backgroundColor: Colors.white,
                  body: SingleChildScrollView(
                    reverse: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 42,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: SplashScreen(
                              image: "assets/images/mascot_splas.png",
                              width: 250.04,
                              height: 158.01,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Yuk, Registrasi dulu",
                              style: TextStyle(
                                fontFamily: "Gilroy-Bold",
                                fontSize: 22,
                                color: Color(
                                  0xff1c1c1c,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Center(
                            child: Text(
                              "Dan mulai pengalaman yang menyenangkan!",
                              style: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(
                                  0xff90a8bf,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          TextEditing(
                            title: "Nama",
                            hint: "Masukkan Nama",
                            onChange: controller.onChangeNamaLengkap,
                            validator: controller.onNamaLengkapValidator,
                            controller: controller.namaLengkapController,
                            onEditingComplete:
                                controller.onEditingCompleteEmail,
                          ),
                          TextEditing(
                            focusNode: controller.emailFocusNode,
                            title: "Email",
                            hint: "Masukkan email",
                            onChange: controller.onChangeEmail,
                            validator: controller.onEmailValidator,
                            controller: controller.emailController,
                            onEditingComplete:
                                controller.onEditingCompletePassord,
                            textInput: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Sekolah",
                            style: TextStyle(
                              color: Color(0xFF1D2E42),
                              fontSize: 14,
                              fontFamily: 'Gilroy-Bold',
                              height: 0.12,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          DropdownSearch<School>(
                            validator: (School? e) {
                              if (e == null) {
                                return "Mohon diisi terlebih dahulu";
                              }
                              return null;
                            },
                            items: controller.schoolList,
                            itemAsString: (School e) => e.name ?? "",
                            dropdownDecoratorProps:
                                const DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                hintText: "Pilih Sekolah",
                              ),
                            ),
                            popupProps:
                                const PopupProps.menu(fit: FlexFit.loose),
                            onChanged: (School? e) {
                              controller.schoolId = e?.schoolId ?? "";
                              controller.update();
                            },
                          ),
                        
                          Visibility(
                            visible: controller.schoolId.isNotEmpty,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 24,
                                ),
                                const Text(
                                  "Kelas",
                                  style: TextStyle(
                                    color: Color(0xFF1D2E42),
                                    fontSize: 14,
                                    fontFamily: 'Gilroy-Bold',
                                    height: 0.12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                DropdownSearch<SchoolClass>(
                                  popupProps:
                                      const PopupProps.menu(fit: FlexFit.loose),
                                  validator: (SchoolClass? e) {
                                    if (e == null) {
                                      return "Mohon diisi terlebih dahulu";
                                    }
                                    return null;
                                  },
                                  asyncItems: (_) async {
                                    return AuthService()
                                        .getAllClassId(controller.schoolId);
                                  },
                                  itemAsString: (SchoolClass e) => e.name ?? "",
                                  dropdownDecoratorProps:
                                      const DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      hintText: "Pilih Kelas",
                                    ),
                                  ),
                                  onChanged: (SchoolClass? e) {
                                    controller.classId = e?.classId ?? "";

                                    controller.update();
                                  },
                                ),
                              ],
                            ),
                          ),
                          TextEditing(
                            focusNode: controller.passwordFocusNode,
                            onChange: controller.onChangePassword,
                            title: "Password",
                            hint: "Masukkan password",
                            showObsecure: controller.showObsecure,
                            validator: controller.onPasswordValidator,
                            obsecureText: controller.obsecureText,
                            controller: controller.passwordController,
                            onEditingComplete: controller
                                .onEditingCompletePasswordConfirmation,
                            icon: Image.asset(
                              "assets/images/iconly-bold-show.png",
                              width: 16.63,
                              height: 13.33,
                            ),
                          ),
                          TextEditing(
                            focusNode: controller.passwordConfirmationNode,
                            onChange: controller.onChangeConfirmPassword,
                            title: "Konfirmasi Password",
                            hint: "Masukkan Konfirmasi Password",
                            showObsecure: controller.showObsecureConfirm,
                            validator: controller.onPasswordConfirmation,
                            obsecureText: controller.obsecureText,
                            controller:
                                controller.passwordConfirmationController,
                            onEditingComplete: controller.register,
                            icon: Image.asset(
                              "assets/images/iconly-bold-show.png",
                              width: 16.63,
                              height: 13.33,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox.adaptive(
                                    visualDensity: const VisualDensity(
                                        horizontal: -4, vertical: -4),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    onChanged: controller.checkRemindMe,
                                    value: controller.isRemindMe,
                                    activeColor: const Color(0xffFF7A00),
                                  ),
                                  const Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Saya menyetujui',
                                          style: TextStyle(
                                            color: Color(0xFF90A8BF),
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' Syarat & Ketentuan',
                                          style: TextStyle(
                                            color: Color(0xFF1E4E5D),
                                            fontSize: 14,
                                            fontFamily: 'Gilroy-SemiBold',
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          SizedBox(
                            height: 51.70,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: controller.email.isEmpty &&
                                      controller.password.isEmpty &&
                                      controller.passwordConfirmation.isEmpty &&
                                      controller.namaLengkap.isEmpty
                                  ? null
                                  : controller.register,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: controller.isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      "Daftar",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Gilroy-Bold',
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () => Get.toNamed(
                                Routes.LOGIN,
                              ),
                              child: const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Sudah punya akun? ',
                                      style: TextStyle(
                                        color: Color(0xFF90A8BF),
                                        fontSize: 14,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Masuk sekarang',
                                      style: TextStyle(
                                        color: Color(0xFF1E4E5D),
                                        fontSize: 14,
                                        fontFamily: 'Gilroy-SemiBold',
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
