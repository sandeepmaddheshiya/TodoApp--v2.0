import 'package:flutter/material.dart';

bool selectedPriority1 = false;
bool selectedPriority2 = false;
bool selectedPriority3 = false;

class PriorityAndCategory extends StatefulWidget {
  const PriorityAndCategory({
    super.key,
  });

  @override
  State<PriorityAndCategory> createState() => _PriorityAndCategoryState();
}

class _PriorityAndCategoryState extends State<PriorityAndCategory> {
  @override
  Widget build(BuildContext context) {
    // Color priorityColor = const Color.fromARGB(255, 223, 217, 217);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: SizedBox(
              height: 40,
              width: 120,
              child: TextField(
                onTap: null,
                readOnly: true,
                decoration: InputDecoration(
                    hintText: "  !   Priority",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 70).copyWith(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: SizedBox(
                    height: 40,
                    width: 63,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1.5),
                      child: TextField(
                        onTap: () {
                          setState(() {
                            selectedPriority1 = true;
                            selectedPriority2 = false;
                            selectedPriority3 = false;
                          });
                        },
                        readOnly: true,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "Low",
                          fillColor: Color.fromARGB(255, 223, 217, 217),
                          filled: true,
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        style: const TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 40,
                    width: 91,
                    child: TextField(
                      onTap: () {
                        setState(() {
                          selectedPriority1 = false;
                          selectedPriority2 = true;
                          selectedPriority3 = false;
                        });
                      },
                      readOnly: true,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          fillColor: Color.fromARGB(255, 223, 217, 217),
                          filled: true,
                          hintText: "Medium",
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 40,
                    width: 63,
                    child: TextField(
                      onTap: () {
                        selectedPriority1 = false;
                        selectedPriority2 = false;
                        selectedPriority3 = true;
                      },
                      readOnly: true,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          fillColor: Color.fromARGB(255, 223, 217, 217),
                          filled: true,
                          hintText: "High",
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Center(
              child: SizedBox(
                height: 40,
                width: 140,
                child: TextFormField(
                  onTap: null,
                  readOnly: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.category_sharp),
                      hintText: "Category",
                      hintStyle: TextStyle(fontSize: 18, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
