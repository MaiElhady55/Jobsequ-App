import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/features/applied_job/presentation/views/applied_job_screen.dart';
import 'package:jobsque/features/home/presentation/views/home_screen.dart';
import 'package:jobsque/features/message_screen/presentation/views/messages_screen.dart';
import 'package:jobsque/features/profile/presentation/views/complete_profile_screen.dart';
import 'package:jobsque/features/profile/presentation/views/profile_screen.dart';
import 'package:jobsque/features/saved_job/presentation/views/saved_job_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> pages = const [
    HomeScreen(),
    MessagesScreen(),
    AppliedJobScreen(),
    SavedJobScreen(), //SavedJobEmptyScreen
    CompleteProfileScreen(),
  ];

  void getCompleteProfile() {
    if (CachHelper.getData(key: MySharedKeys.completeProfile.toString()) ==
        'true') {
      pages = const [
        HomeScreen(),
        MessagesScreen(),
        AppliedJobScreen(),
        SavedJobScreen(), //SavedJobEmptyScreen
        ProfileScreen()
      ];
    } else {
      pages = pages = const [
        HomeScreen(),
        MessagesScreen(),
        AppliedJobScreen(),
        SavedJobScreen(), //SavedJobEmptyScreen
        CompleteProfileScreen(),
      ];
    }
  }

  List<String> titles = ['Home', 'Messages', 'Applied', 'Saved', 'Profile'];
  int currentIndex = 0;
  void onPageChange(int index) {
    currentIndex = index;
    emit(ChangeBottomNacBarState());
  }
}
