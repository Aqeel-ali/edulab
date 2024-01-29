import 'package:edulab/Pages/SubjectPage/ChaptersPage.dart';
import 'package:edulab/data/Subject.dart';
import 'package:edulab/theme/Theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/theme_manager.dart';

// make subject page

class SubjectPage extends ConsumerWidget {
  final int i;
  const SubjectPage({required this.i, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subject = ref.watch(SubjectProvider)[i];
    final thememode = ref.watch(themeModeProvider);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    subject.title,
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 5.0,
                        width: 180.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 10,
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  subject.doctorName,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 60,
                ),
                Wrap(
                    children: List.generate(
                        subject.categories.length,
                        (index) => Card(
                            subject.categories[index].title,
                            subject.categories[index].image,
                            context,
                            subject,
                            thememode))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget Card(
    String subName, String imgsup, BuildContext c, Subject s, bool thememode) {
  return Container(
      width: (MediaQuery.of(c).size.width) / 2 - 30,
      height: MediaQuery.of(c).size.width / 1.5 - 20,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: thememode ? Colors.white : butColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              child: Image.asset(imgsup),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: Container(
                    width: double.infinity / 2 - 100,
                    height: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(0)),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            thememode ? butColor : Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        )),
                        // ignore: prefer_const_constructors
                      ),
                      onPressed: () {
                        if (subName == "Chapters") {
                          Navigator.push(
                              c,
                              MaterialPageRoute(
                                  builder: (c) => ChaptersPage(subject: s)));
                        }
                      },
                      child: const Text(
                        'فتح',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )))
          ]));
}
