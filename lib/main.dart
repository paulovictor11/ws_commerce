import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wscommerce/pages/product_detail.dart';
import 'package:wscommerce/themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'E-Commerce',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme
        )
      ),
      debugShowCheckedModeBanner: false,
      home: new ProductDetailPage(),
    );
  }
}

