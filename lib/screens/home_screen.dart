import 'package:flutter/material.dart';
import 'package:todo_app/screens/create_task_screen.dart';

import 'add_new_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreateTaskScreen()));
        },
        child: const Card(
          color: Colors.lightBlueAccent,
          child: Icon(
            Icons.add,
            size: 50,
          ),
        ),
      ),
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                "CATEGORIES",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...categoryList.map(
                    (button) => SizedBox(
                      height: 130,
                      width: 200,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "1 Task",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                button.name,
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                            Slider(
                              value: _currentSliderValue,
                              max: 100,
                              divisions: 5,
                              label: _currentSliderValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40).copyWith(top: 5),
              child: const Text(
                "TASKS TO DO",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  ///uyuy
                  ...newTasksList.map(
                    (button) => Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        setState(() {
                          newTasksList.remove(button);
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      child: SizedBox(
                        height: 100,
                        child: Card(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: button.isSelected,
                                      onChanged: (newBool) {
                                        setState(() {
                                          button.isSelected = newBool!;
                                        });
                                      }),
                                  SizedBox(
                                    width: 230,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          button.name,
                                          maxLines: null,
                                          style: TextStyle(
                                            fontSize: 18,
                                            decoration: (button.isSelected)
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                          ),
                                        ),
                                        Text('Due: ${button.date}, 12:00 Am'),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                    child: Text(
                                      button.priority,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
