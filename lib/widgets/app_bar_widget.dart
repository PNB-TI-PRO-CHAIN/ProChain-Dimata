import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onMenuPressed; 

  AppBarWidget({required this.title, this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white), 
        onPressed: onMenuPressed ?? () {}, 
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white, 
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
