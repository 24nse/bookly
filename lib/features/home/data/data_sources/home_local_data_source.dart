import 'package:bookly/conastans.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> getFeaturedBooks({int pageNumber = 0});
  List<BookEntity> getNewsetBooks({int pageNumber = 0});
  List<BookEntity> fetchSimilarBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity>getFeaturedBooks( {int pageNumber = 0}) {
    int start = pageNumber * 10;
    int end = (pageNumber+1)*10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if (length == 0 || start >= length || end > length) {
      return [];
    }
    return box.values.toList().sublist(start, end);
  }

  @override
  List<BookEntity> getNewsetBooks({int pageNumber = 0}) {
    int start = pageNumber * 10;
    int end = (pageNumber+1)*10;
    var box = Hive.box<BookEntity>(kNewsetBox);
    int length = box.values.length;
    if (length == 0 || start >= length || end > length) {
      return [];
    }
    return box.values.toList().sublist(start, end);
  }

  @override
  List<BookEntity> fetchSimilarBooks({int pageNumber = 0}) {
    int start = pageNumber * 10;
    int end = (pageNumber+1)*10;
    var box = Hive.box<BookEntity>(kSimilarBooksBox);
    int length = box.values.length;
    if (length == 0 || start >= length || end > length) {
      return [];
    }
    return box.values.toList().sublist(start, end);
  }
}
