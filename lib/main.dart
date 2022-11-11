import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_dapp/todolist_model.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoListModel(),
      child: MaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        debugShowCheckedModeBanner: false,
        title: 'TodoList Dapp',
        home:const TodoList(),
      ),
    );
  }
}
