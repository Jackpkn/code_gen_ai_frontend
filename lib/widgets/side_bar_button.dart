import 'package:flutter/material.dart';
import 'package:gen_code_ai/theme/app_color.dart';

class SideBarButton extends StatelessWidget {
  final bool isCollapsed;
  final IconData icon;
  final String text;
  const SideBarButton({super.key, required this.isCollapsed, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:   EdgeInsets.all(isCollapsed? 0: 8.0),
      child: Row(
        mainAxisAlignment: isCollapsed? MainAxisAlignment.center: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 14),
            child: Icon(
              icon,
              color: AppColors.whiteColor,
              size: 17,
            ),
          ),
          SizedBox(width: 10,),
        isCollapsed? Container():  Text(text, style: TextStyle(color: AppColors.whiteColor, fontSize: 16,),),
        ],
      ),
    );
  }
}
