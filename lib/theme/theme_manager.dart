//state provider for theme mode

import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeModeProvider = StateProvider<bool>((ref) {
  return false;
});
