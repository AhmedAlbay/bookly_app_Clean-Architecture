import 'package:bookly/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

// ignore: implementation_imports, unnecessary_import
import 'package:flutter/src/widgets/framework.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(),
      ),
    );
  }
}
