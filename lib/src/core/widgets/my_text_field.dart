import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

kTextField({
  controller,
  hint,
  String? Function(String?)? validator,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
    height: 53.h,
    child: TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          hintStyle: TextStyle(
            color: const Color(0xFFBDBDBD),
            fontSize: 14.sp,
          ),
          filled: true,
          fillColor: const Color(0xFFF5F5FA),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: Color(0xFFF5F5FA),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: Color(0xFFF5F5FA),
            ),
          )),
    ),
  );
}
