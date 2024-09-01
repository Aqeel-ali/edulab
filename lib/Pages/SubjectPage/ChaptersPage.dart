import 'package:edulab/Pages/SubjectPage/fileViewerPage.dart';
import 'package:edulab/data/Subject.dart';
import 'package:edulab/data/files.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_view/flutter_file_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:open_filex/open_filex.dart';

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
    final files = ref.watch(filesProvider(subject.sid));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          subject.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("add file pressed");
          pickFiles(subject.sid);
        },
        child: Icon(Iconsax.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
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
                RefreshIndicator(
                  onRefresh: () async {
                    ref.refresh(filesProvider(subject.sid));
                  },
                  child: files.when(
                    loading: () =>
                        Center(child: const CircularProgressIndicator()),
                    error: (error, stack) => Text('Error: $error'),
                    data: (chapters) => Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: chapters.length != 0
                            ? Expanded(
                                child: ListView.builder(
                                itemCount: chapters.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Card(
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    minVerticalPadding: 40.0,
                                    onTap: () {
                                      if (chapters[index]
                                          .path
                                          .contains('.pdf')) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                            builder: (_) => fileViewerPage(
                                                title: chapters[index].title,
                                                path: chapters[index].path),
                                          ),
                                        );
                                      } else {
                                        //فتح الملف بتطبيق خارجي
                                        OpenFilex.open(chapters[index].path);
                                      }
                                    },
                                    titleAlignment:
                                        ListTileTitleAlignment.center,
                                    subtitle: const Text(
                                      "وصف الملف",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    title: Text(
                                      chapters[index].title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // download icon
                                        Consumer(
                                          builder: (context, ref, child) =>
                                              IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              // subject.documents[index].isDownloaded
                                              //     ? Iconsax.document_download1:
                                              Iconsax.document_download,
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
                                    key: Key(chapters[index].title),
                                    leading: const Icon(
                                      Iconsax.document5,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ))
                            : const Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Iconsax.folder_open,
                                      size: 100,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "لا يوجد ملفات",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                )
              ],
            ),
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

Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          double progress = data!.bytesTransferred / data.bytesTransferred;

          return SizedBox(
            height: 50,
            child: Stack(
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey,
                  color: Colors.green,
                ),
                Center(
                  child: Text("${(100 * progress).roundToDouble()}"),
                )
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
