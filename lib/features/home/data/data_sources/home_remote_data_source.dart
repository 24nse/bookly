import 'package:bookly/conastans.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/function/save_books.dart';
import 'package:bookly/features/home/data/models/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({
    int pageNumber = 0,
  });
  Future<List<BookEntity>> fetchNewsetBooks({
    int pageNumber = 0,
  });
  Future<List<BookEntity>> fetchSimilarBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber=0}) async {
    var data = await apiService.get(
      endPoint: "volumes?Filtering=free-ebooks&q=subject:Programming&startIndex=${pageNumber * 10}",
    );
    List<BookEntity> books = getBooksList(data);

    saveBooksData(books,kFeaturedBox);

    return books;
  }

  

  @override
  Future<List<BookEntity>> fetchNewsetBooks({int pageNumber=0}) async {
    var data = await apiService.get(
      endPoint:
          "volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Programming&startIndex=${pageNumber * 10}",
    );
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books,kNewsetBox);
    return books;
  }
  
  @override
  Future<List<BookEntity>> fetchSimilarBooks({int pageNumber = 0}) async{
    var data = await apiService.get(
      endPoint:
          "volumes?Filtering=free-ebooks&Sorting=newest&q=subject:computer science&startIndex=${pageNumber * 10}",
    );
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books,kSimilarBooksBox);
    return books;
  }
}




List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  if (data["items"] != null) {
    for (var item in data["items"]) {
      books.add(BookModel.fromJson(item));
    }
  }
  return books;
}
