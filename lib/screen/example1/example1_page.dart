import 'package:flutter/material.dart';

import '../../widget/example1/draw_circle_tab.dart';
import '../../widget/example1/draw_curve1_tab.dart';
import '../../widget/example1/draw_curve2_tab.dart';
import '../../widget/example1/draw_line_tab.dart';
import '../../widget/example1/draw_rect_tab.dart';

class Example1Page extends StatelessWidget {
  const Example1Page({Key? key}) : super(key: key);

  static const tabViews = [
    DrawLineTab(),
    DrawRectTab(),
    DrawCircleTab(),
    DrawCurve1Tab(),
    DrawCurve2Tab(),
  ];

  static const tabLabels = [
    Tab(text: 'Line'),
    Tab(text: 'Rectangle'),
    Tab(text: 'Circle'),
    Tab(text: 'Curve'),
    Tab(text: 'Curve'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic shapes playground'),
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
