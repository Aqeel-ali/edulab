import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:edulab/Pages/SubjectPage/subject_page.dart';
import 'package:edulab/data/Subject.dart';

import 'package:edulab/Pages/widgets/ProfileDiloge.dart';
import 'package:edulab/theme/Theme.dart';

import 'package:edulab/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';

var searchController;
var subcount;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider).getTheme();
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            // theme icon
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Iconsax.setting_24),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
          title: const Text("الرئيسية",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                child: Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  SearchField,
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(
                          'المواد الدراسية',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: Card(
                    child: FutureBuilder(
                  future: get_subjects(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data as List<Subject>;
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) =>
                              mycard(data[index], index, context, theme));
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      return Center(
                          child: Shimmer(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 87, 87, 87),
                            theme ? Colors.white : butColor
                          ],
                        ),
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              horizontalTitleGap: 20,
                              minVerticalPadding: 30,
                              visualDensity: const VisualDensity(vertical: 4),
                              minLeadingWidth: 80,
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
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                              title: const Text(
                                "_________________________",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              subtitle: const Text("_________________",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                              leading: const CircleAvatar(
                                maxRadius: 35,
                              ),
                            ),
                          ),
                        ),
                      ));
                    }
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var SearchField = TextFormField(
    controller: searchController,
    keyboardType: TextInputType.text,
    onSaved: (value) {
      searchController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      suffixStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      suffixIcon: const Icon(
        Iconsax.search_normal,
      ),
      filled: true,
      contentPadding: const EdgeInsets.all(25),
      label: const Text(
        "ابحث عن مادة",
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      labelStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15),
      ),
    ));

Widget mycard(Subject subject, var i, BuildContext context, bool theme) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      horizontalTitleGap: 20,
      minVerticalPadding: 30,
      visualDensity: const VisualDensity(vertical: 4),
      minLeadingWidth: 80,
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11),
      ),
      title: Text(
        subject.title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(subject.doctorName,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
      leading: CircleAvatar(
          maxRadius: 35,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: subject.image,
                placeholder: (context, url) => Shimmer(
                  child: CircleAvatar(
                    maxRadius: 35,
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 87, 87, 87),
                      theme ? Colors.white : butColor
                    ],
                  ),
                ),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ],
          )),
      onLongPress: () {},
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubjectPage(
                      sub: subject,
                    )));
      },
    ),
  );
}
