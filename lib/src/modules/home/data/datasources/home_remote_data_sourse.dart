import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/book_model.dart';

abstract class BaseHomeRemoteDataSource {
  // final db = FirebaseFirestore.instance;
  Future<List<BookModel>> getRecommendedBooks();

  // Future<List<BookModel>> getTrendingNowBooks();

  // Future<List<BookModel>> getNewReleasesBooks();

  Future<List<BookModel>> getBestSellerBooks();
}

class HomeRemoteDataSourse extends BaseHomeRemoteDataSource {
  // HomeRemoteDataSourse(this.db) : super);
  final RecommendedForYou = "recommended_books";

  final BestSeller = "best_seller_books";

  final db = FirebaseFirestore.instance;
// get recommended for you books
  @override
  Future<List<BookModel>> getRecommendedBooks() async {
    final result = await db.collection(RecommendedForYou).get().then((value) =>
        value.docs.map((e) => BookModel.fromJson(e.data())).toList());
    print("datasourve :  $result");

    return result;
  }

// // get trending books
//   Future<List<BookModel>> getTrendingNowBooks() async {
//     final result = await db.collection(RecommendedForYou).get().then((value) =>
//         value.docs.map((e) => BookModel.fromJson(e.data())).toList());
//     return result;
//   }

//   // get new releases books
//   Future<List<BookModel>> getNewReleasesBooks() async {
//     final result = await db.collection(RecommendedForYou).get().then((value) =>
//         value.docs.map((e) => BookModel.fromJson(e.data())).toList());
//     return result;
//   }

  // get best seller books
  @override
  Future<List<BookModel>> getBestSellerBooks() async {
    final result = await db.collection(BestSeller).get().then((value) =>
        value.docs.map((e) => BookModel.fromJson(e.data())).toList());
    return result;
  }
}
