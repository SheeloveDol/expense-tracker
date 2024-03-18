import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses; // <Expense> is from our model in expense.dart

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(expense: expenses[index]),

      // Using ListView.builder() to create a list of expenses is more efficient 
      //than using ListView() because it only builds the items that are visible 
      //on the screen. This is important when working with large lists of data.
    );
  }
}
