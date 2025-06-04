import 'package:flutter/material.dart';
import 'package:lawers/src/features/revenues/data/model/revenue_model.dart';

class RevenueWidget extends StatelessWidget {
  final RevenueModel revenue;
  final VoidCallback? onTap;

  const RevenueWidget({
    super.key,
    required this.revenue,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        onTap: onTap,
        title: Text(
          revenue.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('المبلغ الإجمالي: ${revenue.amount}'),
            Text('المدفوع: ${revenue.paidFees}'),
            Text('المتبقي: ${revenue.remainingFees}'),
            if (revenue.method.isNotEmpty)
              Text('طريقة الدفع: ${revenue.method}'),
            if (revenue.notes?.isNotEmpty ?? false)
              Text('ملاحظات: ${revenue.notes}'),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
