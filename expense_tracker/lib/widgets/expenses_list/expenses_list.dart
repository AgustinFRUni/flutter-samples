import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenses, this.onRemoveExpense, {super.key});

  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(
                expenses[index],
              ),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.85),
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
              onDismissed: (direction) {
                onRemoveExpense(
                  expenses[index],
                );
              },
              child: ExpenseItem(
                expenses[index],
              ),
            ));
  }
}
