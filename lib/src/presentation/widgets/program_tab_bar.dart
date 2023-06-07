import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/widgets/rating_tab_view.dart';
import 'package:specifit/src/presentation/widgets/schedule_tab_view.dart';

class ProgramTabBar extends StatefulWidget {
  const ProgramTabBar({Key? key}) : super(key: key);

  @override
  State<ProgramTabBar> createState() => _ProgramTabBarState();
}

class _ProgramTabBarState extends State<ProgramTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Jadwal"),
            Tab(text: "Ulasan"),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              ScheduleTabView(),
              RatingTabView(),
            ],
          ),
        ),
      ],
    );
  }
}
