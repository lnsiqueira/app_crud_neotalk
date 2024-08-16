import 'package:app_crud_neotalk/student/model/studend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class StudentRepository extends ChangeNotifier {
  static Future<int> createStudent(Student student) async {
    try {
      var id = const Uuid().v1();
      final newCompany = FirebaseFirestore.instance.collection('Student').doc();
      final json = {
        'id': id,
        'name': student.name,
        'email': student.email,
        'password': student.password,
      };
      await newCompany.set(json);
      return 1;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return -1;
    }
  }
}
