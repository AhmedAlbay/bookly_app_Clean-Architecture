import 'package:bookly/Features/home/presentation/views/widgets/custom_book_image_loading_indcator.dart';
import 'package:bookly/core/widgets/custom_fading_widget_state.dart';
import 'package:flutter/material.dart';

class FeaturedBookListViewLoadingIndcator extends StatelessWidget {
  const FeaturedBookListViewLoadingIndcator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidgetState(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  const  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8),
              child: CustomBooksImageLoadingIndcatore(),
            );
          },
        ),
      ),
    );
  }
}