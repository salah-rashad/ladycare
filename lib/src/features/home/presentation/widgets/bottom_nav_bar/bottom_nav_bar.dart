import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions.dart';
import 'bottom_nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final List<BottomNavBarItem> items;
  final Color? iconSelectedColor;
  final Color? iconUnselectedColor;
  final Color? labelSelectedColor;
  final Color? labelUnselectedColor;
  final void Function(int index)? onItemPressed;

  const BottomNavBar({
    super.key,
    this.selectedIndex = 0,
    required this.items,
    this.iconSelectedColor,
    this.iconUnselectedColor,
    this.labelSelectedColor,
    this.labelUnselectedColor,
    this.onItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: const [
          BoxShadow(
            blurRadius: 15.0,
            offset: Offset(0, -4),
            color: Color.fromRGBO(0, 0, 0, 0.15),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          items.length,
          (index) => Flexible(
            child: _generateItem(context, index),
          ),
        ),
      ),
    );
  }

  Widget _generateItem(BuildContext context, int index) {
    final bool isSelected = index == selectedIndex;
    final item = items[index];
    return BottonNavBarItemWidget(
      item: item,
      isSelected: isSelected,
      iconSelectedColor: iconSelectedColor,
      iconUnselectedColor: iconUnselectedColor,
      onPressed: () => onItemPressed?.call(index),
    );
  }
}
