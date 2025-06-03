import 'package:flutter/material.dart';
import 'package:lawers/core/theme/app_colors.dart';
import 'package:lawers/src/features/home/presentation/widgets/header.dart' show Header;
import 'package:lawers/src/features/home/presentation/widgets/on_going_cases.dart';
import 'package:lawers/src/features/home/presentation/widgets/recent_activites.dart';
import 'package:lawers/src/features/home/presentation/widgets/stats_cards.dart';



class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Header(),
              SizedBox(height: 24),
              StatsCards(),
              SizedBox(height: 24),
              RecentActivities(),
              SizedBox(height: 24),
              OngoingCases(),
            ],
          ),
        ),
      ),
    );
  }
}
