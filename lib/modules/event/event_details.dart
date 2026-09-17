import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/core/utils/firebase_cloud_service.dart';
import 'package:evently/data_source/category_data_source.dart';
import 'package:evently/models/event_data.dart';
import 'package:evently/modules/on_boarding/widgets/calender_date.dart';
import 'package:evently/services/snack_bar_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'event_edit.dart';

class EventDetails extends StatefulWidget {
  final EventData eventData;

  const EventDetails({super.key, required this.eventData});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  late EventData eventData;

  @override
  void initState() {
    super.initState();
    eventData = widget.eventData;
  }

  Future<void> _deleteEvent() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            "Delete event",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          content: const Text(
            "Are you sure you want to delete this event? This action can't be undone.",
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );

    if (confirmed != true) return;

    try {
      EasyLoading.show();

      await FirebaseCloudService.deleteEventData(eventData);

      EasyLoading.dismiss();

      if (!mounted) return;
      Navigator.pop(context, true);
      SnackBarServices.showSuccess("Event deleted successfully");
    } catch (e) {
      EasyLoading.dismiss();
      SnackBarServices.showError("Failed to delete event, try again");
    }
  }

  Future<void> _editEvent() async {
    final result = await Navigator.push<EventData>(
      context,
      MaterialPageRoute(
        builder: (context) => EventEdit(eventData: eventData),
      ),
    );

    if (result != null) {
      setState(() {
        eventData = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('dd/MM/yyyy').format(eventData.selectedDateTime);
    final timeStr = DateFormat('hh:mm a').format(eventData.selectedDateTime);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,

        leading: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 10,
          ),
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

        title: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 25,
          ),
          child: Center(
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

        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: IconButton(
              onPressed: _editEvent,
              icon: Container(
                width: 35,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  AppAssets.editIcon,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: IconButton(
              onPressed: _deleteEvent,
              icon: Container(
                width: 35,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  AppAssets.trashIcon,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  CategoryDataSource.getCategoriesById(
                    eventData.eventID!,
                  ).image,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                eventData.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),

              const SizedBox(height: 16),

              CalenderDate(
                date: dateStr,
                time: timeStr,
              ),

              const SizedBox(height: 16),

              const Text(
                "Description",
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
                constraints: const BoxConstraints(minHeight: 230),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Text(
                  eventData.description,
                  style: TextStyle(
                    color: AppColors.mainTextLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
