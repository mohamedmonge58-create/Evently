import 'package:flutter/material.dart';

import '../core/config/gen/assets.gen.dart';
import '../models/category_data.dart';

class CategoryDataSource {


  static final List <CategoryData> categories =[


    CategoryData(
        id: 'sport',
        name: 'Sport',
        image: Assets.images.sportLight.path,
        darkImage: Assets.images.sportDark.path,

        icon: Icons.directions_bike_outlined

    ),

    CategoryData(
        id: 'birthday',
        name: 'Birthday',
        image: Assets.images.birthdayLight.path,
        darkImage: Assets.images.birthdayDark.path,
        icon: Icons.cake_outlined

    ),
    CategoryData(
        id: 'book_club',
        name: 'Book Club',
        image: Assets.images.bookClubLight.path,
        darkImage: Assets.images.bookClubDark.path,
        icon: Icons.chrome_reader_mode_outlined

    ),
    CategoryData(
        id: 'meeting',
        name: 'Meeting',
        image: Assets.images.meetingLight.path,
        darkImage: Assets.images.meetingDark.path,
        icon: Icons.groups_outlined

    ),
    CategoryData(
        id: 'exhibition',
        name: 'Exhibition',
        image: Assets.images.exhibitionLight.path,
        darkImage: Assets.images.exhibitionDark.path,
        icon: Icons.art_track_outlined

    ),

    
  ];


 static CategoryData getCategoriesById  (String eventID) {



    return categories.firstWhere((element) => element.id == eventID,
      orElse: () => categories.first,

    );


  }
}