import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_dapp/todolist_model.dart';
import 'package:to_do_list_dapp/widgets.dart';

import 'colors.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController taskAddingController = TextEditingController();
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    var listModel = Provider.of<TodoListModel>(context);
    return Scaffold(
        backgroundColor: const Color(0xff17171A),
        floatingActionButton: isOpen
            ? FloatingActionButton.extended(
                onPressed: () {
                  if (taskAddingController.text.isNotEmpty) {
                    listModel.addTask(taskAddingController.text);
                  }
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                backgroundColor: Colors.blue[900],
                icon: const Icon(Icons.save),
                label: const Text(
                  "Save",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
            : FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                backgroundColor: Colors.blue[900],
                icon: const Icon(Icons.add),
                label: const Text(
                  "New Task",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
        bottomSheet: isOpen
            ? Container(
                padding: const EdgeInsets.all(20),
                height: 110,
                color: const Color(0xff17171A),
                child: Center(
                  child: TextField(
                    onSubmitted: ((value) {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    }),
                    controller: taskAddingController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        label: const Text(
                          "Enter task",
                          style: TextStyle(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: const Color(0xff17171A),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(14)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(14))),
                  ),
                ),
              )
            : Container(
                height: 0,
              ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Text(
                "Add TODOs",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: listModel.isLoading
                  ? buildLoadingIndicator()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: listModel.taskCount,
                      itemBuilder: (context, index) {
                        return TaskTile(
                            onLongPress: () {
                              listModel
                                  .toggleComplete(listModel.todos[index].id);
                            },
                            taskTitle:
                                listModel.todos[index].taskName.toString(),
                            isCompleted: listModel.todos[index].isCompleted);
                        //
                      },
                    ),
            ),
          ],
        ));
  }

  Center buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(color: primary),
    );
  }

  Expanded buildCountTaskText(TodoListModel listModel) {
    return Expanded(
      flex: 1,
      child: Text(
        listModel.taskCount.toString() + " Tasks",
        style: const TextStyle(color: white, fontSize: 18),
      ),
    );
  }

  Expanded buildIconAndName() {
    return Expanded(
      flex: 3,
      child: Row(
        children: const [
          Expanded(
            flex: 2,
            child: Icon(
              Icons.playlist_add_check,
              size: 40,
              color: white,
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 8,
            child: Text(
              "Todo Chain",
              style: TextStyle(
                  fontSize: 40, color: white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
