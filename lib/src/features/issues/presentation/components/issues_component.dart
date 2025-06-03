import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawers/src/features/issues/presentation/logic/bloc/issues_bloc.dart';
import 'package:lawers/src/features/issues/presentation/widgets/case_widget.dart';

class IssuesComponent extends StatelessWidget {
  const IssuesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssuesBloc, IssuesState>(
      builder: (context, state) {
        if (state is IssuesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is IssuesSuccess) {
          return ListView.builder(
            itemCount: state.issues.length,
            itemBuilder: (context, index) {
              return CaseWidget(issue: state.issues[index]);
            },
          );
        } else if (state is IssuesFailure) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
