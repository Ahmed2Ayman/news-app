import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'category_card.dart';

class ListViewCategoryCard extends StatelessWidget {
  const ListViewCategoryCard({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/images/science.avif', categoryName: 'General'),
    CategoryModel(
        image: 'assets/images/entertaiment.avif',
        categoryName: 'Entertainment'),
    CategoryModel(
        image: 'assets/images/science.avif', categoryName: 'Business'),
    CategoryModel(image: 'assets/images/health.avif', categoryName: 'Health'),
    CategoryModel(image: 'assets/images/science.avif', categoryName: 'Science'),
    CategoryModel(image: 'assets/images/science.avif', categoryName: 'Sports'),
    CategoryModel(
        image: 'assets/images/technology.jpeg', categoryName: 'Technology'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              categoryModel: categories[index],
            );
          }),
    );
  }
}
