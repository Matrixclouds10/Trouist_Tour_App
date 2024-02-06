import 'package:flutter/cupertino.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';

class CustomAuthTextWidget extends StatelessWidget {
  const CustomAuthTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyles.font14CustomBlack500w,
    );
  }
}
