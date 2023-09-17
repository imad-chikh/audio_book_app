import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_style.dart';
import '../../../../core/utils/constances.dart';
import '../../../../core/widgets/my_primary_button.dart';
import '../../../../core/widgets/my_seccondary_button.dart';
import '../../../../core/widgets/my_text_field.dart';

class SignUpConfirmationCode extends StatelessWidget {
  const SignUpConfirmationCode({super.key});

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
              'Confirmation Code',
              textAlign: TextAlign.start,
              style: AppTextStyle.kTitleTextLightStyle,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.h),
              child: RichText(
                text: TextSpan(
                  text: 'Enter the confirmation code we sent to ',
                  style: AppTextStyle.kNormalTextLightStyle
                      .copyWith(fontSize: 16.sp),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'your@mail.com',
                        style: AppTextStyle.kNormalTextLightStyle.copyWith(
                            color: AppColors.textColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            //code textfield
            kTextField(hint: "Confirmation Code"),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn\'t recieve the code?',
                  style: AppTextStyle.kNormalTextLightStyle,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend',
                      style: AppTextStyle.kTitleTextLightStyle.copyWith(
                          color: AppColors.secondaryColor, fontSize: 14.sp),
                    )),
                //register button
              ],
            ),

            //register button
            kMainButton(text: "Submit", OnPressed: () {}),
            //cancel button
            kAccentButton(text: 'Cancel'),
          ],
        ),
      ),
    );
  }
}
