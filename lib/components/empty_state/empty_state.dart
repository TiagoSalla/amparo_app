import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  EmptyState(this.icon, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            icon,
          ),
          Text(title),
          Text(subtitle)
        ],
      ),
    );
  }
}
