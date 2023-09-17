import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/style/app_colors.dart';
import '../../../../core/utils/constances.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.0.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppConst.kAppLogo,
                height: 40.h,
                // fit: BoxFit.contain,
              ),
              SizedBox(width: 10.w),
              Text("Masamie",
                  style: TextStyle(
                      fontSize: 24.sp, color: AppColors.primaryColor)),
            ],
          ),
          IconButton(
              icon: Icon(
                Icons.settings_outlined,
                size: 24.h,
                color: AppColors.primaryColor,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}

//  SvgPicture.asset(
//                     AppConst.kAppLogo,
//                     height: 40.h,
//                     // fit: BoxFit.contain,
//                   ),

