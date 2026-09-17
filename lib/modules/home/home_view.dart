import 'package:cloud_firestore/cloud_firestore.dart' hide Settings;
import 'package:evently/core/utils/firebase_cloud_service.dart';
import 'package:evently/data_source/category_data_source.dart';
import 'package:evently/modules/home/widget/event_card_item.dart';
import 'package:evently/modules/home/widget/header_section.dart';
import 'package:evently/modules/home/widget/tab_bar_item.dart';
import 'package:flutter/material.dart';

import '../../models/event_data.dart';

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
        padding:  EdgeInsets.all(16.0),
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
            StreamBuilder<QuerySnapshot<EventData>>(
              stream: FirebaseCloudService.getRealtimeAllEventData(),

              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }

                List<EventData> eventData =
                    snapshot.data?.docs.map((doc) => doc.data()).toList() ??
                    [];

                final selectedCategoryId =
                    CategoryDataSource.categories[_selectedIndex].id;

                final filteredEvents = eventData
                    .where((event) => event.eventID == selectedCategoryId)
                    .toList();

                if (filteredEvents.isEmpty) {
                  return const Center(child: Text('Event is empty'));
                }

                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => EventCardItem(
                      eventData: filteredEvents[index],
                    ),

                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: filteredEvents.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
