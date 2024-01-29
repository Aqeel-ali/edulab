import 'package:edulab/data/Subject.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../theme/Theme.dart';

@immutable
class ChaptersPage extends ConsumerWidget {
  final Subject subject;
  const ChaptersPage({
    super.key,
    required this.subject,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          subject.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        children: [
                          Text(
                            'الملازم',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
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
                                color: butColor2,
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
                      const SizedBox(
                        height: 15,
                      ),
                      SearchField,
                      const SizedBox(
                        height: 15,
                      ),
                    ]),
              ),
              Consumer(
                builder: (context, ref, child) => Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: subject.documents.length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        minVerticalPadding: 40.0,
                        onTap: () {},
                        titleAlignment: ListTileTitleAlignment.center,
                        subtitle: const Text(
                          "وصف الملف",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        title: Text(
                          subject.documents[index].title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //size of file
                            const Text(
                              "22 MB ",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            // download icon
                            Consumer(
                              builder: (context, ref, child) => IconButton(
                                onPressed: () {
                                  subject.documents[index].isDownloaded
                                      ? null
                                      : ref
                                          .watch(SubjectProvider.notifier)
                                          .state
                                          .where((element) =>
                                              element.title == subject.title)
                                          .first
                                          .documents[index]
                                          .isDownloaded = true;
                                  ref
                                      .refresh(DownloadedDocProvider.notifier)
                                      .state;

                                  ref.refresh(SubjectProvider.notifier).state;
                                },
                                icon: Icon(
                                  subject.documents[index].isDownloaded
                                      ? Iconsax.document_download1
                                      : Iconsax.document_download,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextEditingController SearchController = TextEditingController();

var SearchField = TextFormField(
    controller: SearchController,
    keyboardType: TextInputType.text,
    onSaved: (value) {
      SearchController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      suffixIcon: const Icon(
        Iconsax.search_normal,
      ),
      filled: true,
      contentPadding: const EdgeInsets.all(25),
      label: const Text(
        "بحث",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15),
      ),
    ));
