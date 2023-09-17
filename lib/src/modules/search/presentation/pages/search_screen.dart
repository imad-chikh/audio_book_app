import 'package:audio_book_app/src/core/style/app_text_style.dart';
import 'package:audio_book_app/src/core/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../home/presentation/widgets/app_bar.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        const SliverToBoxAdapter(
          child: HomeAppBar(),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Text(
                  "Explore",
                  style: AppTextStyle.kTitleTextLightStyle
                      .copyWith(fontSize: 24.sp),
                ),
              ),
              kTextField(hint: "Search Books or Author .."),
            ],
          ),
        ),
      ]),
    );
  }
}
