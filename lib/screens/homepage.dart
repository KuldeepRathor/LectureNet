// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lecturenet/helpers/palette.dart';
import 'package:lecturenet/screens/app_drawer_screens/feedback_screen.dart';
import 'package:lecturenet/screens/app_drawer_screens/help_screen.dart';
import 'package:lecturenet/screens/app_drawer_screens/invite_friend_screen.dart';
import 'package:lecturenet/screens/audio_recorder_screen.dart';
import 'package:lecturenet/screens/favourites.dart';
import 'package:lecturenet/screens/profile.dart';

import 'package:lecturenet/screens/settings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AdvancedDrawer(
      backdropColor: AppColors.bgColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(

          title: Text(
            'Gistme',
            style: GoogleFonts.orbitron(
                color: AppColors.txtColor,
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),

          centerTitle: true,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Image.asset(
                    value.visible
                        ? 'assets/icons/close.png'
                        : 'assets/icons/menu.png',
                    width: 30,
                    height: 30,
                  ),
                  // child: Icon(
                  //   value.visible ? Icons.clear : Icons.menu,
                  //   key: ValueKey<bool>(value.visible),
                  // ),
                );
              },
            ),
          ),
        ),
        body: MyHomePage(),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: AppColors.txtColor,
            iconColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: AppColors.txtColor,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        'A',
                        style: TextStyle(
                          fontSize: 54,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  Text('Hey 👋',
                      style: GoogleFonts.orbitron(
                          color: AppColors.txtColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                  Text('Welcome to Gistme',
                      style: GoogleFonts.orbitron(
                        color: AppColors.txtColor,
                        fontSize: 16,
                      )),

                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  Divider(color: AppColors.txtColor),

                  ListTile(
                    onTap: () {
                      Navigator.canPop(context);
                    },
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => USER_PROFILE(),
                        ),
                      );
                    },
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text('Profile',
                        style: GoogleFonts.orbitron(
                          color: AppColors.txtColor,
                          fontSize: 16,
                        )),
                    ),
                  

                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpScreen(),
                        ),
                      );
                    },
                    leading: Icon(Icons.help_center_sharp),
                    title: Text('Help',
                        style: GoogleFonts.orbitron(
                          color: AppColors.txtColor,
                          fontSize: 16,
                        )),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedbackScreen(),
                        ),
                      );
                    },
                    leading: Icon(Icons.feedback_sharp),
                    title: Text('Feedback',
                        style: GoogleFonts.orbitron(
                          color: AppColors.txtColor,
                          fontSize: 16,
                        )),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InviteFriend(),
                        ),
                      );
                    },
                    leading: Icon(Icons.card_giftcard_outlined),
                    title: Text('Refer a friend',
                        style: GoogleFonts.orbitron(
                          color: AppColors.txtColor,
                          fontSize: 16,
                        )),
                  ),

                  Divider(
                    color: AppColors.txtColor,
                  ), // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Column(
                  //       children: [
                  //         Expanded(
                  //           child: ListView.builder(
                  //             scrollDirection: Axis.vertical,
                  //             physics: BouncingScrollPhysics(),
                  //             shrinkWrap: true,
                  //             itemCount: 30,
                  //             itemBuilder: ((context, index) {
                  //               return Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Center(
                  //                   child: Text(
                  //                     'data',
                  //                     style: TextStyle(
                  //                       fontSize: 16,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               );
                  //             }),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Spacer(),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.txtColor,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
