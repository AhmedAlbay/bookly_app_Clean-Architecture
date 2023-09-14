import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:bookly/Features/domain/usecase/fetch_feature_book_use_case.dart';
import 'package:bookly/Features/domain/usecase/fetch_newest_books_use_case.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/manger/feature_book_cubit/feature_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/newest_book_cubit/newset_books_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/functions/setup_service_locator.dart';
import 'package:bookly/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntitiyAdapter());
  await Hive.openBox<BookEntitiy>(kFeatureBox);
  await Hive.openBox<BookEntitiy>(kNewestBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeatureBooksCubit(
            FetchFeatureBookUseCase(getit.get<HomeRepoImpl>()),
          );
        }),
        BlocProvider(create: (context) {
          return NewsetBooksCubit(
            FetchNewestBookUseCase(getit.get<HomeRepoImpl>()),
          );
        })
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
