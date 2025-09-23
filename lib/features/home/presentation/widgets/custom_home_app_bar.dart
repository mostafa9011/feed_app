import 'package:flutter/material.dart';

import '../../../../core/config/themes/text_styles.dart';
import '../../../../core/utils/extensions/context_extension.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          const Spacer(),
          Text(
            context.tr.connect,
            style: TextStyles.boldW18Black(context),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.image),
          ),
        ],
      ),
    );
  }
}
