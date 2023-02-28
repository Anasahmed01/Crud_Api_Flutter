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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddView()),
          );
          setState(() {});
        },
        child: const Text("data"),
      ),
      appBar: AppBar(
        title: const Text('Crud Oprations'),
        backgroundColor: const Color.fromARGB(255, 42, 39, 39),
      ),
      body: FutureBuilder(
          future: getUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () async {
                                await deleteUser(
                                    id: snapshot.data.data[index].id);
                                setState(() {});
                              },
                              icon: const Icon(Icons.delete)),
                          IconButton(
                              onPressed: () async {
                                TextEditingController namesController =
                                    TextEditingController();
                                TextEditingController usernamesController =
                                    TextEditingController();
                                TextEditingController emailsController =
                                    TextEditingController();
                                TextEditingController phonesController =
                                    TextEditingController();
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Column(
                                          children: [
                                            TextField(
                                              controller: namesController,
                                              decoration: const InputDecoration(
                                                  hintText: 'name'),
                                            ),
                                            TextField(
                                              controller: usernamesController,
                                              decoration: const InputDecoration(
                                                  hintText: 'username'),
                                            ),
                                            TextField(
                                              controller: emailsController,
                                              decoration: const InputDecoration(
                                                  hintText: 'email'),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            ElevatedButton(
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
                                                child: const Text("updatedata"))
                                          ],
                                        ),
                                      );
                                    });
                              },
                              icon: const Icon(Icons.edit)),
                        ],
                      ),
                    );
                  });
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
