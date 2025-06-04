import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawers/src/features/expenses/data/model/expense_model.dart';
import 'package:lawers/src/features/expenses/presentation/logic/bloc/expense_bloc.dart';
import 'package:lawers/src/features/expenses/presentation/logic/bloc/expense_event.dart';

class AddExpenseView extends StatefulWidget {
  const AddExpenseView({super.key});

  @override
  State<AddExpenseView> createState() => _AddExpenseViewState();
}

class _AddExpenseViewState extends State<AddExpenseView> {
  final _formKey = GlobalKey<FormState>();
  final _clientNameController = TextEditingController();
  final _amountController = TextEditingController();
  final _paidAmountController = TextEditingController();
  final _remainingAmountController = TextEditingController();
  final _notesController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _paymentMethod = 'نقدي';

  @override
  void dispose() {
    _clientNameController.dispose();
    _amountController.dispose();
    _paidAmountController.dispose();
    _remainingAmountController.dispose();
    _notesController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _calculateRemaining() {
    if (_amountController.text.isNotEmpty &&
        _paidAmountController.text.isNotEmpty) {
      final amount = double.tryParse(_amountController.text) ?? 0;
      final paid = double.tryParse(_paidAmountController.text) ?? 0;
      final remaining = amount - paid;
      _remainingAmountController.text = remaining.toStringAsFixed(2);
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final expense = ExpenseModel(
        categoryId: 1, // You might want to make this dynamic
        name: _clientNameController.text,
        amount: double.parse(_amountController.text),
        date: DateTime.now().toIso8601String().split('T')[0],
        method: _paymentMethod,
        notes: _notesController.text,
        description: _descriptionController.text,
        paidFees: double.parse(_paidAmountController.text),
        remainingFees: double.parse(_remainingAmountController.text),
        userId: 1, // You might want to get this from auth
      );

      context.read<ExpenseBloc>().add(AddExpenseEvent(expense));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إضافة مدفوع جديد'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _clientNameController,
                decoration: const InputDecoration(
                  labelText: 'اسم العميل',
                  border: OutlineInputBorder(),
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال اسم العميل';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'المبلغ الإجمالي',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                onChanged: (_) => _calculateRemaining(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال المبلغ';
                  }
                  if (double.tryParse(value) == null) {
                    return 'الرجاء إدخال مبلغ صحيح';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _paidAmountController,
                decoration: const InputDecoration(
                  labelText: 'المبلغ المدفوع',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                onChanged: (_) => _calculateRemaining(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال المبلغ المدفوع';
                  }
                  if (double.tryParse(value) == null) {
                    return 'الرجاء إدخال مبلغ صحيح';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _remainingAmountController,
                enabled: false,
                decoration: const InputDecoration(
                  labelText: 'المبلغ المتبقي',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _paymentMethod,
                decoration: const InputDecoration(
                  labelText: 'طريقة الدفع',
                  border: OutlineInputBorder(),
                ),
                items:
                    ['نقدي', 'تحويل بنكي', 'شيك']
                        .map(
                          (method) => DropdownMenuItem(
                            value: method,
                            child: Text(method),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'الوصف',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(
                  labelText: 'ملاحظات',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('حفظ المدفوع'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
