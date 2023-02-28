import 'package:crudapi/models/home_model.dart';
import 'package:crudapi/services/service.dart';
import 'package:crudapi/views/home_widgets/widget.dart';
import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _EditViewState();
}

class _EditViewState extends State<AddView> {
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'AddView',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    textfield(
                        hintText: 'Enter name', controllar: nameControllar),
                    const SizedBox(
                      height: 10,
                    ),
                    textfield(
                        hintText: 'Enter username',
                        controllar: userNameControllar),
                    const SizedBox(
                      height: 10,
                    ),
                    textfield(
                        hintText: 'Enter email', controllar: emailControllar),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.99,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 0, 0, 0),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        Navigator.pop(context);
                      });
                      await addUser(
                        Data(
                            name: nameControllar.text,
                            username: userNameControllar.text,
                            email: emailControllar.text),
                      );
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
