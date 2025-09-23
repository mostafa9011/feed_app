import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/config_cubit/config_cubit.dart';
import '../../../../core/config/themes/text_styles.dart';
import '../../../../core/utils/extensions/context_extension.dart';

class ToggleDarkMode extends StatelessWidget {
  const ToggleDarkMode({super.key});

  @override
  Widget build(BuildContext context) {
    final configCubit = context.read<ConfigCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.tr.enableDarkMode,
          style: TextStyles.medium16WBlack(context),
        ),
        const Spacer(),
        Switch(
          value: context.isDark,
          onChanged: (value) {
            configCubit.toggleTheme();
          },
        ),
      ],
    );
  }
}
