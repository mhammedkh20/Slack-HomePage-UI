import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String title;
  final int count;
  final IconData? icon;
  final bool isBold;

  const ItemWidget({
    super.key,
    required this.title,
    required this.count,
    this.icon,
    this.isBold = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon ?? Icons.star_border,
          color: isBold ? const Color(0xff1c1c1c) : const Color(0xff4d4d4d),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: isBold ? 18 : 16,
              fontWeight: FontWeight.bold,
              color: isBold ? const Color(0xff1c1c1c) : const Color(0xff4d4d4d),
            ),
          ),
        ),
        if (count != 0)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xff833889),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              count.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
      ],
    );
  }
}
