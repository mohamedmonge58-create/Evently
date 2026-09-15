import 'package:evently/data_source/category_data_source.dart';
import 'package:evently/models/category_data.dart';
import 'package:evently/modules/home/widget/event_card_item.dart';
import 'package:evently/modules/home/widget/header_section.dart';
import 'package:evently/modules/home/widget/tab_bar_item.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 24,
          children: [
            HeaderSection(),
            DefaultTabController(
              length: CategoryDataSource.categories.length,

              child: TabBar(
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelPadding: EdgeInsets.symmetric(horizontal: 4),
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerHeight: 0,
                indicator: BoxDecoration(),
                tabs: CategoryDataSource.categories
                    .map(
                      (e) => TabBarItem(
                        categoryData: e,
                        isSelected:
                            _selectedIndex ==
                            CategoryDataSource.categories.indexOf(e),
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => EventCardItem(),

                separatorBuilder: (context, index) => SizedBox(height: 16),

                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
