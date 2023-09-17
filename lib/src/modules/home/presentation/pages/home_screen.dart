import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../search/presentation/pages/search_screen.dart';
import '../controller/home_controller.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/home_best_sellers.dart';
import '../widgets/home_categories.dart';
import '../widgets/home_new_release.dart';
import '../widgets/home_recommended_for_you.dart';
import '../widgets/home_trending_now.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavBarHome(),
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeScreenMain(),
            SearchScreen(),
            SearchScreen(),
          ],
        ),
      ),
    );
  }
}

class HomeScreenMain extends StatelessWidget {
  const HomeScreenMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: HomeAppBar(),
        ),
        SliverToBoxAdapter(
          child: HomeCategories(),
        ),
        SliverToBoxAdapter(
          child: RecommendedForYou(),
        ),
        SliverToBoxAdapter(
          child: BestSellers(),
        ),
        SliverToBoxAdapter(
          child: NewReleases(),
        ),
        SliverToBoxAdapter(
          child: TrendingNow(),
        )
        //new release
        //trending now
      ],
    );
  }
}
