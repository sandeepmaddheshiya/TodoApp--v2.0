import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/priority_center.dart';

import '../model/add_new_tasks_model.dart';
import 'add_new_category.dart';

final List<AddNewTasks> newTasksList = [];

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  bool? isChecked1 = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController newTaskTitle = TextEditingController();
    DateTime? datePicked;
    // List<Widget> categoryButtons = [];

    return Scaffold(
      floatingActionButton: Builder(
        builder: (context) => ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 2,
              fixedSize: const Size.fromWidth(152),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.blueAccent),
          onPressed: () {
            if (datePicked == null && newTaskTitle.text == "") {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Please give a title and pick a date")));
            } else if (newTaskTitle.text == "") {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please give a title")));
            } else if (datePicked == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please pick a date first")));
            } else if (selectedPriority1 == false &&
                selectedPriority2 == false &&
                selectedPriority3 == false) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Please select a priority first")));
            } else {
              setState(() {
                newTasksList.add(AddNewTasks(
                    isSelected: false,
                    date: (datePicked != null)
                        ? "${datePicked!.day}, ${datePicked!.month}, ${datePicked!.year}"
                        : "null",
                    priority: (selectedPriority1)
                        ? "Low"
                        : (selectedPriority2)
                            ? "Medium"
                            : "High",
                    id: DateTime.now().toString(),
                    name: newTaskTitle.text));

                selectedPriority1 = false;
                selectedPriority2 = false;
                selectedPriority3 = false;

                newTaskTitle.text = "";
              });

              // if (selectedPriority1 == true) {
              //   priorityName = "Low";
              // } else if (selectedPriority2 == true) {
              //   priorityName = "Medium";
              // } else if (selectedPriority3 == true) {
              //   priorityName = "High";
              // }

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()));
            }
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "New Task",
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 26, 30, 224)),
              ),
              Icon(
                Icons.keyboard_arrow_up_sharp,
                color: Color.fromARGB(255, 26, 30, 224),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Create Task",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 40),
              child: TextField(
                controller: newTaskTitle,
                maxLines: null,
                decoration: const InputDecoration(
                    hintText: "Enter Task Information",
                    hintStyle: TextStyle(
                        color: Colors.black38, fontSize: 18, letterSpacing: 1),
                    border: InputBorder.none),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: Colors.black,
                  fixedSize: const Size.fromWidth(150),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black),
                  ),
                ),
                onPressed: () async {
                  datePicked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2080));

                  log("$datePicked");
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                    ),
                    Text("Due"),
                    Text("Date"),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
              child: Row(
                children: [
                  Checkbox(
                      value: isChecked1,
                      onChanged: (newBool) {
                        setState(() {
                          isChecked1 = newBool;
                        });
                      }),
                  const Text(
                    "Completed",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const PriorityAndCategory(),
            const AddNewCategory(),
          ],
        ),
      ),
    );
  }
}
