import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.title,
    required this.image,
    required this.children,
  });

  final String title;
  final String image;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      shape: const Border(
        top: BorderSide(color: Colors.white),
        bottom: BorderSide(color: Colors.white),
      ),
      collapsedShape: const Border(
        top: BorderSide(color: Colors.white),
        bottom: BorderSide(color: Colors.white),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      leading: Image(
        image: AssetImage(
          image,
          package: 'flutter_gallery_assets',
        ),
        width: 30,
      ),
      children: children,
    );
  }
}
