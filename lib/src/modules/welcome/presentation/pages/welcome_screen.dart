import 'package:audio_book_app/src/core/style/app_colors.dart';
import 'package:audio_book_app/src/core/style/app_text_style.dart';
import 'package:audio_book_app/src/core/widgets/my_primary_button.dart';
import 'package:audio_book_app/src/core/widgets/my_seccondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/constances.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('welcome !',
                  style: AppTextStyle.kTitleTextLightStyle
                      .copyWith(color: AppColors.secondaryColor)),
              Text(
                'Find what you are looking for',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 48.sp,
                    fontWeight: FontWeight.w200),
              ),
              Text(
                  'By personalize your account, we can help you to find what you like.',
                  style: AppTextStyle.kNormalTextLightStyle
                      .copyWith(color: AppColors.textColor, fontSize: 14.sp)),
              kMainButton(
                text: "Personalize Your Account",
                width: 295.w,
                OnPressed: () {},
              ),
              kAccentButton(
                text: 'Skip',
                width: 295.w,
              ),
            ],
          ),
        ),
        SvgPicture.asset(
          AppConst.kBgPatern,
          width: 375.w,
        ),
      ]),
    ));
  }
}
