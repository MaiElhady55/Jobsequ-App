import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/bloc_observer.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/network/remote/dio_helper.dart';
import 'package:jobsque/core/route/app_router.dart';
import 'package:jobsque/features/applied_job/presentation/view_models/cubit/applied_job_cubit.dart';
import 'package:jobsque/features/apply_job/presentation/view_models/cubit/job_cubit.dart';
import 'package:jobsque/features/create_account/presentation/view_models/cubit/register_cubit.dart';
import 'package:jobsque/features/forget_password/presentation/view_models/cubit/forget_password_cubit.dart';
import 'package:jobsque/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:jobsque/features/home/presentation/view_models/recent_jobs_cubit/recent_jobs_cubit.dart';
import 'package:jobsque/features/home/presentation/view_models/suggested_jobs_cubit/suggested_jobs_cubit_cubit.dart';
import 'package:jobsque/features/home_layout/presentation/view_models/cubit/layout_cubit.dart';
import 'package:jobsque/features/login/presentation/view_models/google_login/google_login_cubit.dart';
import 'package:jobsque/features/login/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:jobsque/features/onboarding/presentation/views/view_models/cubit/onboarding_cubit.dart';
import 'package:jobsque/features/profile/presentation/view_models/cubit/profile_cubit.dart';
import 'package:jobsque/features/saved_job/presentation/view_models/cubit/favourite_cubit.dart';
import 'package:jobsque/features/search/presentation/view_models/cubit/search_cubit.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CachHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => OnboardingCubit(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => GoogleLoginCubit(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
          BlocProvider(
            create: (context) => ForgetPasswordCubit(),
          ),
          BlocProvider(
            create: (context) => LayoutCubit(),
          ),
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
          BlocProvider(
            create: (context) => SuggestedJobsCubit(),
          ),
          BlocProvider(
            create: (context) => RecentJobsCubit(),
          ),
          BlocProvider(
            create: (context) => JobCubit(),
          ),
          BlocProvider(
            create: (context) => AppliedJobCubit(),
          ),
          BlocProvider(
            create: (context) => FavouriteCubit(),
          ),
          BlocProvider(
            create: (context) => ProfileCubit(),
          ),
          BlocProvider(
            create: (context) => SearchCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Jobsque App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'SFProDisplay',
            useMaterial3: true,
          ),
          onGenerateRoute: onGenerateRouter,
        ),
      );
    });
  }
}
