import 'package:crudapi/models/home_model.dart';
import 'package:crudapi/services/service.dart';
import 'package:crudapi/views/add_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181A20),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddView()),
          );
          setState(() {});
        },
        child: const Text(
          "Add",
          style: TextStyle(color: Colors.black),
        ),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Crud Oprations',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: getUser(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 2, color: Colors.white),
                            borderRadius:
                                BorderRadius.circular(10), //<-- SEE HERE
                          ),
                          iconColor: const Color.fromARGB(255, 145, 145, 145),
                          textColor: Colors.white,
                          title: Text(snapshot.data.data[index].name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data.data[index].username),
                              Text(snapshot.data.data[index].email),
                            ],
                          ),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  TextEditingController namesController =
                                      TextEditingController();
                                  TextEditingController usernamesController =
                                      TextEditingController();
                                  TextEditingController emailsController =
                                      TextEditingController();
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Column(
                                            children: [
                                              TextField(
                                                controller: namesController,
                                                decoration:
                                                    const InputDecoration(
                                                        hintText: 'name'),
                                              ),
                                              TextField(
                                                controller: usernamesController,
                                                decoration:
                                                    const InputDecoration(
                                                        hintText: 'username'),
                                              ),
                                              TextField(
                                                controller: emailsController,
                                                decoration:
                                                    const InputDecoration(
                                                        hintText: 'email'),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                    const Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  await updateUser(
                                                      model: Data(
                                                          name: namesController
                                                              .text,
                                                          username:
                                                              usernamesController
                                                                  .text,
                                                          email:
                                                              emailsController
                                                                  .text),
                                                      id: snapshot
                                                          .data.data[index].id);
                                                  setState(() {});
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("updatedata"),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await deleteUser(
                                      id: snapshot.data.data[index].id);
                                  setState(() {});
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
