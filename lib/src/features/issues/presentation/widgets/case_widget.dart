import 'package:flutter/material.dart';
import 'package:lawers/core/theme/app_colors.dart';

class CaseWidget extends StatelessWidget {
  const CaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'العميل السيد أحمد محمد',
              style: TextStyle(fontSize: 14, color: AppColors.primaryColor),
            ),
            Text(
              'قضية تعويض',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'رقم القضية: 123456789',
              style: TextStyle(fontSize: 14, color: AppColors.primaryColor),
            ),
          ],
        ),
        // Using a local asset image instead of network image to avoid loading errors
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.gavel,
            size: 50,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
