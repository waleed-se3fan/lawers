import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawers/src/features/issues/data/data_source/remote_data_source.dart';
import 'package:lawers/src/features/issues/presentation/components/issues_component.dart';
import 'package:lawers/src/features/issues/presentation/logic/bloc/issues_bloc.dart';
import 'package:lawers/src/features/issues/presentation/view/add_new_case_view.dart';

class LawsuitsView extends StatelessWidget {
  const LawsuitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('القضايا'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => IssuesBloc(),
                      child: const AddNewCaseView(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => IssuesBloc()..add(GetIssuesEvent()), // Initial fetch
        child: BlocBuilder<IssuesBloc, IssuesState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                // Dispatch event to fetch issues again
                context.read<IssuesBloc>().add(GetIssuesEvent());
                // Wait for the state to change to indicate loading is complete or failed
                // This is a common pattern, but you might need to adjust based on your BLoC's state emissions
                await context.read<IssuesBloc>().stream.firstWhere((newState) => newState is IssuesSuccess || newState is IssuesFailure || newState is IssuesInitial);
              },
              child: IssuesComponent(),
            );
          },
        ),
      ),
    );
  }
}
