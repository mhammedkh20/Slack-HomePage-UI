import 'package:flutter/material.dart';

class ItemSearch extends StatelessWidget {
  final String name;
  final Function()? onTap;
  final bool isSelected;
  const ItemSearch({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? const Color(0xfffaedff) : Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:
                    isSelected ? const Color(0xfffaedff) : Colors.transparent,
              ),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xff3d1e3d)
                      : const Color(0xfffaedff),
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
