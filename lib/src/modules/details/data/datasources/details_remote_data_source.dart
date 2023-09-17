import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/book_detail_model.dart';

abstract class BaseDetailsRemoteDataSource {
  Future<BookDetailModel> getBookDetails(String bookId);

// Future<ReviewModel> getBookReviews();
}

class DetailsRemoteDataSource implements BaseDetailsRemoteDataSource {
  //get book details from backend
  final booksCollection = 'books';

  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Future<BookDetailModel> getBookDetails(String bookId) async {
    try {
      final result = await db.collection(booksCollection).doc(bookId).get();
      final bookDetails = BookDetailModel.fromJson(result.data()!);
      print("datasource : $bookDetails");
      return bookDetails;
    } catch (e) {
      print("datasource : $e");
      rethrow;
    }
  }
}
