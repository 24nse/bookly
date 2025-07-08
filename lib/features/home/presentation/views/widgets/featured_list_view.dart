import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FeaturedBooksListView extends HookWidget {
  const FeaturedBooksListView({Key? key, required this.books}) : super(key: key);

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final nextPage = useState(1);
    final isLoading = useState(false);

    useEffect(() {
      void scrollListener() async {
        var currentPositions = scrollController.position.pixels;
        var maxScrollLength = scrollController.position.maxScrollExtent;
        if (currentPositions >= 0.7 * maxScrollLength) {
          if (!isLoading.value) {
            isLoading.value = true;
            await BlocProvider.of<FeaturedBooksCubit>(context)
                .fetchFeaturedBooks(pageNumber: nextPage.value++);
            isLoading.value = false;
          }
        }
      }
      scrollController.addListener(scrollListener);
      return () => scrollController.removeListener(scrollListener);
    }, [scrollController]);

    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: scrollController,
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: books[index]);
              },
              child: CustomBookImage(
                imageUrl: books[index].image ?? 'assets/images/Logo.png',
              ),
            ),
          );
        },
      ),
    );
  }
}
