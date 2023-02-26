import 'package:crudapi/services/service.dart';
import 'package:crudapi/views/add_and_edit_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // TextEditingController nameControllar = TextEditingController();
  // TextEditingController userNameControllar = TextEditingController();
  // TextEditingController emailControllar = TextEditingController();

  // clear() {
  //   setState(() {
  //     nameControllar.text;
  //     userNameControllar.text;
  //     emailControllar.text;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditView()),
          );
        },
        child: const Icon(Icons.add),
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
                      subtitle: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
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
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
