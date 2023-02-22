import 'package:crudapi/models/home_model.dart';
import 'package:crudapi/services/service.dart';
import 'package:crudapi/views/home_widgets/widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
          Expanded(
            child: FutureBuilder(
                future: getUser(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data.data[index].name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data.data[index].username),
                                Text(snapshot.data.data[index].email),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  deleteUser(id: snapshot.data.data[index].id);
                                });
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          );
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ),
          textfield(hintText: 'Enter name', controllar: nameControllar),
          textfield(hintText: 'Enter name', controllar: userNameControllar),
          textfield(hintText: 'Enter name', controllar: emailControllar),
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
              setState(() {
                addUser(
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
