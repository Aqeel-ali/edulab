//all subjects has title and image and description and categories and doctor name

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edulab/Pages/login&singUp/login.dart';
import 'package:edulab/data/files.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class worksheet {
  String title;
  String description;
  String subjectName;
  DateTime date;
  worksheet({
    required this.title,
    required this.description,
    required this.subjectName,
    required this.date,
  });
}

// catogry_doc for document
class Category_doc {
  String title;

  Category_doc(this.title);
}

class Subject {
  String title;
  String sid;

  String image;
  String description;
  String doctorName;

  Subject(
    this.sid,
    this.title,
    this.image,
    this.description,
    this.doctorName,
  );
}

class Category {
  String title;
  String image;
  Category(this.title, this.image);
}

final List<Subject> subjectsList = [];
final List<Category> categorys = [
  Category(
    "Chapters",
    'assets/image/study.png',
  ),
  Category(
    "Exams",
    'assets/image/exam.png',
  ),
  Category(
    "Important dates",
    'assets/image/knowledge.png',
  ),
  Category(
    "Exam Results",
    'assets/image/open-book.png',
  ),
];

// write another description for each subject

// make list of subjects from this info
// final List<Subject> subjects = [
//   Subject(
//     'Software engineering',
//     'assets/image/programing.png',
//     "description",
//     "Dr.Ayad Albadri",
//     [
//       Category(
//         "Chapters",
//         'assets/image/study.png',
//       ),
//       Category(
//         "Exams",
//         'assets/image/exam.png',
//       ),
//       Category(
//         "Important dates",
//         'assets/image/knowledge.png',
//       ),
//       Category(
//         "Exam Results",
//         'assets/image/open-book.png',
//       ),
//     ],
//     // New field
//     [
//       Document(
//           "Chapter 1",
//           "assets/image/mlzama.png",
//           Category_doc("Practical"),
//           //add is downloaded here
//           isDownloaded: false,
//           "Software engineering"),
//       Document(
//           "Chapter 2",
//           "assets/image/mlzama2.png",
//           Category_doc("Practical"),
//           isDownloaded: false,
//           "Software engineering"),
//       Document(
//           "Chapter 3",
//           "assets/image/mlzama.png",
//           Category_doc("Theoretical"),
//           isDownloaded: false,
//           "Software engineering"),
//       Document(
//           "Chapter 4",
//           "assets/image/mlzama.png",
//           Category_doc("Practical"),
//           isDownloaded: false,
//           "Software engineering"),
//       Document(
//           "Chapter 5",
//           "assets/image/mlzama.png",
//           Category_doc("Theoretical"),
//           isDownloaded: false,
//           "Software engineering"),
//       Document(
//           "Chapter 6",
//           // END: be15d9bcejpp
//           "assets/image/mlzama.png",
//           Category_doc("Chapters"),
//           "Software engineering"),
//       Document("Chapter 7", "assets/image/mlzama.png", Category_doc("Chapters"),
//           "Software engineering"),
//       Document("Chapter 8", "assets/image/mlzama.png", Category_doc("Chapters"),
//           "Software engineering"),
//       Document("Chapter 9", "assets/image/mlzama.png", Category_doc("Chapters"),
//           "Software engineering"),
//       Document("Chapter 10", "assets/image/mlzama.png",
//           Category_doc("Chapters"), "Software engineering"),
//       Document("Chapter 11", "assets/image/mlzama.png",
//           Category_doc("Chapters"), "Software engineering"),
//       Document("Chapter 12", "assets/image/mlzama.png",
//           Category_doc("Chapters"), "Software engineering"),
//       Document("Chapter 13", "assets/image/mlzama.png",
//           Category_doc("Chapters"), "Software engineering"),
//       Document("Chapter 14", "assets/image/mlzama.png",
//           Category_doc("Chapters"), "Software engineering"),
//       Document("Chapter 15", "assets/image/mlzama.png",
//           Category_doc("Chapters"), "Software engineering"),
//     ],
//     // add work sheet
//     worksheets: [
//       worksheet(
//           title: "Worksheet 1",
//           description: "Here is the description of the Worksheet",
//           subjectName: "Software engineering",
//           date: DateTime(2023, 1, 17)),
//       worksheet(
//           title: "Worksheet 2",
//           description: "Here is the description of the Worksheet",
//           subjectName: "Software engineering",
//           date: DateTime(2023, 1, 20)),
//     ],
//   ),
//   Subject(
//       'Machine Learing 1 ',
//       'assets/image/Data_Structure.png',
//       " description ",
//       "Dr.Dhamyaa A.Nasrawi",
//       [
//         Category(
//           "Chapters",
//           'assets/image/study.png',
//         ),
//         Category(
//           "Exams",
//           'assets/image/exam.png',
//         ),
//         Category(
//           "Important dates",
//           'assets/image/knowledge.png',
//         ),
//         Category(
//           "Exam Results",
//           'assets/image/open-book.png',
//         ),
//       ],
//       //make 5 doc
//       [
//         Document("Chapter 1", "assets/image/mlzama.png",
//             Category_doc("Chapters"), 'Machine Learing 1 '),
//         Document("Chapter 2", "assets/image/mlzama2.png",
//             Category_doc("Chapters"), 'Machine Learing 1 '),
//         Document("Chapter 3", "assets/image/mlzama.png",
//             Category_doc("Chapters"), 'Machine Learing 1 '),
//         Document("Chapter 4", "assets/image/mlzama.png",
//             Category_doc("Chapters"), 'Machine Learing 1 '),
//         Document("Chapter 5", "assets/image/mlzama.png",
//             Category_doc("Chapters"), 'Machine Learing 1 '),
//       ], worksheets: [
//     worksheet(
//         title: "Worksheet 1",
//         description: "Here is the description of the Worksheet",
//         subjectName: "Machine Learing 1 ",
//         date: DateTime(2023, 1, 17)),
//     worksheet(
//         title: "Worksheet 2",
//         description: "Here is the description of the Worksheet",
//         subjectName: "Machine Learing 1 ",
//         date: DateTime(2023, 1, 20)),
//   ]),
//   Subject(
//       'Artificial Intelligence',
//       'assets/image/Data_Base.png',
//       " description ",
//       "Prof.Dr.Asia Mahdi",
//       [
//         Category(
//           "Chapters",
//           'assets/image/study.png',
//         ),
//         Category(
//           "Exams",
//           'assets/image/exam.png',
//         ),
//         Category(
//           "Important dates",
//           'assets/image/knowledge.png',
//         ),
//         Category(
//           "Exam Results",
//           'assets/image/open-book.png',
//         ),
//       ],
//       // make 7 doc
//       [
//         Document("Chapter 1", "assets/image/mlzama.png",
//             Category_doc("Chapters"), 'Artificial Intelligence',
//             isDownloaded: true),
//         Document("Chapter 2", "assets/image/mlzama2.png",
//             Category_doc("Chapters"), 'Artificial Intelligence'),
//         Document("Chapter 3", "assets/image/mlzama.png",
//             Category_doc("Chapters"), 'Artificial Intelligence',
//             isDownloaded: true),
//         Document("Chapter 4", "assets/image/mlzama.png",
//             Category_doc("Chapters"), 'Artificial Intelligence'),
//         Document("Chapter 5", "assets/image/mlzama.png",
//             Category_doc("Chapters"), 'Artificial Intelligence'),
//         Document("Chapter 6", "assets/image/mlzama.png",
//             Category_doc("Chapters"), 'Artificial Intelligence',
//             isDownloaded: true),
//         Document("Chapter 7", "assets/image/mlzama.png",
//             Category_doc("Chapters"), 'Artificial Intelligence'),
//       ], worksheets: [
//     worksheet(
//         title: "Worksheet 1",
//         description: "Here is the description of the Worksheet",
//         subjectName: "Artificial Intelligence",
//         date: DateTime(2023, 1, 17)),
//     worksheet(
//         title: "Worksheet 2",
//         description: "Here is the description of the Worksheet",
//         subjectName: "Artificial Intelligence",
//         date: DateTime(2023, 1, 20)),
//   ]),
//   Subject(
//     'Web Design and Programming',
//     'assets/image/Computation_Theory.png',
//     "Web Design and Programming is the study of mathematical models of computation and the limits of what can be computed. ",
//     "Afrah Umran",
//     [
//       Category(
//         "Chapters",
//         'assets/image/study.png',
//       ),
//       Category(
//         "Exams",
//         'assets/image/exam.png',
//       ),
//       Category(
//         "Important dates",
//         'assets/image/knowledge.png',
//       ),
//       Category(
//         "Exam Results",
//         'assets/image/open-book.png',
//       ),
//     ],
//     //make some doc
//     [
//       Document(
//         "Chapter 1",
//         "assets/image/mlzama.png",
//         Category_doc("Chapters"),
//         'Web Design and Programming',
//       ),
//       Document(
//         "Chapter 2",
//         "assets/image/mlzama2.png",
//         Category_doc("Chapters"),
//         'Web Design and Programming',
//       ),
//       Document(
//         "Chapter 3",
//         "assets/image/mlzama.png",
//         Category_doc("Chapters"),
//         'Web Design and Programming',
//       ),
//       Document(
//         "Chapter 4",
//         "assets/image/mlzama.png",
//         Category_doc("Chapters"),
//         'Web Design and Programming',
//       ),
//       Document(
//         "Chapter 5",
//         "assets/image/mlzama.png",
//         Category_doc("Chapters"),
//         'Web Design and Programming',
//       ),
//     ],
//   ),
//   Subject(
//     'English Language II',
//     'assets/image/eng.png',
//     "English is a West Germanic language first spoken in early medieval England, which has eventually become the leading language of international discourse in the 21st century. ",
//     "Hussin",
//     [
//       Category(
//         "Chapters",
//         'assets/image/study.png',
//       ),
//       Category(
//         "Exams",
//         'assets/image/exam.png',
//       ),
//       Category(
//         "Important dates",
//         'assets/image/knowledge.png',
//       ),
//       Category(
//         "Exam Results",
//         'assets/image/open-book.png',
//       ),
//     ],
//     //make some doc
//     [
//       Document(
//         "Chapter 1",
//         "assets/image/mlzama.png",
//         Category_doc("Chapters"),
//         'English Language II',
//       ),
//       Document(
//         "Chapter 2",
//         "assets/image/mlzama2.png",
//         Category_doc("Chapters"),
//         'English Language II',
//       ),
//       Document(
//         "Chapter 3",
//         "assets/image/mlzama.png",
//         Category_doc("Chapters"),
//         'English Language II',
//       ),
//       Document(
//         "Chapter 4",
//         "assets/image/mlzama.png",
//         Category_doc("Chapters"),
//         'English Language II',
//       ),
//       Document(
//         "Chapter 5",
//         "assets/image/mlzama.png",
//         Category_doc("Chapters"),
//         'English Language II',
//       ),
//     ],
//   ),
//   Subject(
//     'Computer Architectore',
//     'assets/image/hardware.png',
//     // description of subject
//     " A microprocessor is a computer processor where the data processing logic and control is included on a single integrated circuit, or a small number of integrated circuits. ",
//     "Dr.Heba Adnan",
//     [
//       Category(
//         "Chapters",
//         'assets/image/study.png',
//       ),
//       Category(
//         "Exams",
//         'assets/image/exam.png',
//       ),
//       Category(
//         "Important dates",
//         'assets/image/knowledge.png',
//       ),
//       Category(
//         "Exam Results",
//         'assets/image/open-book.png',
//       ),
//     ],
//     //make some doc
//     [
//       Document(
//         "Chapter 1",
//         "assets/image/mlzama.png",
//         Category_doc("Chapters"),
//         'Computer Architectore',
//       ),
//       Document(
//         "Chapter 2",
//         "assets/image/mlzama2.png",
//         Category_doc("Chapters"),
//         'Computer Architectore',
//       ),
//       Document(
//         "Chapter 3",
//         "assets/image/mlzama.png",
//         Category_doc("Chapters"),
//         'Computer Architectore',
//       ),
//       Document(
//         "Chapter 4",
//         "assets/image/mlzama.png",
//         Category_doc("Chapters"),
//         'Computer Architectore',
//       ),
//       Document(
//         "Chapter 5",
//         "assets/image/mlzama.png",
//         Category_doc("Chapters"),
//         'Computer Architectore',
//       ),
//     ],
//   )
// ];

// make provider for subjects
final SubjectProvider = StateProvider((ref) => subjectsList);

// make provider for all doc
final AllDocProvider = StateProvider((ref) {
  List<Document> allDoc = [];
  final subs = ref.watch(SubjectProvider);
  for (var subject in subs) {
    //بعدين اضيف الدوكمنت الى الليست
    // allDoc.addAll(subject.documents);
  }
  return allDoc;
});

// make provider for downloaded doc

final allWorkSheetProvider = StateProvider((ref) {
  List<worksheet> allWorkSheet = [];
  for (var subject in subjectsList) {
    //بعدين اضيف الواجبات الى الليست
    // allWorkSheet.addAll(subject.worksheets);
  }

  return allWorkSheet;
});

Future<List<Subject>> get_subjects() async {
  final db = FirebaseFirestore.instance;
  final subjects = await db.collection('Subjects').get();

  for (var subject in subjects.docs) {
    subjectsList.add(Subject(
      subject.id,
      subject['title'],
      subject['image'],
      subject['description'],
      subject['doctorName'],
    ));
  }
  print(
      "Donee--------------------------------------------------------------------");
  return subjectsList;
}
