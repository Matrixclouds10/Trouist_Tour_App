import 'package:flutter/material.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/search/presentation/screen/search_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';

class CustomSearchHome extends StatelessWidget {
  const CustomSearchHome({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigatePages.pushToPage( const SearchScreen(), context);
      },
      child: CustomTextField(
          enabled: false,
          borderColor: AppColorLight.customGray,
          hintText: 'Search For A Tourist Place',
          hintStyle: TextStyles.font14CustomGray400w,
          prefixIcon: const Icon(Icons.search,color: AppColorLight.gray2,),
          controller: TextEditingController()),
    );
  }
}
