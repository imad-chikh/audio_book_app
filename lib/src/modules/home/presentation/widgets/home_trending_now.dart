import 'package:audio_book_app/src/modules/home/presentation/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/routes/names.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_style.dart';

class TrendingNow extends StatelessWidget {
  const TrendingNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.0.w, vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Trending Now",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            TextButton(
                onPressed: () {
                  print("go to details");
                  Get.toNamed(AppRoutes.Details);
                },
                child: Text("See more",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor)))
          ],
        ),
      ),
      GetBuilder<HomeController>(
        id: "recommended_books",
        builder: (controller) => SizedBox(
          height: 200.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            // itemCount: 10,
            physics: const BouncingScrollPhysics(),
            itemCount: controller.recemondedBooks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${controller.recemondedBooks[index].bookCover}",
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            cacheManager: CacheManager(Config('customCacheKey',
                                stalePeriod: const Duration(days: 7))),
                            errorWidget: (context, url, error) => const Icon(
                                  Icons.error,
                                  size: 100,
                                  color: Colors.red,
                                ),
                            imageBuilder: (context, imageProvider) => Container(
                                  width: 160.w,
                                  height: 160.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),
                      ),
                      Text("${controller.recemondedBooks[index].bookName}",
                          style: AppTextStyle.kNormalTextLightStyle
                              .copyWith(fontWeight: FontWeight.w500)),
                    ]),
              );
            },
          ),
        ),
      ),
    ]);
  }
}
