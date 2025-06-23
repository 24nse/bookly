

import 'package:bookly/conastans.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
final  BookModel book ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(imageUrl: book.volumeInfo.imageLinks!.thumbnail),
            // AspectRatio(
            //   aspectRatio: 2.5 / 4,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(8),
            //       color: Colors.red,
            //       image: const DecorationImage(
            //         fit: BoxFit.fill,
            //         image: AssetImage(AssetsData.testImage),
            //       ),
            //     ),
            //   ),
            // ),
           const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child:  Text(
                      book.volumeInfo.title!,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis ,
                    ),
                  ),
                 const SizedBox(height: 3,),
                  Text(book.volumeInfo.authors![0],style: Styles.textStyle14,),
                                           const SizedBox(height: 3,),
              
                 Row(
                  children: [
                    Text("Free",style: Styles.textStyle20.copyWith(
                      fontWeight: FontWeight.bold
                    ),),
                   const Spacer(),
                    BookRating(
                    rating: book.volumeInfo.averageRating?? 0,
                    count: book.volumeInfo.ratingsCount??0 ,
                  ),
                  ],
                 ),
              
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
