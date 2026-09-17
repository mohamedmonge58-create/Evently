import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/core/utils/firebase_cloud_service.dart';
import 'package:evently/data_source/category_data_source.dart';
import 'package:evently/models/event_data.dart';
import 'package:evently/modules/on_boarding/widgets/edit_time_date.dart';
import 'package:evently/modules/on_boarding/widgets/selected.dart';
import 'package:evently/services/snack_bar_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class EventEdit extends StatefulWidget {
  final EventData eventData;

  const EventEdit({super.key, required this.eventData});

  @override
  State<EventEdit> createState() => _EventEditState();
}

class _EventEditState extends State<EventEdit> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  late String eventDate;
  late String eventTime;
  late int _selectedCategoryIndex;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.eventData.title);
    _descriptionController = TextEditingController(
      text: widget.eventData.description,
    );

    eventDate = DateFormat(
      'dd/MM/yyyy',
    ).format(widget.eventData.selectedDateTime);
    eventTime = DateFormat(
      'hh:mm a',
    ).format(widget.eventData.selectedDateTime);

    _selectedCategoryIndex = CategoryDataSource.categories.indexWhere(
      (category) => category.id == widget.eventData.eventID,
    );
    if (_selectedCategoryIndex == -1) _selectedCategoryIndex = 0;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  DateTime _combineDateAndTime(String dateStr, String timeStr) {
    final date = DateFormat('dd/MM/yyyy').parse(dateStr);
    final time = DateFormat('hh:mm a').parse(timeStr);
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  Future<void> _updateEvent() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      EasyLoading.show();

      widget.eventData
        ..title = _titleController.text
        ..description = _descriptionController.text
        ..selectedDateTime = _combineDateAndTime(eventDate, eventTime)
        ..eventID = CategoryDataSource.categories[_selectedCategoryIndex].id;

      await FirebaseCloudService.updateEventData(widget.eventData);

      EasyLoading.dismiss();

      if (!mounted) return;
      SnackBarServices.showSuccess("Event updated successfully");
      Navigator.pop(context, widget.eventData);
    } catch (e) {
      EasyLoading.dismiss();
      SnackBarServices.showError("Failed to update event, try again");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,

        leading: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
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
            padding:  EdgeInsets.only(
              top: 16,
              right: 30,
            ),
            child: Text(
              "Event details",
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
        padding:  EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    CategoryDataSource
                        .categories[_selectedCategoryIndex]
                        .image,
                  ),
                ),

                 SizedBox(height: 16),

                CategorySelector(
                  selectedIndex: _selectedCategoryIndex,
                  onCategoryChanged: (index) {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                ),

                 SizedBox(height: 16),

                 Text(
                  "Title",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),

                const SizedBox(height: 8),

                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:  EdgeInsets.symmetric(horizontal: 14),
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    controller: _titleController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                    style: TextStyle(
                      color: AppColors.mainTextLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),

                 SizedBox(height: 16),

                 Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),

                 SizedBox(height: 8),

                Container(
                  width: double.infinity,
                  height: 210,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:  EdgeInsets.all(16),
                  child: TextFormField(
                    controller: _descriptionController,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    style: TextStyle(
                      color: AppColors.mainTextLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),

                 SizedBox(height: 16),

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

                 SizedBox(height: 16),

                SizedBox(
                  height: 44,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: _updateEvent,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child:  Center(
                        child: Text(
                          "Update event",
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

                 SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
