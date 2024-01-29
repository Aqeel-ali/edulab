import 'package:edulab/theme/Theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import 'package:flutter/material.dart';

import '../../theme/theme_manager.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thememode = ref.watch(themeModeProvider);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "الاعدادات",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "اسم المستخدم",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "aqee@gmail.com",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: thememode ? Colors.white : butColor),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // My profle
                              ListTile(
                                horizontalTitleGap: 20,
                                minVerticalPadding: 20,
                                trailing: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      size: 35,
                                      Iconsax.arrow_left_2,
                                    ),
                                  ],
                                ),
                                leading: const Icon(
                                  Iconsax.user,
                                  size: 35,
                                ),
                                title: const Text("حسابي",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                onLongPress: () {},
                                onTap: () {},
                              ),
                              // notification
                              ListTile(
                                horizontalTitleGap: 20,
                                minVerticalPadding: 20,
                                trailing: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      size: 35,
                                      Iconsax.arrow_left_2,
                                    ),
                                  ],
                                ),
                                leading: const Icon(
                                  Iconsax.notification,
                                  size: 35,
                                ),
                                title: const Text("الاشعارات",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                onLongPress: () {},
                                onTap: () {},
                              ),
                              // Dark Mode
                              ListTile(
                                horizontalTitleGap: 20,
                                minVerticalPadding: 20,
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Switch(
                                      value: thememode,
                                      onChanged: (value) {
                                        ref
                                            .read(themeModeProvider.notifier)
                                            .state = value;
                                      },
                                      activeTrackColor: ScoColor2,
                                      activeColor: squColor3,
                                    ),
                                  ],
                                ),
                                leading: const Icon(
                                  Iconsax.sun_14,
                                  size: 35,
                                ),
                                title: const Text("الوضع النهاري",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                onLongPress: () {},
                                onTap: () {},
                              ),
                              // Logout
                              ListTile(
                                horizontalTitleGap: 20,
                                minVerticalPadding: 20,
                                trailing: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      size: 35,
                                      Iconsax.arrow_left_2,
                                    ),
                                  ],
                                ),
                                leading: const Icon(
                                  Iconsax.logout,
                                  size: 35,
                                  color: Colors.red,
                                ),
                                title: const Text("تسجيل الخروج",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red,
                                    )),
                                onLongPress: () {},
                                onTap: () {},
                              ),
                              // About
                              ListTile(
                                horizontalTitleGap: 20,
                                minVerticalPadding: 20,
                                trailing: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      size: 35,
                                      Iconsax.arrow_left_2,
                                    ),
                                  ],
                                ),
                                leading: const Icon(
                                  Iconsax.info_circle,
                                  size: 35,
                                ),
                                title: const Text("عن التطبيق",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                onLongPress: () {},
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}
