import 'package:edulab/data/Subject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../../theme/Theme.dart';
import '../../theme/theme_manager.dart';

class SavedFile extends ConsumerWidget {
  const SavedFile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadFile = ref.watch(DownloadedDocProvider);
    final sliding = ref.watch(_slidingProvider);
    final isLigthMode = ref.watch(appThemeProvider).getTheme();

    final subject = ref.read(SubjectProvider);
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
            title: const Text("المحفوظات",
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
              slidingSegmentedControl(ref),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Consumer(
                  builder: (context, ref, child) => Expanded(
                    child: sliding == 1
                        ? ListView.builder(
                            itemCount: downloadFile.length,
                            itemBuilder: (context, index) =>
                                Card(downloadFile[index], index, isLigthMode))
                        : ListView.builder(
                            itemCount: subject.length,
                            itemBuilder: (context, index) =>
                                Category_Card(subject[index], index, context),
                          ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}

Widget Card(Document file, var i, bool thememode) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {},
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: thememode ? Colors.white : butColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 160,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(file.image, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    file.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    file.subjectName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "2/22",
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.more_vert_sharp,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget Category_Card(Subject subject, var i, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 100,
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
          title: Text(subject.title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          subtitle: const Text("Dr.Name"),
          onLongPress: () {},
          onTap: null),
    ),
  );
}

final _slidingProvider = StateProvider<int?>((ref) => 1);

// CupertinoSlidingSegmentedControl
Widget slidingSegmentedControl(WidgetRef ref) {
  final sliding = ref.watch(_slidingProvider);
  return CupertinoSlidingSegmentedControl(
    groupValue: sliding,
    children: const {
      0: Text('تصنيفات'),
      1: Text('عرض الكل'),
    },
    onValueChanged: (i) {
      ref.read(_slidingProvider.notifier).state = i;
    },
  );
}
