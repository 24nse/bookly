import 'package:bookly/features/home/data/models/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BookDetailsView extends HookWidget {
  const BookDetailsView({Key? key, required this.bookModel}) : super(key: key);
  final BookEntity bookModel;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(pageNumber: 0);
      return null;
    }, const []);

    return Scaffold(
      body: SafeArea(child: BookDetailsViewBody(bookModel: bookModel)),
    );
  }
}