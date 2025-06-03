import 'package:flutter/material.dart';
import 'package:lawers/src/features/issues/data/data_source/remote_data_source.dart';
import 'package:lawers/src/features/issues/presentation/view/add_new_case_view.dart';
import 'package:lawers/src/features/issues/presentation/widgets/case_widget.dart';

class LawsuitsView extends StatelessWidget {
  const LawsuitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('القضايا'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () async {
                await IssuesRemoteDataSourceImpl().getIssues();
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AddNewCaseView();
                    },
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            TabBar(tabs: [Tab(text: 'الكل')]),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const CaseWidget();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
