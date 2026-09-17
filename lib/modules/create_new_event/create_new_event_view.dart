import 'package:evently/core/config/routes/app_routes_name.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/core/providerrr/settings.dart';
import 'package:evently/core/utils/firebase_cloud_service.dart';
import 'package:evently/data_source/category_data_source.dart';
import 'package:evently/modules/home/widget/tab_bar_item.dart';
import 'package:evently/services/snack_bar_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../models/event_data.dart';
import '../on_boarding/widgets/edit_time_date.dart';

class CreateNewEventView extends StatefulWidget {
  const CreateNewEventView({super.key});

  @override
  State<CreateNewEventView> createState() => _CreateNewEventViewState();
}

class _CreateNewEventViewState extends State<CreateNewEventView> {
  int _selectedIndex = 0;
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  String eventDate = "Choose date";
  String eventTime = "Choose time";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Settings>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,

        leading: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutesName.layoutView);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 24,
                color: AppColors.mainColorLight,
              ),
            ),
          ),
        ),

        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 30),
            child: Text(
              "Add event",
              style: TextStyle(
                color: AppColors.mainTextLight,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 60),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 16,
                  children: [
                    Container(
                      height: 195,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.strokeLight),
                        image: DecorationImage(
                          image: AssetImage(
                            CategoryDataSource.categories[_selectedIndex].image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    DefaultTabController(
                      length: CategoryDataSource.categories.length,
                      child: TabBar(
                        onTap: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        dividerHeight: 0,
                        indicator: const BoxDecoration(),
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

                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Title",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        SizedBox(
                          height: 48,
                          child: TextFormField(
                            controller: _titleController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter a title';
                              }
                              return null;
                            },
                            style: TextStyle(
                              color:
                                  provider.currentThemeMode == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                            decoration: InputDecoration(
                              hintText: "Event Title",

                              hintStyle: TextStyle(
                                color:
                                    provider.currentThemeMode == ThemeMode.light
                                    ? AppColors.secTextLight
                                    : AppColors.secTextDark,
                              ),
                              filled: true,
                              fillColor:
                                  provider.currentThemeMode == ThemeMode.light
                                  ? AppColors.inputsLight
                                  : AppColors.inputsDark,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color:
                                      provider.currentThemeMode ==
                                          ThemeMode.light
                                      ? AppColors.strokeLight
                                      : AppColors.strokeDark,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color:
                                      provider.currentThemeMode ==
                                          ThemeMode.light
                                      ? AppColors.strokeLight
                                      : AppColors.strokeDark,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Description",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        SizedBox(
                          height: 168,
                          child: TextFormField(
                            controller: _descriptionController,
                            maxLines: 10,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter a title';
                              }
                              return null;
                            },
                            style: TextStyle(
                              color:
                                  provider.currentThemeMode == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),

                            decoration: InputDecoration(
                              hintText: "Event Description....",
                              hintStyle: TextStyle(
                                color:
                                    provider.currentThemeMode == ThemeMode.light
                                    ? AppColors.secTextLight
                                    : AppColors.secTextDark,
                              ),
                              filled: true,
                              fillColor:
                                  provider.currentThemeMode == ThemeMode.light
                                  ? AppColors.inputsLight
                                  : AppColors.inputsDark,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color:
                                      provider.currentThemeMode ==
                                          ThemeMode.light
                                      ? AppColors.strokeLight
                                      : AppColors.strokeDark,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color:
                                      provider.currentThemeMode ==
                                          ThemeMode.light
                                      ? AppColors.strokeLight
                                      : AppColors.strokeDark,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    EditTimeDate(
                      eventDate: eventDate,
                      eventTime: eventTime,

                      onDateChanged: (newDate) {
                        setState(() {
                          eventDate = newDate;
                        });
                      },

                      onTimeChanged: (newTime) {
                        setState(() {
                          eventTime = newTime;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 45,
                child: GestureDetector(
                  onTap: () {
                    final isDateTimeSelected =
                        eventDate != "Choose date" &&
                        eventTime != "Choose time";

                    if (_formKey.currentState!.validate() &&
                        isDateTimeSelected) {
                      final data = EventData(
                        eventID:
                            CategoryDataSource.categories[_selectedIndex].id,
                        id: CategoryDataSource.categories[_selectedIndex].id,

                        title: _titleController.text,
                        description: _descriptionController.text,
                        selectedDateTime: DateTime.now(),
                      );
                      EasyLoading.show();
                      FirebaseCloudService.createNewEvent(data).then((value) {
                        EasyLoading.dismiss();
                        if (value) {
                          SnackBarServices.showSuccess(
                            "Event added successfully",
                          );
                          Navigator.pop(context);
                        } else {
                          SnackBarServices.showError("Something went wrong");
                        }
                      });
                    } else if (!isDateTimeSelected) {
                      SnackBarServices.showError("please select event data");
                    }
                  },

                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        "Add event",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
