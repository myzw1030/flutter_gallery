import 'package:flutter/material.dart';
import 'package:flutter_gallery/pages/category_list/component/category_tile.dart';
import 'package:flutter_gallery/pages/category_list/demo_data/demos.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryTile(
          title: 'Material',
          image: 'assets/icons/material/material.png',
          children: Demos.materialDemos(),
        ),
        const SizedBox(height: 16),
        CategoryTile(
          title: 'Cupertino',
          image: 'assets/icons/cupertino/cupertino.png',
          children: Demos.cupertinoDemos(),
        ),
        const SizedBox(height: 16),
        CategoryTile(
          title: 'スタイルなど',
          image: 'assets/icons/reference/reference.png',
          children: Demos.referenceDemos(),
        ),
      ],
    );
  }
}
