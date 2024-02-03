import 'package:dayjob/presentation/screen_controller.dart';
import 'package:flutter/material.dart';

import 'mobile/mobile_navigation_screen.dart';

class LandingScreen extends StatefulWidget{

  @override
  _LandingScreen createState() => _LandingScreen();
}

class _LandingScreen extends State<LandingScreen>{

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Function to hide keyboard when you click anywhere on the screen
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if(!currentFocus.hasPrimaryFocus){
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              body: ResponsiveLayout(
                mobile: const MobileNavigationScreen(), // Points to home for mobile
                tablet: const MobileNavigationScreen(), // Points to home for tablet
              )
          ),
        )
    );
  }
}