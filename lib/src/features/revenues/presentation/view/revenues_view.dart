import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawers/src/features/revenues/presentation/logic/bloc/revenue_bloc.dart';
import 'package:lawers/src/features/revenues/presentation/logic/bloc/revenue_event.dart';
import 'package:lawers/src/features/revenues/presentation/logic/bloc/revenue_state.dart';
import 'package:lawers/src/features/revenues/presentation/view/add_revenue_view.dart';

class RevenuesView extends StatefulWidget {
  const RevenuesView({super.key});

  @override
  State<RevenuesView> createState() => _RevenuesViewState();
}

class _RevenuesViewState extends State<RevenuesView> {
  @override
  void initState() {
    super.initState();
    context.read<RevenueBloc>().add(LoadRevenuesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المدفوعات'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddRevenueView()),
              ).then((_) {
                context.read<RevenueBloc>().add(LoadRevenuesEvent());
              });
            },
          ),
        ],
      ),
      body: BlocBuilder<RevenueBloc, RevenueState>(
        builder: (context, state) {
          if (state is RevenueLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RevenueLoaded) {
            return ListView.builder(
              itemCount: state.revenues.length,
              itemBuilder: (context, index) {
                final revenue = state.revenues[index];
                return ListTile(
                  leading: Text(revenue.id.toString()),
                  title: Text(revenue.name),
                  subtitle: Text('المبلغ: ${revenue.amount}'),
                  trailing: Text('المدفوع: ${revenue.paidFees}'),
                );
              },
            );
          } else if (state is RevenueError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('لا توجد مدفوعات'));
        },
      ),
    );
  }
}
