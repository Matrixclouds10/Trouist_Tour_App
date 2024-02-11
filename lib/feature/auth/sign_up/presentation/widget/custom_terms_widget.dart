import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/bloc/help_cubit.dart';
import 'package:tourist_tour_app/core/helpers/extensions.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_state.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_show_dialog.dart';

class CustomTermsWidget extends StatefulWidget {
  const CustomTermsWidget({super.key});

  @override
  State<CustomTermsWidget> createState() => _CustomTermsWidgetState();
}

class _CustomTermsWidgetState extends State<CustomTermsWidget> {
  @override
  Widget build(BuildContext context) {
    var cubit2 =context.read<SignupCubit>();
    var cubit = context.read<HelpCubit>();
    return BlocConsumer<HelpCubit, HelpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 4),
          child: Row(
            children: [
              SizedBox(
                  width: 16,
                  height: 16,
                  child:
                  StatefulBuilder(builder: (context, setState) {
                    return Checkbox(
                      side: const BorderSide(color: Color(0xff929D9C)),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: cubit.isChecked,
                      activeColor: const Color(0xff009688),
                      onChanged: (bool? value) {
                        setState(() {
                          cubit.isChecked = value!;
                          if (cubit.isChecked == true) {
                            context.read<HelpCubit>().changeColor(
                                AppColorLight.customGray);
                          }
                        });
                      },
                    );
                  },)
              ),
              horizontalSpace(10),
              Text('agree'.tr(),
                style:
                TextStyles.font12CustomGray400WeightLato.copyWith(
                    color: cubit.color
                ),
                textAlign: TextAlign.end,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              BlocConsumer<SignupCubit, SignupState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                     try{
                       if(cubit2.termsResponse!=null){
                         customShowDialog(title: cubit2.termsResponse!.name!,
                             body: cubit2.termsResponse!.description!,
                             onPressed: () {
                               cubit.changeCheck(true);
                               context.pop();
                             },
                             context: context);
                       }else{

                       }
                     }catch(e){
                       print(e.toString());
                     }

                    },
                    child: Text(' ${'t&c'.tr()}',
                      style:
                      TextStyles.font12CustomGray400WeightLato.copyWith(
                          color: cubit.color2
                      ),
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
