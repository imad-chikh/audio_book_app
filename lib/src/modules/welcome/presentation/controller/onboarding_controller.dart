import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  @override
  void nextPageButton() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    update(["onboard_button"]);
  }

//skip
  void skipButton() {
    //skip to the last page
    pageController.jumpToPage(2);
    update(["onboard_button"]);
  }

  //getpageindex if index  is page 3 then display the getstarted button
  int get pageIndex =>
      pageController.hasClients ? pageController.page?.round() ?? 0 : 0;
//obs index page

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
