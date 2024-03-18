import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
// Creating dummy data for expenses
  final List<Expense> _recentExpenses = [
    Expense(
      title: 'Telescope',
      amount: 359.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Gas',
      amount: 45.00,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(child: ExpensesList(expenses: _recentExpenses)),
        ],
      ),
    );
  }
}
