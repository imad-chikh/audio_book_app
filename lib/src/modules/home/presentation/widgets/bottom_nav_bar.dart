import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constances.dart';
import '../controller/home_controller.dart';

class BottomNavBarHome extends StatelessWidget {
  const BottomNavBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: "bottom_nav_bar",
        builder: (controller) => BottomNavigationBar(
            onTap: (index) {
              controller.changeBottomNavBar(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: controller.bottomNavBarIndex == 0
                    ? SvgPicture.asset(AppConst.kHomeFilled)
                    : SvgPicture.asset(AppConst.kHomeOutlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: controller.bottomNavBarIndex == 1
                      ? SvgPicture.asset(AppConst.kSearchFilled)
                      : SvgPicture.asset(AppConst.kSearchOutlined),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: controller.bottomNavBarIndex == 2
                      ? SvgPicture.asset(AppConst.kLibraryFilled)
                      : SvgPicture.asset(AppConst.kLibraryOutlined),
                  label: "Library"),
            ],
            currentIndex: 0));
  }
}
