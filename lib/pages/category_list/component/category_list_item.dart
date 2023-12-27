import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.widget,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: ListTile(
        title: Text(
          title,
        ),
        subtitle: Text(
          subtitle,
        ),
        leading: Icon(
          icon,
          size: 24,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<double>(
              builder: (context) => widget,
            ),
          );
        },
      ),
    );
  }
}
