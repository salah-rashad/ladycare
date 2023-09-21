import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/extensions.dart';
import 'bottom_nav_bar_item.dart';
import 'cubit/bottom_nav_bar_cubit.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomNavBarItem> items;
  final Color? iconSelectedColor;
  final Color? iconUnselectedColor;
  final Color? labelSelectedColor;
  final Color? labelUnselectedColor;

  const BottomNavBar({
    super.key,
    required this.items,
    this.iconSelectedColor,
    this.iconUnselectedColor,
    this.labelSelectedColor,
    this.labelUnselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return Container(
            // height: 80.0,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: context.palette.surface,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
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
        },
      ),
    );
  }

  Widget _generateItem(BuildContext context, int index) {
    final cubit = context.read<BottomNavBarCubit>();
    final bool isSelected = index == cubit.state.selectedIndex;
    final item = items[index];
    return BottonNavBarItemWidget(
      item: item,
      isSelected: isSelected,
      iconSelectedColor: iconSelectedColor,
      iconUnselectedColor: iconUnselectedColor,
      onPressed: () {
        cubit.setSelected(index);
      },
    );
  }
}
