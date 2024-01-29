import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'Pages/HomePage/HomePage.dart';
import 'Pages/SavedPage/saved.dart';

import 'Pages/worksheet/worksheet.dart';
import 'theme/Theme.dart';
import 'theme/theme_manager.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 1;
});

// ignore: must_be_immutable
class MyNevBar extends ConsumerWidget {
  MyNevBar({super.key});

  List listOfColors = [
    const SavedFile(),
    const HomePage(),
    const WorkSheet(),
  ];
  late Color activeColor;
  late Color inActiveColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final thememode = ref.watch(themeModeProvider);
    if (thememode == true) {
      activeColor = butColor;
      inActiveColor = const Color.fromRGBO(87, 87, 87, 1);
    } else {
      activeColor = primColor;
      inActiveColor = const Color.fromRGBO(133, 133, 133, 1);
    }
    return Scaffold(
      body: listOfColors[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        animationDuration: const Duration(milliseconds: 200),
        showElevation: true,
        itemCornerRadius: 20,
        containerHeight: 60,
        iconSize: 30,
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          ref.read(currentIndexProvider.notifier).state = index;
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            inactiveColor: inActiveColor,
            activeColor: activeColor,
            icon: const Icon(Iconsax.save_21),
            title: const Text(
              'التحميلات',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavyBarItem(
            inactiveColor: inActiveColor,
            activeColor: activeColor,
            icon: const Icon(Iconsax.home_25),
            title: const Text('الرئيسية',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ),
          BottomNavyBarItem(
            inactiveColor: inActiveColor,
            activeColor: activeColor,
            icon: const Icon(Iconsax.task_square5),
            title: const Text('الواجبات',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }
}



// class MyNevBar extends StatefulWidget {
//   @override
//   _MyNevBarState createState() => _MyNevBarState();
// }

// class _MyNevBarState extends State<MyNevBar> {
//   int currentIndex = 1;

//   List listOfColors = [
//     savedFile(),
//     HomePage(),
//     WorkSheet(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: listOfColors[currentIndex],
//       bottomNavigationBar: BottomNavyBar(
//         animationDuration: Duration(milliseconds: 200),
//         showElevation: true,
//         itemCornerRadius: 20,
//         containerHeight: 60,
//         iconSize: 30,
//         selectedIndex: currentIndex,
//         onItemSelected: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         items: <BottomNavyBarItem>[
//           BottomNavyBarItem(
            
//             icon: Icon(Iconsax.save_21),
//             title: Text('Saved'),
//           ),
//           BottomNavyBarItem(
//             icon: Icon(Iconsax.home_25),
//             title: Text('Home'),
//           ),
//           BottomNavyBarItem(
//             inactiveColor: butColor,
//             activeColor: butColor2,
//             icon: Icon(Iconsax.task_square5),
//             title: Text('Worksheet'),
//           ),
//         ],
//       ),
//     );
//   }
// }
