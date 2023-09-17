import 'package:audio_book_app/src/core/style/app_text_style.dart';
import 'package:audio_book_app/src/core/utils/constances.dart';
import 'package:audio_book_app/src/modules/welcome/presentation/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../config/routes/names.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/my_primary_button.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        PageView(
          allowImplicitScrolling: false,
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppConst.onboardingOne,
                      height: 260.h,
                      width: 260.w,
                    ),
                    Text(
                      "Title One",
                      style: AppTextStyle.kTitleTextLightStyle,
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet la maryame dor sut colondeum.",
                      textAlign: TextAlign.center,
                    ),
                  ]),
            ),
            Container(
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppConst.onboardingTwo,
                      height: 260.h,
                      width: 260.w,
                    ),
                    Text(
                      "Title Two",
                      style: AppTextStyle.kTitleTextLightStyle,
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet la maryame dor sut colondeum.",
                      textAlign: TextAlign.center,
                    ),
                  ]),
            ),
            Container(
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppConst.onboardingThree,
                      height: 260.h,
                      width: 260.w,
                    ),
                    Text(
                      "Title Three",
                      style: AppTextStyle.kTitleTextLightStyle,
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet la maryame dor sut colondeum.",
                      textAlign: TextAlign.center,
                    ),
                  ]),
            ),
          ],
        ),
        SvgPicture.asset(
          AppConst.kBgPatern,
          width: 375.w,
        ),
        Align(
          // bottom: 80.h,
          // rign: ,
          alignment: Alignment.bottomCenter,
          child: GetBuilder<OnboardingController>(
            id: "onboard_button",
            builder: (controller) => controller.pageIndex != 2
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 140.w,
                        child: TextButton(
                          onPressed: () {
                            controller.skipButton();
                          },
                          child: Text(
                            "Skip",
                            style: AppTextStyle.kTitleTextLightStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      kMainButton(
                          text: "Next",
                          width: 140.w,
                          OnPressed: () {
                            controller.nextPageButton();
                            print("${controller.pageIndex}");
                          }),
                    ],
                  )
                : kMainButton(
                    text: "Lets Get Started",
                    OnPressed: () {
                      Get.offNamed(AppRoutes.Login);
                    }),
          ),
        ),
      ]),
    ));
  }
}
