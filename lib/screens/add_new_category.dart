import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart';

import '../model/add_new_category_model.dart';

final List<AddCategoryModel> categoryList = [];

class AddNewCategory extends StatefulWidget {
  const AddNewCategory({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewCategory> createState() => _AddNewCategoryState();
}

class _AddNewCategoryState extends State<AddNewCategory> {
  final TextEditingController categoryTextFieldController =
      TextEditingController();

  void displayDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter Category Name'),
          content: TextField(
            controller: categoryTextFieldController,
            decoration: const InputDecoration(hintText: "Enter Text"),
          ),
          actions: [
            TextButton(
              child: const Text('SUBMIT'),
              onPressed: () {
                setState(() {
                  final newCategory = AddCategoryModel(
                    id: DateTime.now().toString(),
                    name: categoryTextFieldController.text,
                  );
                  categoryList.add(newCategory);
                  categoryTextFieldController.text = "";
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void removeCategory(AddCategoryModel category) {
    setState(() {
      categoryList.remove(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 15),
      child: Wrap(
        spacing: Checkbox.width,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 223, 217, 217),
              ),
              onPressed: () => displayDialog(context),
              child: const Text(
                "+ Add New Category",
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ),
          ...categoryList.map((button) => InputChip(
                onDeleted: () {
                  removeCategory(button);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()));
                },
                backgroundColor: const Color.fromARGB(255, 223, 217, 217),
                labelStyle: const TextStyle(fontWeight: FontWeight.w700),
                label: Text(button.name),
              )),
        ],
      ),
    );
  }
}
