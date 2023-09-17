import 'package:audio_book_app/src/core/style/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/book_play_controller.dart';

class BookPlayerScreen extends GetView<BookPlayerController> {
  const BookPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_downward)),
        title: Text("${controller.bookDetails.bookName}"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
          Center(
            child: SizedBox(
              height: 319.h,
              width: 319.w,
              child: Center(
                child: CachedNetworkImage(
                    imageUrl: "${controller.bookDetails.bookCover}",
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
                          // width: 160.w,
                          // height: 160.h,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 8,
                                offset: const Offset(2, 5),
                                blurRadius: 8,
                              ),
                            ],
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          //title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Text(
              "${controller.bookDetails.bookName}",
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          //author
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Text(
              "${controller.bookDetails.bookAuthor}",
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                color: Colors.black26,
              ),
            ),
          ),
          //biuld player timeline
          //progress bar for the audio
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Slider(
              onChanged: (value) {
                print("$value");
              },
              activeColor: AppColors.primaryColor,
              value: 0.5,
              inactiveColor: Colors.grey.shade300,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "00:00",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.black26,
                  ),
                ),
                Text(
                  "${controller.duration}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
          ),
          //player controller
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //player options

              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_up_outlined,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.deepPurple,
                      child: CircleAvatar(
                          radius: 18.r,
                          backgroundColor: Colors.white,
                          child: Center(
                              child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 18.r,
                          ))))),
              IconButton(
                  onPressed: () {
                    controller.playBook();
                  },
                  icon: CircleAvatar(
                    radius: 35.r,
                    backgroundColor: AppColors.primaryColor,
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.play,
                        size: 30.r,
                        color: Colors.white,
                      ),
                    ),
                  )),
              IconButton(
                  onPressed: () {
                    controller.pauseBook();
                  },
                  icon: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.deepPurple,
                      child: CircleAvatar(
                          radius: 18.r,
                          backgroundColor: Colors.white,
                          child: Center(
                              child: Icon(
                            Icons.arrow_forward_ios,
                            size: 18.r,
                          ))))),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.upload,
                    size: 30,
                  )),
              //player options
            ],
          )
          //player options
        ],
      ),
    );
  }
}
