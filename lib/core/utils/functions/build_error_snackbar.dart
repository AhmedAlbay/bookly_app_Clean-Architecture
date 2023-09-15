
  import 'package:bookly/Features/home/presentation/manger/feature_book_cubit/feature_books_cubit.dart';
import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar(FeatureBooksPaginationFailure state, BuildContext context) {
    return SnackBar(
      content: Text(
        state.errMessage ,
        style: const TextStyle(fontSize: 16),
      ),
     // Customize the background color
      duration: const Duration(seconds: 3), // Adjust the duration
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          // Code to execute when the user presses the "Dismiss" button.
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
  }