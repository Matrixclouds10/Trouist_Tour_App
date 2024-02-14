import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';

class CustomMoreImage extends StatelessWidget {
  const CustomMoreImage({super.key});
  @override
  Widget build(BuildContext context) {
    MoreCubit cubit =MoreCubit.get(context);
    return BlocConsumer<MoreCubit, DataState>(
      listener: (context, state) {},
      builder: (context, state) {
        return
          cubit.profileResponse!=null?
          CircleAvatar(
          radius: 70,
          backgroundImage:
          NetworkImage(cubit.profileResponse!.image!)):
          const Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
