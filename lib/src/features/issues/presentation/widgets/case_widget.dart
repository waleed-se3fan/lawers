import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lawers/core/theme/app_colors.dart';
import 'package:lawers/src/features/issues/data/model/issues_model.dart';

class CaseWidget extends StatelessWidget {
  final IssuesModel issue;

  const CaseWidget({super.key, required this.issue});

  @override
  Widget build(BuildContext context) {
    // Format the date
    String formattedDate = '';
    if (issue.registerDate != null) {
      try {
        final date = DateTime.parse(issue.registerDate!);
        formattedDate = DateFormat('yyyy-MM-dd').format(date);
      } catch (e) {
        formattedDate = issue.registerDate ?? '';
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'العميل ${issue.customer?.name ?? ''}',
                      style: TextStyle(fontSize: 14, color: AppColors.primaryColor),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      issue.caseTitle ?? '',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'رقم القضية: ${issue.caseNumber ?? ''}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      issue.category?.name ?? '',
                      style: TextStyle(fontSize: 12, color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    formattedDate,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoItem('المحكمة', issue.courtName ?? ''),
              _buildInfoItem('الدائرة', issue.circle ?? ''),
              _buildInfoItem('القاضي', issue.judgeName ?? ''),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildFeeItem('الرسوم المدفوعة', issue.paidFees?.toString() ?? '0'),
              _buildFeeItem('الرسوم المتبقية', issue.remainingFees?.toString() ?? '0'),
              _buildFeeItem('قيمة العقد', issue.contractPrice?.toString() ?? '0'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildFeeItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 2),
        Text(
          '$value جنيه',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
