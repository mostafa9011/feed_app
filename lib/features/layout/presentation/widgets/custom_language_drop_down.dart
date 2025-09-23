import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/config_cubit/config_cubit.dart';
import '../../../../core/utils/constants_manager.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/functions/kprint.dart';

class CustomLanguageDropDown extends StatelessWidget {
  const CustomLanguageDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final configCubit = context.read<ConfigCubit>();

    return CustomDropdown<String>(
      decoration: CustomDropdownDecoration(
        closedBorder: Border.all(color: context.colorScheme.onSurface),
        closedFillColor: context.colorScheme.surface,
        expandedFillColor: context.colorScheme.surface,
      ),
      items: ConstantsManager.languages,
      initialItem: context.languageCode == 'ar'
          ? ConstantsManager.languages[1]
          : ConstantsManager.languages[0],
      onChanged: (value) {
        kprint('changing value to: $value');

        if (value == ConstantsManager.languages[0]) {
          configCubit.changeLanguage(locale: const Locale('en'));
        } else if (value == ConstantsManager.languages[1]) {
          configCubit.changeLanguage(locale: const Locale('ar'));
        }
      },
    );
  }
}
