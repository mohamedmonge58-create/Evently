import 'package:evently/core/config/routes/app_routes_name.dart';
import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/modules/authentication/pages/login_view.dart';
import 'package:evently/modules/on_boarding/widgets/onboarding_2.dart';
import 'package:evently/modules/on_boarding/widgets/page_indicator.dart';
import 'package:evently/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Onboarding1 extends StatefulWidget {
  final int currentPage;
  const Onboarding1({super.key, required this.currentPage});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  late SettingsProvider appProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appProvider = Provider.of<SettingsProvider>(context, listen: false);
    appProvider.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<SettingsProvider>(
      builder: ( context, appProvider , child) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(            appProvider.locationMessage,
            ),
            SizedBox(height: 16),
            Center(child: Image.asset(AppAssets.hotTrending)),
            PageIndicator(currentPage: widget.currentPage, pageCount: 3),
            SizedBox(height: 24),
            Text(
              "Find Events That Inspire You",
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: 8),

            Text(
              "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(height: 16),

            // TextButton(onPressed: (){
            //
            //
            //
            // },
            //   style: TextButton.styleFrom(
            //     padding: EdgeInsets.zero
            //   ),
            //   child:
            // Container(
            //   width: double.infinity,
            //   height: 60,
            //   decoration: BoxDecoration(
            //       color: theme.primaryColor,
            //       borderRadius: BorderRadius.circular(20)
            //   ),
            //   child: Center(child: Text("Next" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500 , color: Colors.white,fontFamily: 'Poppins'),)),
            // )
            //   ,)
          ],
        ),
      ),
    );
  }
}
