import 'package:evently/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {'title': 'Book club', 'icon': Icons.menu_book_rounded},
    {'title': 'Sport', 'icon': Icons.directions_bike_outlined},
    {'title': 'Birthday', 'icon': Icons.cake_outlined},
    {'title': 'Meeting', 'icon': Icons.groups_outlined},
    {'title': 'Exhibition', 'icon': Icons.art_track_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: categories.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.mainColorLight : Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: isSelected
                      ? AppColors.mainColorLight
                      : const Color(0xffE5E5E5),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    categories[index]['icon'],
                    size: 24,
                    color: isSelected ? Colors.white : AppColors.mainColorLight,
                  ),

                  const SizedBox(width: 8),

                  Text(
                    categories[index]['title'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
