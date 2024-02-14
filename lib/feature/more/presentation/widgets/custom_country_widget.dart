import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/country_code_response.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_state.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';

class CustomCountryWidgetProfile extends StatelessWidget {
  const CustomCountryWidgetProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var cubitCountry=context.read<SignupCubit>();
    MoreCubit cubit=MoreCubit.get(context);
    return  BlocConsumer<SignupCubit, SignupState>(
      listener: (context,SignupState state) {},
      builder: (context,SignupState state) {
        return StatefulBuilder(builder: (BuildContext context,
            void Function(void Function()) setState) {
          if(cubitCountry.countryCodeModel!=null){
            return DropdownButton2<String>(
              customButton: Column(
                children: [
                  SizedBox(
                    height: 52,
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey),
                    //     borderRadius: BorderRadius.circular(8.r)),
                    child:
                    Row(
                      children: [
                        horizontalSpace(10),
                        const Icon(
                          Icons.flag,
                          color: Colors.grey,
                        ),
                        horizontalSpace(30),
                        Text(
                          cubitCountry.countryChoose,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.grey,
                        ),
                        horizontalSpace(18),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade600,
                  )
                ],
              ),
              isExpanded: true,
              underline: const SizedBox.shrink(),
              items: cubitCountry.countryCodeModel!
                  .map((CountryResponse e) =>
                  DropdownMenuItem<String>(
                    value: e.name!,
                    child: Text(
                      e.name!.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ))
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  cubitCountry.countryChoose = value!;
                  for(var a in  cubitCountry.countryCodeModel!){
                    if(cubitCountry.countryChoose==a.name!){
                      cubit.countryControllerId=a.id;
                      print('s:${cubit.countryControllerId}');
                    }
                  }
                });
              },
              buttonStyleData: ButtonStyleData(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.r))),
            );
          }
          else{
            return
              SizedBox(
                height: 52,
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.grey),
                //   borderRadius: BorderRadius.circular(8.r),),
                child:    Row(
                  children: [
                    horizontalSpace(10),
                    const Icon(
                      Icons.flag,
                      color: Colors.grey,
                    ),
                    horizontalSpace(30),
                    const Text('',),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.grey,
                    ),
                    horizontalSpace(18),
                  ],
                ),
              );
          }
        });
      },
    );
  }
}
