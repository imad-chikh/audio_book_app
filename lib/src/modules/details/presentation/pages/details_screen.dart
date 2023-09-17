import 'package:audio_book_app/src/config/routes/names.dart';
import 'package:audio_book_app/src/core/widgets/my_primary_button.dart';
import 'package:audio_book_app/src/core/widgets/my_seccondary_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/style/app_text_style.dart';
import '../../../../core/utils/constances.dart';
import '../controllers/details_controller.dart';
import '../widgets/review_card.dart';

class DetailsScreen extends GetView<DetailsController> {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "${Get.arguments[1]}",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            )),
        body: FutureBuilder(
          future: controller.getBookDetailsById(Get.arguments[0]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //book cover
                        Center(
                          child: SizedBox(
                            height: 260.h,
                            width: 260.w,
                            child: Center(
                              child: CachedNetworkImage(
                                  imageUrl:
                                      "${controller.bookDetail.bookCover}",
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  cacheManager: CacheManager(Config(
                                      'customCacheKey',
                                      stalePeriod: const Duration(days: 7))),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                        Icons.error,
                                        size: 100,
                                        color: Colors.red,
                                      ),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                        // width: 160.w,
                                        // height: 160.h,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )),
                            ),
                          ),
                        ),
                        //book title
                        Text(
                          "${controller.bookDetail.bookName}",
                          style: AppTextStyle.kTitleTextLightStyle.copyWith(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                        // book author
                        Text(
                          "${controller.bookDetail.bookAuthor}",
                          style: AppTextStyle.kTitleTextLightStyle.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black26),
                        ),
                        //rating
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber.shade700,
                              size: 28,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber.shade700,
                              size: 28,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber.shade700,
                              size: 28,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber.shade700,
                              size: 28,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.amber.shade700,
                              size: 28,
                            ),
                            Text("${controller.bookDetail.bookRating}")
                          ],
                        ),
                        // categories
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //border color

                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text("${controller.bookDetail.bookCategory}"),
                        ),
                        //row with Play Audio & Read Book
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            kMainButtonWithIcon(
                                width: 148.w,
                                text: "Play Audio",
                                icon: AppConst.kPlayIconLight,
                                OnPressed: () {
                                  Get.toNamed(AppRoutes.BookPlayer,
                                      arguments: controller.bookDetail);
                                  print(
                                      "${controller.bookDetail.bookAudioFile}");
                                }),
                            kAccentButtonWithIcon(
                                OnPressed: () {},
                                width: 148.w,
                                text: "Read Book",
                                icon: AppConst.kLibraryOutlined)
                          ],
                        ),
                        //summary
                        Text("Summary",
                            style: AppTextStyle.kTitleTextLightStyle),
                        Text("${controller.bookDetail.bookSummary}"), //reviews
                        Text("Review",
                            style: AppTextStyle.kTitleTextLightStyle),
                        const ReviewCard(),
                      ]));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              
              return const Center(child: Text("Error"));
            }
          },
        ));
  }
}
