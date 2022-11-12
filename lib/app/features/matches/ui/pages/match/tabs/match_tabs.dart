import 'package:flutter/material.dart';

class MatchPageViewTabs extends StatelessWidget {
  final TabController tabController;

  final double height;

  const MatchPageViewTabs({
    Key? key,
    required this.tabController,
    this.height = 56,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final deviceWitdh = deviceSize.width;

    return SizedBox(
      width: deviceWitdh,
      height: height,
      child: TabBar(
        controller: tabController,
        labelColor: Colors.blueGrey,
        indicatorColor: Colors.blueGrey,
        tabs: const [
          Tab(
            text: "Resumo",
          ),
          Tab(
            text: "Status",
          ),
          Tab(
            text: "Escalação",
          ),
        ],
      ),
    );
  }
}
