import 'package:audio_book_app/src/modules/home/presentation/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/routes/names.dart';
import '../../../../core/style/app_colors.dart';

class BestSellers extends GetView<HomeController> {
  const BestSellers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.0.w, vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Best Seller",
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
      FutureBuilder(
        future: controller.getBestSellerBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const _buildBestSellerBooks();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )
    ]);
  }
}

class _buildBestSellerBooks extends StatelessWidget {
  const _buildBestSellerBooks();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: "recommended_books",
      builder: (controller) => SizedBox(
        height: 145.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          // itemCount: 10,
          itemCount: controller.bestSellerBooks.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Container(
                  padding: EdgeInsets.only(left: 10.w),
                  width: 315.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.grey.shade300),
                  child: Row(
                    children: [
                      Center(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${controller.bestSellerBooks[index].bookCover}",
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
                                  width: 120.w,
                                  height: 120.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${controller.bestSellerBooks[index].bookName}",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          Text(
                              "${controller.bestSellerBooks[index].bookAuthor}",
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.grey)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(children: [
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
                          ]),
                          Row(
                            children: [
                              Text(
                                  "${controller.bestSellerBooks[index].totalListners}",
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.grey)),
                              Text("Listners",
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.grey)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
