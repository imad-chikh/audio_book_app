// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class BookDetail extends Equatable {
  String? bookId;
  String? bookName;
  String? bookAuthor;
  String? bookSummary;
  String? bookCover;
  String? bookRating;
  List<dynamic> bookCategory;
  //! List<BookReview>? bookReviews;
  //! String? bookPdfFile;
  String? bookAudioFile;

  BookDetail({
    required this.bookId,
    required this.bookName,
    required this.bookAuthor,
    required this.bookSummary,
    required this.bookCover,
    required this.bookRating,
    required this.bookCategory,
    //! required this.bookReviews,
    //! required this.bookPdfFile,
    required this.bookAudioFile,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        bookId,
        bookName,
        bookAuthor,
        bookSummary,
        bookCover,
        bookRating,
        bookCategory,
        bookAudioFile
      ];
}
