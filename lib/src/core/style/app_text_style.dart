import 'package:audio_book_app/src/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static const String fontName = 'Poppins';

  static TextStyle kTitleTextLightStyle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: AppColors.textColor,
  );
  static TextStyle kNormalTextLightStyle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 14.sp,
    color: AppColors.textColor,
  );
}
