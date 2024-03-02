import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/shimmer/shimmer_recent_job.dart';
import 'package:jobsque/features/home/presentation/views/widgets/recent_job_listview_item.dart';
import 'package:jobsque/features/notification/presentation/views/widgets/custom_header.dart';
import 'package:jobsque/features/search/presentation/view_models/cubit/search_cubit.dart';
import 'package:jobsque/features/search/presentation/views/search_screen_not_found.dart';
import 'package:jobsque/features/search/presentation/views/widgets/filter_body.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search_filter_drop_down.dart';

class SearchScreenResult extends StatefulWidget {
  const SearchScreenResult({super.key});

  @override
  State<SearchScreenResult> createState() => _SearchScreenResultState();
}

class _SearchScreenResultState extends State<SearchScreenResult> {
  late SearchCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = SearchCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              /// Filteration Setting
              Builder(builder: (ctx) {
                return IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    onPressed: () {
                      Scaffold.of(ctx).showBottomSheet<void>(
                        (BuildContext context) => const FilterBody(),
                      );
                    },
                    icon: const Icon(
                      Iconsax.setting_4,
                      size: 24.0,
                    ));
              }),
              const FilterDropDownOption('Remote', isSelected: true),
              const FilterDropDownOption('Full Time', isSelected: true),
              const FilterDropDownOption('Post date'),
              const FilterDropDownOption('Experience level'),
            ],
          ),
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchEmpty) {
              return const SearchScreenNotFound();
            }
            if (state is SearchLoaded) {
              return Column(
                children: [
                  CustomHeader('Featuring ${cubit.foundResults.length} jobs'),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => RecentJobListViewItem(
                              jobData: cubit.foundResults[index],
                            ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: cubit.foundResults.length),
                  ),
                ],
              );
            }
            return const Padding(
              padding: EdgeInsets.all(24.0),
              child: ShimmerRecentlyListView(),
            );
          },
        )
      ],
    );
  }
}
