import 'package:audio_book_app/src/modules/home/presentation/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/routes/names.dart';
import '../../../../core/style/app_colors.dart';

class RecommendedForYou extends GetView<HomeController> {
  const RecommendedForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getRecemondedBooks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _buildRecommendedForYou();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildRecommendedForYou() {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.0.w, vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Recommended For You",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            TextButton(
                onPressed: () {
                  // print("go to details");
                  // Get.toNamed(AppRoutes.Details,
                    // );

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
          height: 300.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            // itemCount: 10,
            physics: const BouncingScrollPhysics(),
            itemCount: controller.recemondedBooks.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.Details,
                      arguments: [controller.recemondedBooks[index].bookId,   controller.recemondedBooks[index].bookName]);
                  // print("go to details");
                  // print("${controller.recemondedBooks[index].bookId}");
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Center(
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
                                width: 200.w,
                                height: 300.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              )),
                    )),
              );
            },
          ),
        ),
      ),
    ]);
  }
}
