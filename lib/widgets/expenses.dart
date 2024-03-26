import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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

  // Creating modal bottom sheet for adding expenses
  void _openAddNewExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true, // To make the modal bottom sheet full screen
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addNewExpense,
      ), // Passing the function to add the new expense
    );
  }

  // Adding new expense to the list of _recentExpenses
  void _addNewExpense(Expense expenseToBeAdded) {
    setState(() => _recentExpenses.add(expenseToBeAdded));
  }

  // removing expense from the list of _recentExpenses
  void _removeExpense(Expense expenseToBeRemoved) {
    setState(() => _recentExpenses.remove(expenseToBeRemoved));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddNewExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
              child: ExpensesList(
                  expenses: _recentExpenses,
                  onRemoveExpense:
                      _removeExpense)), // Passing the list of expenses to the ExpensesList widget
        ],
      ),
    );
  }
}
