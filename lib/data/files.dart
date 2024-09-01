import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Document {
  String title;
  String path;
  String date;
  Document(
    this.title,
    this.path,
    this.date,
  );
}

 UploadTask? uploadTask;



final db = FirebaseFirestore.instance;
Future UpdateFiles(String title, File file) async {
  final reference = FirebaseStorage.instance.ref().child('Chapters/$title');

  
  uploadTask = reference.putFile(file);

  await uploadTask!.whenComplete(() {});

  final downloadLink = await reference.getDownloadURL();

  return downloadLink;
}

void pickFiles(String sub_id) async {
  final pickedFile = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: [
      'pdf',
      'doc',
      'docx',
      'ppt',
      'pptx',
      'xls',
      'xlsx',
      'txt'
    ],
  );

  if (pickedFile != null) {
    print("--------------file path: ${pickedFile.files[0].path}");
    String title = pickedFile.files[0].name;

    File file = File(pickedFile.files[0].path!);

    final downloadLink = await UpdateFiles(title, file);

    //add file to Subject collection in supcollection files
    db.collection('Subjects').doc(sub_id).collection('Chapters').add({
      'title': title,
      'path': downloadLink,
      'date': DateTime.now().toString(),
    }).then((value) =>
        print("file added#########################################"));
    const SnackBar(
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      content: Text(
        "تم اضافة الملف بنجاح",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

// Future provider to get the files pramerter is the subject id
final filesProvider = FutureProvider.autoDispose
    .family<List<Document>, String>((ref, sub_id) async {
  List<Document> files = [];
  await db
      .collection('Subjects')
      .doc(sub_id)
      .collection('Chapters')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      files.add(Document(doc['title'], doc['path'], doc['date']));
    });
  });
  print("############# files: $files");
  return files;
});
