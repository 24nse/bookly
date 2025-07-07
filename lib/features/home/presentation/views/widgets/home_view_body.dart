import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/featuted_books_list_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/widgets/custom_text.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
               padding:  EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              FeatutedBooksListViewBuilder(),
              SizedBox(height: 50),
              Padding(
               padding:  EdgeInsets.symmetric(horizontal: 30),
                child: CustomText("Newset Books", style: Styles.textStyle18),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverFillRemaining(
        child:const Padding(
               padding:  EdgeInsets.symmetric(horizontal: 30),
          child: BestSellerListView(),
        ),
        ),
      ],
    );
    
    
  
  }
}
