import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  
  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  late String _userToDo;
  List todoList = [];

  /*void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }*/

  @override
  void initState() {
    super.initState();

    initFirebase();

    todoList.addAll(['Buy car', 'Copy code', 'Create cam']);
  }

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  void _menuOpen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('LL')),
        body: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              }, 
              child: const Text('To home')
            )
          ],
        ),
      );
    }));
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.greenAccent,
    appBar: AppBar(
      foregroundColor: const Color.fromARGB(255, 54, 241, 244),
      backgroundColor: Colors.white,
      elevation: 7,
      leading: IconButton(
        onPressed: () {
          _menuOpen();
        },
        icon: const Icon(Icons.menu),
      ),
    ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Text('There is no tasks =(');
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(snapshot.data!.docs[index].id), 
                child: Card(
                  child: ListTile(
                    title: Text(snapshot.data?.docs[index].get('item')),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Color.fromARGB(255, 231, 252, 0),
                      ),
                      onPressed: () {
                        FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();
                      },
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  //if (direction == DismissDirection.endToStart);
                  FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();
                  
                }
              );
            }
          );
        },
      ),
      /*ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(todoList[index]), 
            child: Card(
              child: ListTile(
                title: Text(todoList[index]),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Color.fromARGB(255, 231, 252, 0),
                  ),
                  onPressed: () {
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                ),
              ),
            ),
            onDismissed: (direction) {
              //if (direction == DismissDirection.endToStart);

              setState(() {
                todoList.removeAt(index);
              });
            }
          );
        }
      ),*/
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Adding new task'),
              content: TextField(
                onChanged: (String value) {
                  _userToDo = value;
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, 
                  child: const Text('Cancel')
                  ),
                TextButton(
                  onPressed: () {
                    /*setState(() {
                      todoList.add(_userToDo);
                    });*/
                    //Firebase.initializeApp();
                    FirebaseFirestore.instance.collection('items').add({'item': _userToDo});
                    Navigator.of(context).pop();
                  }, 
                  child: const Text('Done')
                  )
              ],
            );
          });
        },
        child: const Icon(
          Icons.add, 
          color: Colors.white,
          size: 50,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'LOL',
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}