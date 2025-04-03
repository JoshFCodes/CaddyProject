import 'package:flutter/cupertino.dart';

class MainBar extends StatelessWidget implements ObstructingPreferredSizeWidget{


  //Currently takes center text
  //TODO implement home and last page functionality
  //TODO last page functionality requires us to format the back chevron

     final String centerText;
   
     final Color? backgroundColor;

   const MainBar({super.key, required this.centerText, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {

    return CupertinoNavigationBar(
          backgroundColor: backgroundColor,
          //leading: IconThemeData(color: Color(0)),
          middle: Text(centerText),
          trailing: Text("HOME"),
          
          
        );

  }
  
  @override
  Size get preferredSize {
    return const Size.fromHeight(40);
  }
  
  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor =
      CupertinoDynamicColor.maybeResolve(this.backgroundColor, context) ??
      CupertinoTheme.of(context).barBackgroundColor;
  return backgroundColor.alpha == 0xFF;
  }
}