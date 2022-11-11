import 'package:flutter/material.dart';
import 'todolist_model.dart';

void addTaskFunc(TextEditingController _editingController,
    TodoListModel listModel, BuildContext context) {
  if (_editingController.text != "") {
    listModel.addTask(_editingController.text);
    Navigator.pop(context);
  }
}
