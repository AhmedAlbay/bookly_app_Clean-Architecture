import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manger/feature_book_cubit/feature_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  final List<BookEntitiy> books;

  FeaturedBooksListView({Key? key, required this.books}) : super(key: key);

  @override
  _FeaturedBooksListViewState createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  final ScrollController _scrollController = ScrollController();
  int nextpage = 1;
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    // Calculate the position at 70% of the list view's length
    final desiredPosition = maxScroll * 0.7;

    if (currentScroll >= desiredPosition) {
      // Trigger the fetchfeaturedbooks request here
      if (!isLoading) {
        isLoading = true;
        BlocProvider.of<FeatureBooksCubit>(context)
            .fetchFeatureBook(pageNumber: nextpage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookImage(image: widget.books[index].image ?? ''),
          );
        },
      ),
    );
  }
}
