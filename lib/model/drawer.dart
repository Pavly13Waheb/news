import 'package:flutter/material.dart';

class AppDrawer{
  static  drawerChild(
      {required BuildContext context,
        required IconData icon,
        required String childName,
        required Function() onChildTap}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
                vertical: MediaQuery.of(context).size.height * 0.01),
            child: InkWell(
              onTap: onChildTap,
              child: Row(
                children: [
                  Icon(icon, size: 30),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02),
                    child: Text(
                      childName,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}