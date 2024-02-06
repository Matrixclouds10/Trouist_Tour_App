import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/helpers/app_regex.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/country_code_response.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_state.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/presentation/widget/custom_terms_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_auth_text_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';

class CustomSignUpBodyWidget extends StatelessWidget {
  const CustomSignUpBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignupCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAuthTextWidget(text: 'Full Name',),
        verticalSpace(5),
        CustomTextField(
          validationFunc: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid full name';
            }
            return null;
          },
          contentVerticalPadding: 15.h,
          prefixIcon: const Icon(
            Icons.person,
            color: Color(0xff818181),
          ),
          hintText: '',
          controller: cubit.nameController,
        ),
        verticalSpace(20),
        const CustomAuthTextWidget(
          text: 'Phone Number',
        ),
        verticalSpace(5),
        CustomTextField(
          validationFunc: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid phone';
            }
            return null;
          },
          contentVerticalPadding: 15.h,
          textInputType: TextInputType.phone,
          prefixIcon: const Icon(
            Icons.phone,
            color: Color(0xff818181),
          ),
          hintText: '',
          controller: cubit.phoneController,
        ),
        verticalSpace(20),
        const CustomAuthTextWidget(
          text: 'Email Address',
        ),
        verticalSpace(5),
        CustomTextField(
          validationFunc: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isEmailValid(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
          contentVerticalPadding: 15.h,
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: Color(0xff818181),
          ),
          hintText: '',
          controller: cubit.emailController,
        ),
        verticalSpace(20),
        const CustomAuthTextWidget(
          text: 'Country',
        ),
        verticalSpace(5),
        BlocConsumer<SignupCubit, SignupState>(
          listener: (context,SignupState state) {},
          builder: (context,SignupState state) {
            return StatefulBuilder(builder: (BuildContext context,
                void Function(void Function()) setState) {
              if(cubit.countryCodeModel!=null){
                return DropdownButton2<String>(
                  customButton: Container(
                    height: 52,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.r)),
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
                          cubit.countryChoose,
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
                  isExpanded: true,
                  underline: const SizedBox.shrink(),
                  items: cubit.countryCodeModel!.countries!
                      .map((Countries? e) =>
                      DropdownMenuItem<String>(
                        value: e!.name!.en,
                        child: Text(
                          e.name!.en.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      cubit.countryChoose = value!;
                      for(var a in  cubit.countryCodeModel!.countries!){
                        if(cubit.countryChoose==a.name!.en!){
                          cubit.countryChooseId=a.id;
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
                  Container(
                    height: 52,
                    decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.r),),
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
        ),
        // const CustomCountryWidget(),
        verticalSpace(20),
        const CustomAuthTextWidget(text: 'Password',),
        verticalSpace(5),
        StatefulBuilder(builder: (context, setState) {
          return CustomTextField(
            isPassword: cubit.isVisible,
            validationFunc: (value) {
              if (value == null || value.isEmpty) {
                if (value!.length <= 6) {
                  return 'Please enter a valid password';
                }
              }
              return null;
            },
            contentVerticalPadding: 15.h,
            prefixIcon: const Icon(
              Icons.lock_open_outlined,
              color: Color(0xff818181),
            ),
            hintText: '',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  cubit.isVisible = !cubit.isVisible;
                });
              },
              icon: cubit.isVisible
                  ? const Icon(
                Icons.visibility_off_outlined,
                color: Color(0xff818181),
              )
                  : const Icon(
                Icons.visibility_outlined,
                color: AppColorLight.primaryColor,
              ),
            ),
            controller: cubit.passwordController,
          );
        }),
        verticalSpace(20),
        const CustomAuthTextWidget(
          text: 'Confirm Password',
        ),
        verticalSpace(5),
        StatefulBuilder(builder: (context, setState) {
          return CustomTextField(
            isPassword: cubit.isVisibleConfirm,
            validationFunc: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid confirm password';
              } else {
                if (cubit.passwordController.text != value) {
                  return 'Password confirmation does not match the password';
                }
              }
              return null;
            },
            contentVerticalPadding: 15.h,
            prefixIcon: const Icon(
              Icons.lock_open_outlined,
              color: Color(0xff818181),
            ),
            hintText: '',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  cubit.isVisibleConfirm = !cubit.isVisibleConfirm;
                });
              },
              icon: cubit.isVisibleConfirm
                  ? const Icon(
                Icons.visibility_off_outlined,
                color: Color(0xff818181),
              )
                  : const Icon(
                Icons.visibility_outlined,
                color: AppColorLight.primaryColor,
              ),
            ),
            controller: cubit.passwordConfirmationController,
          );
        }),
        const CustomTermsWidget(),
      ],
    );
  }
}
