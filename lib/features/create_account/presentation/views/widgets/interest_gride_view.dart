import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/features/create_account/presentation/view_models/cubit/register_cubit.dart';
import 'package:jobsque/features/create_account/presentation/views/widgets/interest_gride_view_item.dart';
import 'package:sizer/sizer.dart';

class IntresetGrideView extends StatefulWidget {
  const IntresetGrideView({
    super.key,
  });

  @override
  State<IntresetGrideView> createState() => _IntresetGrideViewState();
}

class _IntresetGrideViewState extends State<IntresetGrideView> {
  late RegisterCubit cubit;

  @override
  void initState() {
    cubit = RegisterCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List workTypeList = [
      ["UI/UX Designer", Iconsax.bezier],
      ["Illustrator Designer", Iconsax.pen_tool],
      ["Developer", Iconsax.code],
      ["Management", Iconsax.graph],
      ["Information Technology", Iconsax.monitor_mobbile],
      ["Research and Analytics", Iconsax.cloud_add],
    ];
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.1,
              crossAxisCount: 2,
              crossAxisSpacing: 1.4.w,
              mainAxisSpacing: 2.h,
            ),
            itemCount: workTypeList.length,
            itemBuilder: (BuildContext ctx, index) {
              return IntresetGrideViewItem(
                icon: workTypeList[index][1],
                text: workTypeList[index][0],
                onTap: () {},
              );
              //CustomWorkContainer(
              //  text: workTypeList[index][0], icon: workTypeList[index][1]);
            });
      },
    );
  }
}
