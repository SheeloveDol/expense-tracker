// Creating structure or shape of an expense data

// Adding uuid package to generate unique id for each expense with the following command: `dart pub add uuid`
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

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
}
