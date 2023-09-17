// ignore_for_file: must_be_immutable

import '../../domain/entities/book_detail.dart';

class BookDetailModel extends BookDetail {
  BookDetailModel({
    required String? bookId,
    required String? bookName,
    required String? bookAuthor,
    required String? bookSummary,
    required String? bookCover,
    required String? bookRating,
    required List<dynamic> bookCategory,
    required String? bookAudioFile,
  }) : super(
            bookId: bookId,
            bookName: bookName,
            bookAuthor: bookAuthor,
            bookSummary: bookSummary,
            bookCover: bookCover,
            bookRating: bookRating,
            bookCategory: bookCategory,
            bookAudioFile: bookAudioFile);

  factory BookDetailModel.fromJson(Map<String, dynamic> json) {
    return BookDetailModel(
      bookId: json['book_id'],
      bookName: json['book_name'],
      bookAuthor: json['book_author'],
      bookSummary: json['book_summary'],
      bookCover: json['book_cover'],
      bookRating: json['book_rating'],
      bookCategory: json['book_category'],
      bookAudioFile: json['book_audio_file'],
    );
  }
}
