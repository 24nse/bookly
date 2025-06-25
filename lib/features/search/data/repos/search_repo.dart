import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/models/book_model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<BookModel>>> searchBooks(String query);
} 