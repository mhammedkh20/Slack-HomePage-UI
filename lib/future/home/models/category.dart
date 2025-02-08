import 'package:flutter/material.dart';

class Category {
  final int id;
  final IconData icon;
  final String subtitle;
  final String title;
  final int count;

  Category({
    required this.id,
    required this.icon,
    required this.count,
    required this.subtitle,
    required this.title,
  });
}
