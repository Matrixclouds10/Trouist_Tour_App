import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class CustomAvatarGrowWidget extends StatelessWidget {
  const CustomAvatarGrowWidget({super.key, required this.glowColor, required this.icon});
  final Color glowColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return
      AvatarGlow(
      startDelay: const Duration(milliseconds: 1000),
      glowColor: glowColor,
      glowShape: BoxShape.circle,
      animate: true,
      curve: Curves.fastOutSlowIn,
      child:  Material(
        elevation: 3.0,
        shape: const CircleBorder(),
        color: Colors.transparent,
        child:
        CircleAvatar(
          radius: 18.0,
          backgroundColor: glowColor.withOpacity(0.4),
          child: Icon(icon,
            color: Colors.white,
            size: 20,),
        ),
      ),
    );
  }
}
