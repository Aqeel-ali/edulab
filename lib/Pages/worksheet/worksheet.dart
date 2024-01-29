import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:edulab/data/Subject.dart';
import '../../theme/Theme.dart';
import '../../theme/theme_manager.dart';

class WorkSheet extends ConsumerWidget {
  const WorkSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final worksheet = ref.read(allWorkSheetProvider);
    final thememode = ref.watch(themeModeProvider);
    worksheet.sort((a, b) => a.date.compareTo(b.date));

    //sort the worksheet by date

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  size: 35,
                )),
            const SizedBox(
              width: 10,
            ),
          ],
          elevation: 0,
          title: const Text("الواجبات",
              style: TextStyle(fontWeight: FontWeight.bold))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            Container(
              child: const Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: worksheet.length,
                  itemBuilder: (context, index) =>
                      Card2(worksheet[index], context, thememode)),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget Card2(worksheet work, BuildContext context, bool thememode) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: thememode ? Colors.white : butColor,
            borderRadius: BorderRadius.circular(11)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Text(
                      work.subjectName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //subtitle
                    Text(
                      work.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //description
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        work.description,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 100,
              height: 60,
              decoration: BoxDecoration(
                  color: thememode ? butColor : Colors.black,
                  borderRadius: BorderRadius.circular(11)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${work.date.day} / ${work.date.month}",
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    DateFormat.EEEE().format(work.date).toString(),
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
}
