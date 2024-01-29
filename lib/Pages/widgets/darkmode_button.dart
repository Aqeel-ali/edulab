import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../theme/theme_manager.dart';

class DarkModeButton extends ConsumerWidget {
  const DarkModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thememode = ref.watch(themeModeProvider);
    return IconButton(
      onPressed: () {
        ref.read(themeModeProvider.notifier).state = thememode ? false : true;
      },
      icon: Icon(
        thememode == true ? Icons.light_mode : Icons.dark_mode,
        size: 35,
      ),
    );
  }
}
