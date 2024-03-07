import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/favorite/logic/favorite_cubit.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/home/pressentation/screens/tourist_places_details_screen.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/shimmer_places_search.dart';
import 'package:tourist_tour_app/feature/root_pages/root_page.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/screens/program_details.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_religious_program_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_slider_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);

    return
      MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,),
          child:
          PopScope(
            canPop: false,
            onPopInvoked: (_) async {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      RootPages(check: '0',)));
            },
            child: Scaffold(
              appBar: AppBar(
                title:
                Text('search'.tr(), style: TextStyles.font18CustomBlack600Weight.copyWith(
                  // color: AppColorLight.primaryColor
                )),
                centerTitle: true,
                leading: const Icon(Icons.arrow_back_ios),
              ),
                body:
                Padding(
                  padding: EdgeInsets.only(left: 13.w, right: 13.w),
                  child: BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpace(15),
                              Container(
                                // clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [BoxShadow(color: Colors.black26,blurRadius: 1,
                                  offset: Offset(2,4),)
                                  ],

                                ),
                                child: Stack(
                                  children: [
                                    CustomTextField(
                                      borderColor: AppColorLight.customGray,
                                      hintText: 'search_home'.tr(),
                                      hintStyle: TextStyles.font14CustomGray400w,
                                      prefixIcon: const Icon(Icons.search,
                                        color: AppColorLight.gray2,),
                                      onChanged: (value){
                                        if(value.isNotEmpty){
                                          cubit.changeSearchStart(true);
                                          cubit.search(value, context);
                                        }else{
                                          cubit.changeSearchStart(false);
                                        }
                                      },
                                      textInputAction: TextInputAction.search,
                                      onFieldSubmitted: (val){
                                        cubit.search(val, context);
                                      },
                                      controller: cubit.searchController,
                                    ),
                                    cubit.isSearchStart==true?
                                    Positioned(
                                      left: 5,
                                      top: 3,
                                      bottom: 3,
                                      child:
                                      Container(
                                        width: 30.w,
                                        color: Colors.white,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: (){
                                              cubit.searchController.text='';
                                              cubit.changeSearchStart(false);
                                            },
                                            icon: const Icon(Icons.clear,
                                              color: AppColorLight.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ):const SizedBox.shrink(),
                                  ],
                                ),
                              ),
                              cubit.isSearchStart?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  verticalSpace(20),
                                  Text('places'.tr(), style: TextStyles.font18CustomBlack600Weight),
                                  SizedBox(height: 16.h,),
                                  if(cubit.searchResponse!=null)
                                    if(cubit.searchResponse!.places!.isEmpty)
                                      Center(child: Text('no_data_currently'.tr(), style: TextStyles.font18CustomBlack600Weight.copyWith(color: AppColorLight.customGray)))
                                    else
                                      SizedBox(
                                        height: 200.h,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:cubit.searchResponse!.places!.length ,
                                            itemBuilder: (context,index){
                                              return InkWell(
                                                onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TouristPlaceDetailsScreen(touristPlaceResponse: cubit.searchResponse!.places![index],)));
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: MediaQuery.of(context).size.width*0.4,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                        color: Colors.grey.shade200,
                                                        boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 2)]
                                                    ),
                                                    child:  Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft:  Radius.circular(10)),
                                                              child: CustomSliderWidget(
                                                                height: 115.h,
                                                                image:cubit.searchResponse!.places![index].images!.map((e) => e.image!).toList(),),
                                                            ),
                                                            Positioned(
                                                              top: 10.h,
                                                              right: 10.w,
                                                              child:
                                                              StatefulBuilder(builder: (context,setState){
                                                                return IconButton(onPressed: (){
                                                                  setState(() {
                                                                    cubit.searchResponse!.places![index].isFav= !cubit.searchResponse!.places![index].isFav!;
                                                                    FavoriteCubit.get(context).addFavoritePlaces(cubit.searchResponse!.places![index].id!,HomeCubit.get(context).token!,context.locale.toString(),context);
                                                                  });
                                                                }, icon:  Icon(
                                                                  cubit.searchResponse!.places![index].isFav==false?
                                                                  Icons.favorite_border_rounded:Icons.favorite,color:cubit.searchResponse!.places![index].isFav==false? Colors.white:Colors.red,));
                                                              }),
                                                            ),

                                                          ],
                                                        ),
                                                        verticalSpace(0),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                                                            child: Text(cubit.searchResponse!.places![index].region!,
                                                              style: TextStyles.font14CustomBlack500w.copyWith(
                                                                  fontFamily: AppFontsFamily.fontPoppins
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      )
                                  else
                                    const PlacesShimmerWidget(),
                                  verticalSpace(20),
                                  Text('programs'.tr(), style: TextStyles.font18CustomBlack600Weight),
                                  SizedBox(height: 16.h,),
                                  if(cubit.searchResponse!=null)
                                    if(cubit.searchResponse!.places!.isEmpty)
                                      Center(child: Text('no_data_currently'.tr(), style: TextStyles.font18CustomBlack600Weight.copyWith(color: AppColorLight.customGray)))
                                    else
                                      GridView.builder(
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 9.w,
                                            mainAxisSpacing: 15.h,
                                            mainAxisExtent: 250.h,

                                          ),
                                          itemBuilder: (BuildContext context, int index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(top: 16.0),
                                              child: InkWell(
                                                onTap: (){
                                                  NavigatePages.pushToPage( ProgramDetailsScreen(
                                                    programResponse:cubit.searchResponse!.programs![index],
                                                  ), context);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Colors.grey.shade200,
                                                      boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 2)]
                                                  ),
                                                  child:  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft:  Radius.circular(10)),
                                                            child: CustomSliderWidget(
                                                                height: 120.h,
                                                                image: cubit.searchResponse!.programs![index].images!.map((e) => e.image!).toList()),
                                                          ),
                                                          Positioned(
                                                            top: 10.h,
                                                            right: 10.w,
                                                            child:
                                                            StatefulBuilder(builder: (context,setState){
                                                              return IconButton(onPressed: (){
                                                                setState(() {
                                                                  cubit.searchResponse!.programs![index].isFav=!cubit.searchResponse!.programs![index].isFav!;
                                                                });
                                                                 FavoriteCubit.get(context).addFavoriteProgram(cubit.searchResponse!.places![index].id!,HomeCubit.get(context).token!,context.locale.toString(), context);
                                                              }, icon:  Icon(
                                                                cubit.searchResponse!.programs![index].isFav==false?
                                                                Icons.favorite_border_rounded:Icons.favorite,color:cubit.searchResponse!.programs![index].isFav==false?  Colors.white:Colors.red,));
                                                            }),
                                                          ),
                                                          Positioned(
                                                              bottom: 50.h,
                                                              left: 0,
                                                              right: 20,
                                                              child:Container(
                                                                decoration: const BoxDecoration(
                                                                    color: AppColorLight.customBlack,
                                                                    borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8))
                                                                ),
                                                                width: 350.w,
                                                                height: 25.h,
                                                                child: Center(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(left: 15.0,),
                                                                    child: Text(
                                                                      '3 Days  25 Dec 23 - 28 Dec 23 ',
                                                                      textScaleFactor: ScaleSize.textScaleFactor(context),
                                                                      maxLines: 1,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      style: TextStyles.font10CustomGray500WightPoppins.copyWith(color: Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                          ),
                                                        ],
                                                      ),
                                                      FittedBox(
                                                        child: CustomReligiousProgramWidget(
                                                          programResponse:cubit.searchResponse!.programs![index],
                                                          isHasDes: false,),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );

                                          },
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount:cubit.searchResponse!.programs!.length,
                                          padding: EdgeInsets.symmetric(horizontal: 2.w))
                                  else
                                     PlacesShimmerWidget(height: 250.h,),
                                  verticalSpace(100)
                                ],
                              ):
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    verticalSpace(150),
                                    Image.asset(AppImages.search),
                                    verticalSpace(25),
                                    Text('search_text'.tr(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.font17CustomGray400WightLato
                                          .copyWith(
                                        fontWeight: FontWeight.bold,
                                          color: AppColorLight.customBlack
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );


                    },
                  ),
                )
            ),
          )
      );
  }
}

/*


                                    if(merchantsCubit.merchantsSearchModel!=null){
                                      if(merchantsCubit.merchantsSearchModel!.data!.length==0){
                                        return  Center(child: Text('${getLang(context, 'no_data_mer')}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        ),),);
                                      }
                                      else{
                                        return Expanded(child:
                                        ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: merchantsCubit.merchantsSearchModel!.data!.length,
                                            itemBuilder: (BuildContext context,int index){
                                              return InkWell(
                                                onTap: (){
                                                  merchantsCubit.reStart();
                                                  merchantsCubit.getProductsMerchants(merchantsCubit.merchantsSearchModel!.data![index].id!, context);
                                                  merchantsCubit.getWorksMerchants(merchantsCubit.merchantsSearchModel!.data![index].id!, context);
                                                  merchantsCubit.getAddressMerchants(merchantsCubit.merchantsSearchModel!.data![index].id!, context);
                                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>
                                                      MerchantsDetailsScreen(merchantsModelData:merchantsCubit.merchantsSearchModel!.data![index],)));
                                                },
                                                child: Container(
                                                  width: 100.w,
                                                  height: 70.h,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      Container(
                                                        width:60.w,
                                                        height: 60.h,
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(10),
                                                          child: Image.network(merchantsCubit.merchantsSearchModel!.data![index].logo!,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (BuildContext context,Object error,StackTrace? v){
                                                            return Center(child: CircularProgressIndicator(),);
                                                          },),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(merchantsCubit.merchantsSearchModel!.data![index].name!,
                                                          style: TextStyles.font16BlackColor500WeightTajawal.copyWith(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 18,
                                                            fontFamily: FontConstants.lateefFont,
                                                            color:Colors.black,
                                                          ),
                                                          maxLines: 2,
                                                          textAlign: TextAlign.center,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                        );
                                      }
                                    }else{

                                      return Center(child: CircularProgressIndicator(),);                                    }

                                  },
                                )

                              ],
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          Text('${getLang(context, 'products')}',
                            style: TextStyles.font16BlackColor500WeightTajawal.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              fontFamily: FontConstants.lateefFont,
                              color:Colors.black,
                            ),),
                          SizedBox(height: 15.h,),
                          cubit.searchProductModel!=null?
                          cubit.searchProductModel!.data!.length!=0?
                          GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 9.w,
                                mainAxisSpacing: 15.h,
                                mainAxisExtent: 180.h,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                ProductModelData data2 = cubit.searchProductModel!.data![index];
                                return Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        ProductModelData data = cubit.searchProductModel!.data![index];
                                        List<String> list= [];
                                        for(Images a in data.images!){
                                          list.add(a.image.toString());
                                        }
                                        Navigator.push(context, MaterialPageRoute(builder:
                                            (BuildContext context)=>ProductDetailsScreen(
                                              id: data.id!,
                                              isFav: data.isFav,
                                          title: data.title,
                                          price: data.price.toString() ,
                                          brandName:data.brand!=null?data.brand!.name:'',
                                          width:'${data.width!=null?data.width!.name:''}',
                                          height:'${data.height!=null?data.height!.name:''}',
                                          images: list,
                                          size:'${data.size!=null?data.size!.name:''}',
                                          productStatus: data.productStatus,
                                          description:data.description ,
                                          cartProduct: Cart(
                                              id: data2.id,
                                              productId: data2.id.toString(),
                                              productName: data2.title,
                                              productPrice: data2.price,
                                              description: data2.description,
                                              image: data2.images![0].image,
                                              type: data2.type,
                                              productState: data2.productStatus,
                                              providerId: data2.provider!=null?data2.provider!.id!.toString():'',
                                              count: 1,
                                              productBrand: data2.brand!=null?data2.brand!.name:''),

                                        )));
                                        // NavigationManager.push(Routes.productDetails);
                                      },
                                      child:
                                      CustomProductItemSearch(productModelData: cubit.searchProductModel!.data![index] ,)
                                    ),
                                    Positioned(
                                        top: 8.h,
                                        right: 16.w,
                                        child:
                                        StatefulBuilder(builder: (BuildContext context,void Function(void Function()) setState){
                                          return  data2.isFav==true?
                                          InkWell(
                                            onTap: (){
                                              if(AuthCubit.get(context).token.isNotEmpty){
                                                setState(() {
                                                  data2.isFav=false;
                                                });
                                                FavoriteCubit.get(context).addAndRemoveFavoriteProducts(data2.id.toString(),AuthCubit.get(context).token,context);

                                              }else{
                                                showToast(text: getLang(context, 'Log_in_first'), state: ToastStates.error, context: context);
                                              }
                                            },
                                            child: CircleAvatar(
                                                minRadius: 12.sp,
                                                backgroundColor: whiteColor,
                                                child:
                                                Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                  size: 15.sp,
                                                )
                                            ),
                                          ) :
                                          InkWell(
                                            onTap: (){
                                              if(AuthCubit.get(context).token.isNotEmpty){
                                                setState(() {
                                                  data2.isFav=true;
                                                });
                                                FavoriteCubit.get(context).addAndRemoveFavoriteProducts(data2.id.toString(),AuthCubit.get(context).token,context);
                                              }else{
                                                showToast(text: getLang(context, 'Log_in_first'), state: ToastStates.error, context: context);
                                              }
                                            },
                                            child: CircleAvatar(
                                              minRadius: 12.sp,
                                              backgroundColor: whiteColor,
                                              child:
                                              Icon(
                                                Icons.favorite_border_rounded,
                                                color: Colors.grey,
                                                size: 15.sp,
                                              ),
                                            ),
                                          );
                                        })
                                    ),
                                  ],
                                );
                              },
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: cubit.searchProductModel!.data!.length,
                              padding: EdgeInsets.symmetric(horizontal: 16.w)):
                          Padding(
                            padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.3),
                            child: Center(child: Text(getLang(context, 'no_product_found'),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),),),
                          ) :
                          Padding(
                            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.32),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        ],
                      ):
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 120.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${getLang(context, 'merchants')}',
                                style: TextStyles.font16BlackColor500WeightTajawal.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  fontFamily: FontConstants.lateefFont,
                                  color:Colors.black,
                                ),),
                                Expanded(
                                  child: Center(
                                    child: Text(getLang(context, 'search_no_mer'),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w400,
                                            color: geryTextColor.withOpacity(0.4),
                                            fontFamily: 'Lateef'
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                         SizedBox(height: 30.h,),
                          Text('${getLang(context, 'products')}',
                            style: TextStyles.font16BlackColor500WeightTajawal.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              fontFamily: FontConstants.lateefFont,
                              color:Colors.black,
                            ),),
                          SizedBox(height: 100.h,),
                          Center(
                            child: Text(getLang(context, 'search_no'),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w400,
                                    color: geryTextColor.withOpacity(0.4),
                                    fontFamily: 'Lateef'
                                )
                            ),
                          ),


                        ],
                      ),


                    ],
                  ),
                ),
              ),
            );
          },
        )
 */