// Creating structure or shape of an expense data with a model

// Adding uuid package to generate unique id for each expense with the following command: `dart pub add uuid`
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

// In order to dynamically display the category icon, we need to create a map that maps each category to an icon.
const categoryIcons = {
  Category.food: Icons.dinner_dining_outlined,
  Category.travel: Icons.flight_takeoff_outlined,
  Category.leisure: Icons.beach_access_outlined,
  Category.work: Icons.work_outlined,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid
            .v4(); // Initialize the id with a unique id. So each expense will have a unique id.

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // using a getter with arrow syntax to format the date
  String get formattedDate => formatter.format(date);
}
