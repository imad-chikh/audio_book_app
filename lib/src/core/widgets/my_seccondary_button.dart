import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../style/app_colors.dart';
import '../style/app_text_style.dart';

kAccentButton({
  required text,
  width = double.infinity,
}) {
  return GestureDetector(
      child: Container(
          height: 56.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(08.r))),
          child: Center(
              child: Text(
            text,
            style: AppTextStyle.kNormalTextLightStyle
                .copyWith(fontWeight: FontWeight.w500),
          ))));
}

kAccentButtonWithIcon({
  required text,
  required icon,
  width = double.infinity,
  required Function()? OnPressed,
}) {
  return GestureDetector(
      onTap: OnPressed,
      child: Container(
          height: 56.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(08.r))),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                icon,
                height: 20.h,
                width: 20.w,
                color: AppColors.primaryColor,
              ),
              Text(
                text,
                style: AppTextStyle.kNormalTextLightStyle.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.primaryColor),
              ),
            ],
          ))));
}
