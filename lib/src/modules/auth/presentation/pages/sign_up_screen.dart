import 'package:audio_book_app/src/core/style/app_colors.dart';
import 'package:audio_book_app/src/modules/auth/presentation/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/style/app_text_style.dart';
import '../../../../core/utils/constances.dart';
import '../../../../core/widgets/my_primary_button.dart';
import '../../../../core/widgets/my_seccondary_button.dart';
import '../../../../core/widgets/my_text_field.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
              'Register',
              textAlign: TextAlign.start,
              style: AppTextStyle.kTitleTextLightStyle,
            ),
            //name textfield
            kTextField(hint: "Name"),
            //email textfield
            kTextField(hint: "Email"),
            //password textfield
            kTextField(hint: "Password"),
//text with textbuttons inside it
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.h),
              child: RichText(
                text: TextSpan(
                  text: 'By signing up, you agree to our ',
                  style: AppTextStyle.kNormalTextLightStyle,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Terms of Service',
                        style: AppTextStyle.kNormalTextLightStyle.copyWith(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.bold)),
                    const TextSpan(text: ' and that you have read our '),
                    TextSpan(
                        text: 'Cookies Policy',
                        style: AppTextStyle.kNormalTextLightStyle.copyWith(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.bold)),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
            //register button
            kMainButton(text: "Register", OnPressed: () {}),
            //cancel button
            kAccentButton(text: 'Cancel'),
          ],
        ),
      ),
    );
  }
}
