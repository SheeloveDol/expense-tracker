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
    // getting the index of the expense to be removed
    final expenseIndex = _recentExpenses.indexOf(expenseToBeRemoved);

    // removing the expense from the list
    setState(() => _recentExpenses.remove(expenseToBeRemoved));

    // Clearing all the snackbars before showing a new one
    ScaffoldMessenger.of(context).clearSnackBars();

    // Showing a snackbar to undo the removal of the expense
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text('Expense removed!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(
                () => _recentExpenses.insert(expenseIndex, expenseToBeRemoved));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Creating the main content of the app depending on the list of expenses
    Widget mainContent = const Center(
      child: Text('No expenses added yet!'),
    );

    if (_recentExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _recentExpenses, onRemoveExpense: _removeExpense);
    }

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
            child: mainContent,
          ), // Passing the list of expenses to the ExpensesList widget
        ],
      ),
    );
  }
}
