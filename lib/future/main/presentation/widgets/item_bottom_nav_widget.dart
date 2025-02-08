import 'package:flutter/cupertino.dart';

class ItemBottomNav extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final Function() onPressed;
  final bool isNotify;

  const ItemBottomNav({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
    required this.isNotify,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Stack(
            children: [
              Icon(
                icon,
                color: isSelected
                    ? const Color(0xff1c1c1c)
                    : const Color(0xff7c7a7e),
                size: 25,
              ),
              if (isNotify)
                PositionedDirectional(
                  top: 0,
                  end: 0,
                  child: Container(
                    height: 7,
                    width: 7,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff833889)),
                  ),
                ),
            ],
          ),
          Text(
            title,
            style: TextStyle(
                color: isSelected
                    ? const Color(0xff1c1c1c)
                    : const Color(0xff7c7a7e),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}
