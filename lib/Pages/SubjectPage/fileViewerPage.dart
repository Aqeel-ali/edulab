import 'package:edulab/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_view/flutter_file_view.dart';
import 'package:flutter_file_view/src/flutter_file_view.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';

class fileViewerPage extends StatefulWidget {
  fileViewerPage({super.key, required this.path, required this.title});
  final String path;
  final String title;

  @override
  State<fileViewerPage> createState() => _fileViewerPageState();
}

class _fileViewerPageState extends State<fileViewerPage> {
  PDFDocument? document;

  void initializePDF() async {
    document = await PDFDocument.fromURL(widget.path);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePDF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: document != null
            ? PDFViewer(
                document: document!,
                enableSwipeNavigation: true,
                scrollDirection: Axis.vertical,
                pickerButtonColor: squColor3,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
