import 'package:flutter/material.dart';
import 'package:lawers/core/theme/app_colors.dart';

class OngoingCases extends StatelessWidget {
  const OngoingCases({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              'القضايا الجارية',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            TextButton(
              onPressed: () {},
              child:  Text(
                'عرض الكل',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children:  [
              CaseItem(
                caseNumber: '2024/123',
                clientName: 'عامر العلي',
                caseType: 'قضية تجارية',
                nextHearing: '15 يونيو 2025',
                status: 'جارية',
                statusColor: AppColors.info,
              ),
              Divider(color: AppColors.divider, height: 1),
              CaseItem(
                caseNumber: '2024/124',
                clientName: 'ليلى السليمان',
                caseType: 'قضية عمالية',
                nextHearing: '20 يونيو 2025',
                status: 'تحت المراجعة',
                statusColor: AppColors.warning,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CaseItem extends StatelessWidget {
  final String caseNumber;
  final String clientName;
  final String caseType;
  final String nextHearing;
  final String status;
  final Color statusColor;

  const CaseItem({
    super.key,
    required this.caseNumber,
    required this.clientName,
    required this.caseType,
    required this.nextHearing,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'قضية رقم $caseNumber',
                style:  TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
               Icon(
                Icons.person_outline_rounded,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                clientName,
                style:  TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 16),
               Icon(
                Icons.category_outlined,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                caseType,            style:  TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
      const SizedBox(height: 4),
      Row(
        children: [
           Icon(
            Icons.calendar_today_outlined,
            size: 16,
            color: AppColors.textSecondary,
          ),
          const SizedBox(width: 4),
          Text(
            'الجلسة القادمة: $nextHearing',
            style:  TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    ],
  ),
);
}
}
