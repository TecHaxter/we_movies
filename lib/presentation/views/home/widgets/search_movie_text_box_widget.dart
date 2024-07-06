import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/constants/constants.dart';

class SearchMoviesTextBoxWidget extends StatelessWidget {
  const SearchMoviesTextBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 8.r,
          ),
          fillColor: AppColors.cultured,
          filled: true,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(
              24.r,
            ),
          ),
          labelText: 'Search Movies by name...',
          labelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
          ),
          prefixIcon: const Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}
