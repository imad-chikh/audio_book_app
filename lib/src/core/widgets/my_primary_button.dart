import 'package:audio_book_app/src/core/style/app_colors.dart';
import 'package:audio_book_app/src/core/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

kMainButton({
  required text,
  width = double.infinity,
  required Function()? OnPressed,
}) {
  return InkWell(
      onTap: OnPressed,
      child: Container(
          height: 56.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          width: width,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(08.r))),
          child: Center(
              child: Text(
            text,
            style: AppTextStyle.kNormalTextLightStyle
                .copyWith(color: Colors.white),
          ))));
}

kMainButtonWithIcon({
  required text,
  required icon,
  width = double.infinity,
  required Function()? OnPressed,
}) {
  return InkWell(
      onTap: OnPressed,
      child: Container(
          height: 56.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          width: width,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(08.r))),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(icon, height: 24.h, width: 24.w),
              Text(
                text,
                style: AppTextStyle.kNormalTextLightStyle
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ))));
}

loadingButton({
  width = double.infinity,
}) {
  return Container(
      height: 56.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      width: width,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(08.r))),
      child: const Center(
          child: CircularProgressIndicator(
        color: Colors.white,
      )));
}
