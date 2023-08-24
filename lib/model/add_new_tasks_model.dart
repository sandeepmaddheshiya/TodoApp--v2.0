class AddNewTasks {
  final String id, name, date, priority;
  bool isSelected = false;
  AddNewTasks(
      {required this.isSelected,
      required this.date,
      required this.priority,
      required this.id,
      required this.name});
}
