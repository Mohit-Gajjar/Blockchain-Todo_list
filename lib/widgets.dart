import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final VoidCallback onLongPress;
  final String taskTitle;
  final bool isCompleted;
  const TaskTile(
      {Key? key,
      required this.onLongPress,
      required this.taskTitle,
      required this.isCompleted}) : super(key: key);

  @override
  State<TaskTile> createState() => TaskTileState();
}

class TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: const Color(0xff222228),
          borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        onLongPress: widget.onLongPress,
        leading: widget.isCompleted
            ? const Icon(
                Icons.done,
                color: Colors.white,
              )
            : const Icon(
                Icons.circle_outlined,
                color: Colors.white,
              ),
        title: Text(
          widget.taskTitle,
          style: TextStyle(
            color: Colors.white,
            decoration: widget.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}