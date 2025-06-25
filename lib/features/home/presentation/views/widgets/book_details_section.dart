import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const     BookDetailsSection({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child:  CustomBookImage(
            imageUrl:bookModel.volumeInfo.imageLinks?.thumbnail ?? 'https://www.bigfootdigital.co.uk/wp-content/uploads/2020/07/image-optimisation-scaled.jpg',
          ),
        ),
        const SizedBox(height: 43),
        Text(
          bookModel.volumeInfo.title ?? 'Title not available',
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),

        Opacity(
          opacity: .7,
          child: Text(
            (bookModel.volumeInfo.authors?.isNotEmpty ?? false)
              ? bookModel.volumeInfo.authors!.first
              : 'Unknown Author',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),

         BookRating(
          rating: bookModel.volumeInfo.averageRating??0,
          count: bookModel.volumeInfo.ratingsCount??0,
          mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(height: 37),
         BooksAction(bookModel: bookModel,),
      ],
    );
  }
}

