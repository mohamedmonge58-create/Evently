import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class EditTimeDate extends StatefulWidget {
  final String eventDate;
  final String eventTime;

  final ValueChanged<String> onDateChanged;
  final ValueChanged<String> onTimeChanged;

  const EditTimeDate({
    super.key,
    required this.eventDate,
    required this.eventTime,
    required this.onDateChanged,
    required this.onTimeChanged,
  });

  @override
  State<EditTimeDate> createState() => _EditTimeDateState();
}

class _EditTimeDateState extends State<EditTimeDate> {
  late String selectedDate;
  late String selectedTime;

  @override
  void initState() {
    super.initState();

    selectedDate = widget.eventDate;
    selectedTime = widget.eventTime;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AppAssets.calendarIcon,
              width: 24,
              height: 24,
            ),

            const SizedBox(width: 4),

            Expanded(
              child: Text(
                "Event Date",
                style: TextStyle(
                  color: AppColors.mainTextLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),

            GestureDetector(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );

                if (date == null) return;

                final newDate = DateFormat('dd/MM/yyyy').format(date);



                setState(() {
                  selectedDate = newDate;
                });

                widget.onDateChanged(newDate);
              },
              child: Text(
                selectedDate,
                style: TextStyle(
                  color: AppColors.mainColorLight,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            SvgPicture.asset(
              AppAssets.clockIcon,
              width: 24,
              height: 24,
            ),

            const SizedBox(width: 4),

            Expanded(
              child: Text(
                "Event Time",
                style: TextStyle(
                  color: AppColors.mainTextLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),

            GestureDetector(
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (time == null) return;

                final newTime = time.format(context);

                setState(() {
                  selectedTime = newTime;
                });

                widget.onTimeChanged(newTime);
              },
              child: Text(
                selectedTime,
                style: TextStyle(
                  color: AppColors.mainColorLight,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}