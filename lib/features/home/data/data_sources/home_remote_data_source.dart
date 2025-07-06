import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewsetBooks();
}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{

final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService); 

  @override
  Future<List<BookEntity>> fetchFeaturedBooks()async {
   
      var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=subject:Programming",
      );
      List<BookEntity> books = getBooksList(data);
      return books;
     
  }

  

  @override
  Future<List<BookEntity>> fetchNewsetBooks() {
    // TODO: implement fetchNewsetBooks
    throw UnimplementedError();
  }

}

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
         List<BookEntity> books = [];
    for (var item in data["items"]) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }