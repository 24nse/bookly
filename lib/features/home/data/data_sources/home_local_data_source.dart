import 'package:bookly/conastans.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewsetBooks();
  List<BookEntity> fetchSimilarBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(KFeaturedBox);
    return box.values.toList();
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
