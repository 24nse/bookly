import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatutedBooksListView extends StatelessWidget {
  const FeatutedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
              
                return  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: (){
                          GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[index]);
                    },
                    child: CustomBookImage(

                      imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? 'assets/images/Logo.png',
                    ),
                  ),
                );
              },
            ),
          );
        }
          else if(state is FeaturedBooksFailure){
             
    return  CustomErrorWidget(errMessage: state.errMessage);
  }else{
    return const CustomLoadingIndicator();
  }
      },
    );
  }

}
