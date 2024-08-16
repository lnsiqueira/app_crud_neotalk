import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditStudentPage extends StatefulWidget {
  const EditStudentPage({super.key, required this.docID});
  final String docID;

  @override
  State<EditStudentPage> createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  final _formkey = GlobalKey<FormState>();

  CollectionReference updateStudent =
      FirebaseFirestore.instance.collection('Student');
  Future<void> _updateStudent(id, name, email, password) {
    return updateStudent
        .doc(id)
        .update({
          'name': name,
          'email': email,
          'password': password,
        })
        // ignore: avoid_print
        .then((value) => print(" Student Updated"))
        // ignore: avoid_print
        .catchError((error) => print("Failed to update Student: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection('Student')
            .doc(widget.docID)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Something Wrong in HomePage');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          //Getting Data From FireStore
          var data = snapshot.data?.data();
          var name = data!['name'];
          var email = data['email'];
          var password = data['password'];
          return Scaffold(
            appBar: AppBar(
              title: const Text('Edit'),
            ),
            body: Form(
              key: _formkey,
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 15,
                    ),
                    child: TextFormField(
                      initialValue: name,
                      onChanged: (value) {
                        name = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(fontSize: 18),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please Fill Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 15,
                    ),
                    child: TextFormField(
                      initialValue: email,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(fontSize: 18),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please Fill Email';
                        }
                        if (!val.contains('@')) {
                          return 'Please Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 15,
                    ),
                    child: TextFormField(
                      initialValue: password,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: 18),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      obscureText: true,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please Fill Password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              _updateStudent(
                                  widget.docID, name, email, password);
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: const Text('Update'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.red),
                        ),
                        child: const Text('Reset'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
