import 'package:audio_book_app/src/config/routes/names.dart';
import 'package:audio_book_app/src/core/style/app_colors.dart';
import 'package:audio_book_app/src/core/utils/constances.dart';
import 'package:audio_book_app/src/modules/auth/presentation/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/style/app_text_style.dart';
import '../../../../core/widgets/my_primary_button.dart';
import '../../../../core/widgets/my_text_field.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //logo
              SvgPicture.asset(
                AppConst.kAppLogo,
                height: 120.h,
                width: 120.w,
              ),
              Text(
                'Login to Your Account',
                textAlign: TextAlign.start,
                style: AppTextStyle.kTitleTextLightStyle,
              ),
              //email textfield
              kTextField(
                hint: "Email",
                controller: controller.emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email is required";
                  }
                  return null;
                },
              ),
              //password textfield
              kTextField(
                  hint: "Password",
                  controller: controller.passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  }),
              //remember me checkbox
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text(
                    'Remember me',
                    style: AppTextStyle.kNormalTextLightStyle,
                  ),
                ],
              ),
              //login button
              GetBuilder<LoginController>(
                // init: LoginController(controller.authRepository),
                id: "login_button",
                builder: (controller) => controller.isLoading
                    ? loadingButton()
                    : kMainButton(
                        text: "Login",
                        OnPressed: () {
                          Get.offNamed(AppRoutes.Home);
                          //! print("login");
                          // controller.login(
                          //   controller.emailController.text.trim(),
                          //   controller.passwordController.text.trim(),
                          // );
                        },
                      ),
              ),
              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyle.kTitleTextLightStyle.copyWith(
                            color: AppColors.secondaryColor, fontSize: 14.sp),
                      )),
                  //forgot password button
                ],
              ),
              Text(
                'Or login with',
                style: AppTextStyle.kNormalTextLightStyle,
              ),
              //social media buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an accoun\'t?',
                    style: AppTextStyle.kNormalTextLightStyle,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.SignUp);
                      },
                      child: Text(
                        'Register',
                        style: AppTextStyle.kTitleTextLightStyle.copyWith(
                            color: AppColors.secondaryColor, fontSize: 14.sp),
                      )),
                  //register button
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
