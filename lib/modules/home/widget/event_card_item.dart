import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/core/utils/firebase_cloud_service.dart';
import 'package:evently/data_source/category_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../models/event_data.dart';
import '../../event/event_details.dart';

class EventCardItem extends StatefulWidget {
  final EventData eventData;

  const EventCardItem({super.key, required this.eventData});

  @override
  State<EventCardItem> createState() => _EventCardItemState();
}

class _EventCardItemState extends State<EventCardItem> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.eventData.isFavorite;
  }

  Future<void> _toggleFavorite() async {
    setState(() {
      isFavorite = !isFavorite;
    });

    widget.eventData.isFavorite = isFavorite;

    try {
      await FirebaseCloudService.updateEventData(widget.eventData);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isFavorite = !isFavorite;
        widget.eventData.isFavorite = isFavorite;
      });
    }
  }

  void _openDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventDetails(eventData: widget.eventData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: _openDetails,
      child: Container(
        width: double.infinity,
        height: 195,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              CategoryDataSource.getCategoriesById(
                widget.eventData.eventID!,
              ).image,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
          border: BoxBorder.all(color: AppColors.strokeLight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(8),
                border: BoxBorder.all(color: AppColors.strokeLight),
              ),
              child: Text(
                DateFormat(
                  "dd, MMM ",
                ).format(widget.eventData.selectedDateTime),
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(8),
                border: BoxBorder.all(color: AppColors.strokeLight),
              ),
              child: Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: Text(
                      widget.eventData.title,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.mainTextLight,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _toggleFavorite,
                    child: SvgPicture.asset(
                      isFavorite
                          ? AppAssets.selectedHeart
                          : AppAssets.unSelectedHeart,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
