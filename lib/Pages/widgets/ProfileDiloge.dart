import 'package:edulab/Pages/login&singUp/providers/auth_view_model_provider.dart';
import 'package:edulab/data/UsersModel.dart';

import 'package:edulab/theme/Theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../theme/theme_manager.dart';
import '../login&singUp/login.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLigthMode = ref.watch(appThemeProvider).getTheme();
    final model = ref.read(authViewModelProvider);

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
                    Text(
                      model.name,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      model.email,
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
                            color: isLigthMode ? Colors.white : butColor),
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
                                      value: isLigthMode,
                                      onChanged: (value) async {
                                        ref
                                            .read(appThemeProvider.notifier)
                                            .setTheme(value);
                                      },
                                      activeTrackColor: scoColor2,
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
                                onTap: () async {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text("تسجيل الخروج"),
                                      content: const Text(
                                          "هل انت متاكد من تسجيل الخروج ؟"),
                                      actions: [
                                        TextButton(
                                          onPressed: () async {
                                            await ref
                                                .read(authViewModelProvider)
                                                .logout();
                                            // go to login page
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginScreen()));
                                          },
                                          child: Text(
                                            "نعم",
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("لا"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
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
