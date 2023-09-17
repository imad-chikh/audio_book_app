// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Book extends Equatable {
  String? bookId;
  String? bookName;
  String? bookAuthor;
  String? bookCover;
  String? bookRating;
  String? totalListners;

  Book({
    required this.bookId,
    required this.bookName,
    required this.bookCover,
    required this.bookAuthor,
    required this.bookRating,
    required this.totalListners,
  });

  @override
  List<Object?> get props =>
      [bookId, bookName, bookCover, bookAuthor, bookRating, totalListners];
}
