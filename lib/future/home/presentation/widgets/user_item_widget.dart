import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserItemWidget extends StatelessWidget {
  final String name;
  final String image;
  final String count;
  final bool isBold;
  final bool isActive;

  const UserItemWidget({
    super.key,
    required this.name,
    required this.image,
    required this.count,
    this.isBold = false,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      minSize: 0,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: Stack(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    image,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                PositionedDirectional(
                  bottom: -5,
                  end: -5,
                  child: Container(
                    height: 22,
                    width: 22,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                  ),
                ),
                PositionedDirectional(
                  bottom: 0,
                  end: 0,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.green : Colors.white,
                      shape: BoxShape.circle,
                      border: isActive
                          ? null
                          : Border.all(
                              color: const Color(0xff7c7a7e), width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color:
                    isBold ? const Color(0xff1c1c1c) : const Color(0xff4d4d4d),
              ),
            ),
          ),
          if (count != "0")
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xff833889),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                count,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
        ],
      ),
    );
  }
}
