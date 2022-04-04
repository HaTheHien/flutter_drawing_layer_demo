import 'package:flutter/material.dart';

import '../widget/example2/pacman_tab.dart';

class Example2Page extends StatelessWidget {
  const Example2Page({Key? key}) : super(key: key);

  static const tabViews = [
    PacmanTab(),
  ];

  static const tabLabels = [
    Tab(text: '84436\'s pacman'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawing playground'),
        elevation: 0,
      ),
      body: DefaultTabController(
        length: tabViews.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Container(
                color: Theme.of(context).primaryColor,
                child: TabBar(
                  indicatorColor: Theme.of(context).colorScheme.onPrimary,
                  tabs: tabLabels,
                ),
              ),
            ),
          ],
          body: const TabBarView(
            children: tabViews,
          ),
        ),
      ),
    );
  }
}
