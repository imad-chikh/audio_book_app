import 'package:audio_book_app/src/core/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24.r,
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User Name",
                  style: AppTextStyle.kNormalTextLightStyle,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber.shade700,
                      size: 20.h,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber.shade700,
                      size: 20.h,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber.shade700,
                      size: 20.h,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber.shade700,
                      size: 20.h,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.amber.shade700,
                      size: 20.h,
                    ),
                    const Text("2 days ago ")
                  ],
                ),
              ],
            )
          ],
        ),
        const Text(
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Exercitation veniam consequat sunt nostrud amet. Velit officia consequat duis enim velit mollit. "),
        const Placeholder(),
      ],
    );
  }
}
