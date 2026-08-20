import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/modules/on_boarding/widgets/edit_time_date.dart';
import 'package:evently/modules/on_boarding/widgets/selected.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventEdit extends StatelessWidget {
  const EventEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,

        leading: Padding(
          padding: const EdgeInsets.only(top: 16  , ),
          child: TextButton(
            onPressed: () {

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
            padding: const EdgeInsets.only(top: 16.0 ,right: 30),
            child: Text("Event details", style: TextStyle(color: AppColors.mainTextLight, fontSize: 18, fontWeight: FontWeight.w500 ,fontFamily: 'Poppins'),),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(AppAssets.bookClubLight)),
            SizedBox(height: 16),
            CategorySelector(),
            SizedBox(height: 16),

            Text("Title " , style: TextStyle(color: Colors.black , fontSize: 18, fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
            SizedBox(height: 8),

            Container(

                width: 400,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text("Reading book club ", style: TextStyle(color: AppColors.mainTextLight , fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'Poppins'),),
                )),
            SizedBox(height: 16),
            Text("Description  " , style: TextStyle(color: Colors.black , fontSize: 18, fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
            SizedBox(height: 8),
            Container(

                width: 400,
                height: 210,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Lorem ipsum dolor sit amet consectetur. Vulputate eleifend suscipit eget neque senectus a. Nulla at non malesuada odio duis lectus amet nisi sit. Risus hac enim maecenas auctor et. At cras massa diam porta facilisi lacus purus. Iaculis eget quis ut amet. Sit ac malesuada nisi quis  feugiat.", style: TextStyle(color: AppColors.mainTextLight , fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'Poppins'),),
                )),
            SizedBox(height: 16),
            EditTimeDate(),
            SizedBox(height: 16),

            SizedBox(
              height:44 ,
              child: TextButton(
                onPressed: () {

                },
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
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


          ],
        ),
      ),

    );
  }
}
