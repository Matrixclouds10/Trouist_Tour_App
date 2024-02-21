import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/helpers/app_regex.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';
import 'package:tourist_tour_app/feature/more/presentation/widgets/custom_country_widget.dart';
import 'package:tourist_tour_app/feature/more/presentation/widgets/custom_more_image.dart';
import 'package:tourist_tour_app/feature/more/presentation/widgets/update_profile_listen.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MoreCubit cubit=MoreCubit.get(context);
    return  MediaQuery(
        data: MediaQuery.of(context).copyWith(
      textScaleFactor: 1.0, ),
      child: Scaffold(
        appBar:  PreferredSize(
            preferredSize: Size(double.infinity,62.h),
            child:  CustomAppBar(title:'edit_profile'.tr(), hasBackButton: true,)),
        body: BlocConsumer<MoreCubit, DataState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
                  padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                  child: SingleChildScrollView(
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(20),
                          Center(
                            child:
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      boxShadow: const [BoxShadow(color: Colors.black54,blurRadius: 2)],
                                      borderRadius: BorderRadius.circular(80)
                                    ),
                                    child:
                                    cubit.imageFile!=null?
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(80),
                                      child: Image.file(cubit.imageFile!,
                                        fit: BoxFit.cover,
                                      ),
                                    ):
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(80),
                                      child: Image.network(cubit.profileResponse!.image!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                 ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.white,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white,
                                        boxShadow: const [BoxShadow(color: Colors.black26,blurRadius: 2)]
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          cubit.pickImage();
                                        },
                                        icon: const Icon(Icons.camera_alt_outlined,color:AppColorLight.customGray,size: 19,),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          verticalSpace(24),
                          Text('full_name'.tr(),
                          style: TextStyles.font17Black400WightLato.copyWith(
                            color: AppColorLight.customBlack,
                          ),),
                           TextFormField(
                             keyboardType:TextInputType.name ,
                             style: TextStyle(
                               color: Colors.grey.shade500, // Change text color here
                             ),
                             validator: (value) {
                                if (value == null || value.isEmpty) {
                                return 'sign_val_na'.tr();
                                }
                                return null;
                                },
                            controller: cubit.nameController,

                          ),
                          verticalSpace(16),
                          Text('phone_number'.tr(),
                            style: TextStyles.font17Black400WightLato.copyWith(
                              color: AppColorLight.customBlack,
                            ),
                          ),
                           TextFormField(
                             style: TextStyle(
                               color: Colors.grey.shade500, // Change text color here
                             ),
                             keyboardType:TextInputType.phone ,
                             validator: (value) {
                               if (value == null || value.isEmpty) {
                                 return 'sign_val_phone'.tr();
                               }
                               return null;
                             },
                            controller: cubit.phoneController,
                          ),
                          verticalSpace(16),

                          Text('email_address'.tr(),
                            style: TextStyles.font17Black400WightLato.copyWith(
                              color: AppColorLight.customBlack,
                            ),
                          ),
                           TextFormField(
                             keyboardType:TextInputType.emailAddress ,
                             style: TextStyle(
                               color: Colors.grey.shade500, // Change text color here
                             ),
                             validator: (value) {
                               if (value == null ||
                                   value.isEmpty ||
                                   !AppRegex.isEmailValid(value)) {
                                 return 'login_val_em'.tr();
                               }
                               return null;
                             },
                             controller: cubit.emailController,
                           ),
                          verticalSpace(16),
                          Text('country'.tr(),
                            style: TextStyles.font17Black400WightLato.copyWith(
                              color: AppColorLight.customBlack,
                            ),
                          ),
                          verticalSpace(16),
                          const CustomCountryWidgetProfile(),
                          // verticalSpace(16),
                          // Text('password'.tr(),
                          //   style: TextStyles.font17Black400WightLato.copyWith(
                          //     color: AppColorLight.customBlack,),),
                          //   const TextField(
                          //     obscureText: true,
                          //   ),
                          verticalSpace(100),
                          CustomMaterialButtonWidget(text: 'save'.tr(), onPressed: (){
                            if(cubit.formKey.currentState!.validate()){
                              if(cubit.countryController.text.isNotEmpty){
                                cubit.updateProfile(HomeCubit.get(context).token!, context);
                              }else{
                                showToast('Choose Country', ToastStates.error, context);
                              }
                            }
                          }),
                          verticalSpace(16),
                          // const UpdateProfileBlocListener(),
                          CustomTextButton(text: 'change_password'.tr(), onPressed: (){

                            // NavigatePages.pushToPage(const ChangePasswordScreen(), context);
                          },
                          height: 56.h,
                            width: 343.w,
                          ),
                          verticalSpace(16),
                          Center(
                            child: InkWell(
                              onTap: (){
                                showToast('Cancel Done', ToastStates.success, context);

                              },
                              child: Text('cancel'.tr(),
                              style: TextStyles.font17Black400WightLato.copyWith(
                                fontFamily: AppFontsFamily.fontPoppins,
                                color: AppColorLight.primaryColor
                              ),
                              ),
                            ),
                          ),

                          verticalSpace(50),

                        ],
                      ),
                    ),
                  ),
                );
          },
        ),
      ),
    );
  }

}
