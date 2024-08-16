import 'package:app_crud_neotalk/core/textfield.dart';
import 'package:app_crud_neotalk/student/model/studend.dart';
import 'package:flutter/material.dart';
import '../repository/student_repository.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _formkey = GlobalKey<FormState>();
  // text for textfield
  String email = '';
  String name = '';
  String password = '';
  // textfield
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //Clearing Text
  _clearText() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  _save() async {
    Student student = Student(
      id: '',
      name: name,
      email: email,
      password: password,
    );

    try {
      var result = await StudentRepository.createStudent(student);

      return result;
    } catch (e) {
      return -1;
    }
  }

  //Disposing Textfield
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            CustomTextEditField(
              controller: nameController,
              labettxt: 'Name',
            ),
            CustomTextEditField(
              controller: emailController,
              labettxt: 'Email',
              valid: true,
            ),
            CustomTextEditField(
              controller: passwordController,
              labettxt: 'Password',
              visibility: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        name = nameController.text;
                        email = emailController.text;
                        password = passwordController.text;
                        _save();

                        _clearText();
                        Navigator.pop(context);
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                  ),
                  child: const Text('Register'),
                ),
                ElevatedButton(
                  onPressed: _clearText,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  child: const Text('Clear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
