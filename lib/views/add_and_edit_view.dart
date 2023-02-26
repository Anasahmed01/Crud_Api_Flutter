import 'package:crudapi/models/home_model.dart';
import 'package:crudapi/services/service.dart';
import 'package:crudapi/views/home_view.dart';
import 'package:crudapi/views/home_widgets/widget.dart';
import 'package:flutter/material.dart';

class EditView extends StatefulWidget {
  const EditView({super.key});

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  TextEditingController nameControllar = TextEditingController();
  TextEditingController userNameControllar = TextEditingController();
  TextEditingController emailControllar = TextEditingController();

  clear() {
    setState(() {
      nameControllar.text;
      userNameControllar.text;
      emailControllar.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          textfield(hintText: 'Enter name', controllar: nameControllar),
          textfield(hintText: 'Enter username', controllar: userNameControllar),
          textfield(hintText: 'Enter email', controllar: emailControllar),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 37, 27, 147),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeView()),
              );
              setState(() async {
                await addUser(
                  Data(
                      name: nameControllar.text,
                      username: userNameControllar.text,
                      email: emailControllar.text),
                );

                clear();
              });
            },
            child: const Text(
              'Add',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
