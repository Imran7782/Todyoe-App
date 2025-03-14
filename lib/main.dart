import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/taskscereen.dart';

const kstyle =
    TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);

void main() {
  runApp(const Todoey());
}

class Todoey extends StatefulWidget {
  const Todoey({super.key});

  @override
  State<Todoey> createState() => _TodoeyState();
}

class _TodoeyState extends State<Todoey> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Task>(
      create: (context) => Task(),
      child: MaterialApp(
        home: Taskscereen()
        ),
    );
  }

  
}

class Task extends ChangeNotifier {
  List<String> tasks = []; 
  late int ind;// Fixed camelCase


 void delete(String listTile){
     tasks.remove(listTile);
     notifyListeners();
 }
  void updateUi(String tx) {
    tasks.add(tx);
    notifyListeners();
  }
  void updateIndex(int index){
    ind=index;
    notifyListeners();
  }

  void clear1(){
    tasks.clear();
    notifyListeners();
  }
}
