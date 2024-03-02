import 'package:flutter/material.dart';
import 'package:jobsque/core/app_widgets/job_status_item.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/features/home/presentation/views/widgets/custom_appbar_home.dart';
import 'package:jobsque/features/home/presentation/views/widgets/custom_row_title.dart';
import 'package:jobsque/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:jobsque/features/home/presentation/views/widgets/recent_job_listview.dart';
import 'package:jobsque/features/home/presentation/views/widgets/suggested_job_listview.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              CustomAppBarHome(),
              CustomSearchBar(
                controller: searchController,
                hintText: 'Search....',
                keyboardType: TextInputType.none,
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.searchScreen);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              const JobStatusItem(
                title: 'Twitter',
                subTitle: 'Waiting to be selected by the twitter team',
                isAccepted: true,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomRowTitle(title: 'Suggested Job', function: () {}),
              SuggestedJobListView(),
              CustomRowTitle(title: 'Recent Job', function: () {}),
              RecentJobListView(),
            ],
          ),
        ),
      ),
    );
  }
}
