import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/data/models/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failures, List<BookEntity>>> fetchNewsetBooks() async {
  
    try {
        List<BookEntity> books;
      books = homeLocalDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return right(books); 
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
          List<BookEntity> books;
      books = homeLocalDataSource.fetchNewsetBooks();
      if (books.isNotEmpty) {
        return right(books); 
      }
      books = await homeRemoteDataSource.fetchNewsetBooks();
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:computer science",
      );
      List<BookEntity> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
