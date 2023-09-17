import 'package:audio_book_app/src/modules/home/domain/usecases/get_best_seller_books.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/book.dart';
import '../../domain/repositories/base_home_repository.dart';
import '../../domain/usecases/get_recommended_books.dart';

class HomeController extends GetxController {
  final BaseHomeRepository homeRepository;
  HomeController(this.homeRepository);
  // List<Book> recemondedBooks = [
  //   Book(
  //       bookAuthor: "ahmed",
  //       bookCover: "https://m.media-amazon.com/images/I/51-nXsSRfZL.jpg",
  //       bookId: "id",
  //       bookName: "book name",
  //       bookRating: 4.5,
  //       totalListners: 324),
  //   Book(
  //       bookAuthor: "ahmed",
  //       bookCover: "https://m.media-amazon.com/images/I/51-nXsSRfZL.jpg",
  //       bookId: "id",
  //       bookName: "book name",
  //       bookRating: 4.5,
  //       totalListners: 324),
  //   Book(
  //       bookAuthor: "ahmed",
  //       bookCover: "https://m.media-amazon.com/images/I/51-nXsSRfZL.jpg",
  //       bookId: "id",
  //       bookName: "book name",
  //       bookRating: 4.5,
  //       totalListners: 324),
  // ];
  List<Book> recemondedBooks = [];

  List<Book> bestSellerBooks = [];

  int bottomNavBarIndex = 0;
  final PageController pageController = PageController();

  //bottom nav bar
  changeBottomNavBar(int index) {
    bottomNavBarIndex = index;
    pageController.jumpToPage(index);
    update(["bottom_nav_bar"]);
  }

  //show recemended books
  Future<List<Book>> getRecemondedBooks() async {
    final result = await GetRecommendedBooksUseCase(homeRepository).call();
    result.fold((failure) => print("Something went wrong"),
        (seccuss) => recemondedBooks = seccuss);
    update(["recemonded_books"]);
    return recemondedBooks;
  }

  //show best seller books
  Future<List<Book>> getBestSellerBooks() async {
    final result = await GetBestSellerBooksUseCase(homeRepository).call();
    result.fold((failure) => print("Something went wrong"),
        (seccuss) => bestSellerBooks = seccuss);
    update(["best_seller_books"]);
    return bestSellerBooks;
  }

  @override
  void onInit() async {
    await getRecemondedBooks();
    await getBestSellerBooks();
    super.onInit();
  }
}
