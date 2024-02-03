import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget{
  final Widget mobile;
  final Widget tablet;

  ResponsiveLayout({required this.mobile, required this.tablet});

  @override
  _ResponsiveLayout createState() => _ResponsiveLayout(mobile, tablet);

}

class _ResponsiveLayout extends State<ResponsiveLayout> {

  Widget mobile;
  Widget tablet;
  _ResponsiveLayout(this.mobile, this.tablet);

  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth < 600){
          return mobile;
        }else{
          return tablet;
        }
      },
    );
  }
}
