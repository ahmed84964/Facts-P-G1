import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text,style: TextStyle(fontSize: 20 , color: Colors.white),),
      centerTitle: true,
      backgroundColor: Colors.indigoAccent,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.maxFinite, 60);
}
