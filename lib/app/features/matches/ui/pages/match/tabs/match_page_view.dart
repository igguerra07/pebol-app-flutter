import 'package:flutter/material.dart';

class MatchTabView extends StatelessWidget {
  final List<Widget> children;
  final TabController? tabController;

  const MatchTabView({
    Key? key,
    required this.children,
    this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: TabBarView(
        controller: tabController,
        children: children,
      ),
    );
  }
}
