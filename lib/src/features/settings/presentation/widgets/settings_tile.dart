import 'package:flutter/material.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/utils/extensions.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final SvgGenImage icon;
  final VoidCallback onPressed;

  const SettingsTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      titleTextStyle: context.textTheme.headlineSmall,
      leading: icon(color: context.colors.accent2),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
    );
  }
}
