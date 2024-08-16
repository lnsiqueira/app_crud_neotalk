import 'package:app_crud_neotalk/core/textstyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../student/pages/add_student_page.dart';
import '../student/pages/edit_student_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> studentRecords =
      FirebaseFirestore.instance.collection('Student').snapshots();
  CollectionReference delStudent =
      FirebaseFirestore.instance.collection('Student');
  Future<void> _delete(id) {
    return delStudent
        .doc(id)
        .delete()
        // ignore: avoid_print
        .then((value) => print('Student Deleted'))
        // ignore: avoid_print
        .catchError((_) => print('Something Error In Deleted Student'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentRecords,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            if (kDebugMode) {
              print('Something Wrong in HomePage');
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List firebaseData = [];
          snapshot.data?.docs.map((DocumentSnapshot documentSnapshot) {
            Map store = documentSnapshot.data() as Map<String, dynamic>;
            firebaseData.add(store);
            store['id'] = documentSnapshot.id;
          }).toList();
          return Scaffold(
            appBar: AppBar(
              leading: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('assets/logo_ne.png'),
                ),
              ),
              title: Text('Crud-Neotalk(Student)'.toUpperCase()),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddStudentPage(),
                        ),
                      );
                    },
                    child: const Text('Add'),
                  ),
                )
              ],
            ),
            body: Container(
              margin: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    1: FixedColumnWidth(150),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            color: const Color.fromARGB(255, 220, 88, 88),
                            child: Center(
                              child: Text(
                                'Name',
                                style: txt,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            color: const Color.fromARGB(255, 220, 88, 88),
                            child: Center(
                              child: Text(
                                'Email',
                                style: txt,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            color: const Color.fromARGB(255, 220, 88, 88),
                            child: Center(
                              child: Text(
                                'Action',
                                style: txt,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    for (var i = 0; i < firebaseData.length; i++) ...[
                      TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              child: Center(
                                child: Text(
                                  firebaseData[i]['name'],
                                  style: txt2,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              child: Center(
                                child: Text(
                                  firebaseData[i]['email'],
                                  style: txt2,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditStudentPage(
                                          docID: firebaseData[i]['id'],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.orange,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _delete(firebaseData[i]['id']);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        });
  }
}
