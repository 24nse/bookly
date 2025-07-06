import 'package:bookly/conastans.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly/core/widgets/custom_text.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
final  BookEntity book ;
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
            CustomBookImage(imageUrl: book.image ?? 'assets/images/Logo.png'),
        
           const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child:  CustomText(
                      book.title ?? 'Title not available',
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis ,
                    ),
                  ),
                 const SizedBox(height: 3,),
                  CustomText(
                    (book.authorName?.isNotEmpty ?? false)
                      ? book.authorName!
                      : 'Unknown Author',
                    style: Styles.textStyle14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                                           const SizedBox(height: 3,),
              
                 Row(
                  children: [
                    CustomText("Free",style: Styles.textStyle20.copyWith(
                      fontWeight: FontWeight.bold
                    ),),
                   const Spacer(),
                    BookRating(
                    rating: book.rating?? 0,
                    count: book.ratingsCount??0 ,
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
