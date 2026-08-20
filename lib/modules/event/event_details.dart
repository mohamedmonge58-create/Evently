import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/modules/on_boarding/widgets/calender_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,

        leading: Padding(
          padding: const EdgeInsets.only(top: 16  ,left: 10 ),
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

        title: Padding(
          padding: const EdgeInsets.only(top: 16.0 , left: 25),
          child: Center(child: Text("Event details", style: TextStyle(color: AppColors.mainTextLight, fontSize: 18, fontWeight: FontWeight.w500 ,fontFamily: 'Poppins'),)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: IconButton(onPressed: (){}, icon:  Container(
              width: 35,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(AppAssets.editIcon , width: 24,height: 24,)
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0 ,right: 16),
            child: IconButton(onPressed: (){}, icon:  Container(
                width: 35,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child:SvgPicture.asset(AppAssets.trashIcon , width: 24,height: 24,)
    )
            )),


        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(AppAssets.sportLight)),
            SizedBox(height: 16),
            Text("We’re going to play football " , style: TextStyle(color: Colors.black , fontSize: 18, fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
            SizedBox(height: 16),
            CalenderDate(),
            SizedBox(height: 16),
            Text("Description  " , style: TextStyle(color: Colors.black , fontSize: 18, fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
            SizedBox(height: 8),
            Container(

                width: 400,
                height: 230,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Lorem ipsum dolor sit amet consectetur. Vulputate eleifend suscipit eget neque senectus a. Nulla at non malesuada odio duis lectus amet nisi sit. Risus hac enim maecenas auctor et. At cras massa diam porta facilisi lacus purus. Iaculis eget quis ut amet. Sit ac malesuada nisi quis  feugiat.", style: TextStyle(color: AppColors.mainTextLight , fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'Poppins'),),
                )),


          ],
        ),
      ),

    );
  }
}
