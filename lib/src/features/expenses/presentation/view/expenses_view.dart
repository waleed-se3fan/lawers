import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawers/src/features/expenses/presentation/logic/bloc/expense_bloc.dart';
import 'package:lawers/src/features/expenses/presentation/logic/bloc/expense_event.dart';
import 'package:lawers/src/features/expenses/presentation/logic/bloc/expense_state.dart';
import 'package:lawers/src/features/expenses/presentation/view/add_expense_view.dart';
import 'package:intl/intl.dart'; // For date formatting

class ExpensesView extends StatefulWidget {
  const ExpensesView({super.key});

  @override
  State<ExpensesView> createState() => _ExpensesViewState();
}

class _ExpensesViewState extends State<ExpensesView> {
  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(LoadExpensesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المصروفات'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddExpenseView()),
              ).then((_) {
                context.read<ExpenseBloc>().add(LoadExpensesEvent());
              });
            },
          ),
        ],
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExpenseLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: state.expenses.length,
              itemBuilder: (context, index) {
                final expense = state.expenses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header with name and amount
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              expense.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${expense.amount} ج.م',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Payment status
                        Row(
                          children: [
                            const Text('المدفوع: '),
                            Text(
                              '${expense.paidFees} ج.م',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Text('المتبقي: '),
                            Text(
                              '${expense.remainingFees} ج.م',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Payment method and date
                        Row(
                          children: [
                            const Text('طريقة الدفع: '),
                            Text(
                              expense.method,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              _formatDate(expense.date),
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),

                        // Description if exists
                        if (expense.description?.isNotEmpty ?? false) ...[
                          const SizedBox(height: 8),
                          const Text('الوصف:'),
                          Text(
                            expense.description!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],

                        // Notes if exists
                        if (expense.notes?.isNotEmpty ?? false) ...[
                          const SizedBox(height: 8),
                          const Text('ملاحظات:'),
                          Text(
                            expense.notes!,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],

                        // Created/Updated info
                        const SizedBox(height: 8),
                        Text(
                          'تم التحديث: ${_formatDateTime(expense.updatedAt)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is ExpenseError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('لا توجد مصروفات'));
        },
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('yyyy/MM/dd').format(date);
    } catch (e) {
      return dateString;
    }
  }

  String _formatDateTime(String dateTimeString) {
    try {
      final dateTime = DateTime.parse(dateTimeString);
      return DateFormat('yyyy/MM/dd hh:mm a').format(dateTime);
    } catch (e) {
      return dateTimeString;
    }
  }
}
