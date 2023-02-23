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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          textfield(hintText: 'Enter name', controllar: nameControllar),
          textfield(hintText: 'Enter name', controllar: nameControllar),
          textfield(hintText: 'Enter name', controllar: nameControllar),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }
}
