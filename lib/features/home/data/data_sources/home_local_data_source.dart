import 'package:bookly/conastans.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> getFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewsetBooks();
  List<BookEntity> fetchSimilarBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity>getFeaturedBooks( {int pageNumber = 0}) {
    int start = pageNumber * 10;
    int end = (pageNumber+1)*10;
    var box = Hive.box<BookEntity>(KFeaturedBox);
    int length = box.values.length;
    if (start >= length || end > length) {
      return [];
    }
    return box.values.toList().sublist(start, end);
  }

  @override
  List<BookEntity> fetchNewsetBooks() {
    var box = Hive.box<BookEntity>(KNewsetBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchSimilarBooks() {
    var box = Hive.box<BookEntity>(KSimilarBooksBox);
    return box.values.toList();
  }
}
