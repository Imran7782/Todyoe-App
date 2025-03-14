import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/Listtiles.dart';
import 'package:today/main.dart';

const kstyle =
    TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);

class Taskscereen extends StatefulWidget {
  const Taskscereen({super.key});

  @override
  State<Taskscereen> createState() => _TaskscereenState();
}

class _TaskscereenState extends State<Taskscereen> {
  // List<String> tasks = []; // Fixed camelCase
  String text = '';
 TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext buildContext) {
              return Material(
                child: Container(
                  height: 300,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min, 
                    children: [
                      const Text(
                        "Add Task",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: "Enter task",
                            hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(width: 5, color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                         Provider.of<Task>(context,listen: false).updateUi(_controller.text);
                         _controller.clear();
                          debugPrint("New Task has been added");
                          Navigator.pop(context); // Close bottom sheet
                                                },
                        child: const Text(
                          "Add Task",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Expanded(
             
              child: Container(
                padding: const EdgeInsets.only(left:17, top: 20),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 
                    
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      child:   IconButton(
                        onPressed: () {
                      
                    }, 
                    icon: Container(
                      height: 70,
                      width: 55,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: const Icon(
                        Icons.list,
                        color: Colors.blue,
                        size: 45,
                        ),
                    )),
                    ),),
                   Row(
                    children: [
                       const Text(
                      "Todoey",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 46),
                    ),

                    Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Container(
                      child:IconButton(
                        onPressed: () {
                      Provider.of<Task>(context,listen: false
                      ).clear1();
                    }, 
                    icon: Container(
                      height: 70,
                      width: 55,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.blue,
                        size: 45,
                        ),
                    )),
                    ),),

                    ],
                   ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "${Provider.of<Task>(context).tasks.length} Tasks",
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            Expanded(
              flex: 2,
              child: Container(
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 10) ,
                  child: ListView.builder(
                    itemCount: Provider.of<Task>(context).tasks.length,
                    itemBuilder: (context, index) {
                    
                       Provider.of<Task>(context,listen: false).updateIndex(index);
                    
                      return ListTiles();
                      
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
