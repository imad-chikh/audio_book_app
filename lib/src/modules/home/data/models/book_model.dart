// ignore_for_file: must_be_immutable

import 'package:audio_book_app/src/modules/home/domain/entities/book.dart';

class BookModel extends Book {
  BookModel({
    required String? bookId,
    required String? bookName,
    required String? bookCover,
    required String? bookAuthor,
    required String? bookRating,
    required String? totalListners,
  }) : super(
            bookId: bookId,
            bookName: bookName,
            bookCover: bookCover,
            bookAuthor: bookAuthor,
            bookRating: bookRating,
            totalListners: totalListners);

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      bookId: json['book_id'],
      bookName: json['book_name'],
      bookCover: json['book_cover'],
      bookAuthor: json['book_author'],
      bookRating: json['book_rating'],
      totalListners: json['total_listners'],
    );
  }
}
