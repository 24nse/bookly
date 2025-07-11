import 'package:bookly/conastans.dart';

import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/service_locator.dart';

import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/view_models/newset_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookly/core/observer/app_bloc_observer.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/home/domain/use_cases/fetch_newest_books_use_case.dart';
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();


  if (!Hive.isBoxOpen(kFeaturedBox)) {
    await Hive.openBox<BookEntity>(kFeaturedBox);
  }
  if (!Hive.isBoxOpen(kNewsetBox)) {
    await Hive.openBox<BookEntity>(kNewsetBox);
  }
    if (!Hive.isBoxOpen(kSimilarBooksBox)) {
    await Hive.openBox<BookEntity>(kSimilarBooksBox);
  }

  Bloc.observer = AppBlocObserver();

  runApp(const BooklyApp());
}


class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()),
              )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewsetBooksCubit( FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()),)..fetchNewsetBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
