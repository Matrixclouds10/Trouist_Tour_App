import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';

class CustomCountryWidget extends StatelessWidget {
  const CustomCountryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<CountryCode> countries = [
      CountryCode(code: 'US', name: 'United States', dialCode: '+1'),
      CountryCode(code: 'CA', name: 'Canada', dialCode: '+1'),
      // Add more countries as needed
    ];
    var cubit =context.read<SignupCubit>();
    return  Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade500)
      ),
      alignment: Alignment.bottomLeft,
      child: CountryListPick(
        // countryBuilder: (BuildContext context, CountryCode countryCode){
        //   return
        // },
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text('Choisir un pays'),
          ),
          theme: CountryTheme(
            isShowFlag: true,
            isShowTitle: true,
            isShowCode: true,
            isDownIcon: true,
            showEnglishName: true,
          ),
          initialSelection: '+20',
          onChanged: (CountryCode? code) {
            cubit.countryController.text=code!.dialCode!;
          },
          useUiOverlay: true,
          useSafeArea: false,

      ),
    );
  }
}
