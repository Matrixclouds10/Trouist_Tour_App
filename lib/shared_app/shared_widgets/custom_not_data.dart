import 'package:flutter/cupertino.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';

class CustomNotData extends StatelessWidget {
  const CustomNotData({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Not Data Now',
    style: TextStyles.font18CustomBlack600Weight,
    );
  }
}
