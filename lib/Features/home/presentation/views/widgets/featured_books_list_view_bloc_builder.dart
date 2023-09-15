import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manger/feature_book_cubit/feature_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/feature_books_list_view_loading_indcator.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/core/utils/functions/build_error_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntitiy> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureBooksCubit, FeatureBooksState>(
      listener: ((context, state) {
        if (state is FeatureBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeatureBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackBar(state, context),
          );
        }
      }),
      builder: (context, state) {
        if (state is FeatureBooksSuccess ||
            state is FeatureBooksPaginationLoading ||
            state is FeatureBooksPaginationFailure) {
          return FeaturedBooksListView(books: books);
        } else if (state is FeatureBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const FeaturedBookListViewLoadingIndcator();
        }
      },
    );
  }
}
