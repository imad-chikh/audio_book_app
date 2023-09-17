// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class BookReview extends Equatable {
  String? id;
  String? bookId;
  String? userId;
  String? userName;
  String? review;
  String? rating;
  String? createdAt;
  String? userPhoto;

  BookReview({
    this.id,
    this.bookId,
    this.userId,
    this.userName,
    this.review,
    this.rating,
    this.createdAt,
    this.userPhoto,
  });

  @override
  List<Object?> get props => [
        id,
        bookId,
        userId,
        userName,
        review,
        rating,
        createdAt,
        userPhoto,
      ];
}
