import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:flutter/material.dart';


final token = CachHelper.getData(key: MySharedKeys.token.toString());
final onBoarding = CachHelper.getData(key: MySharedKeys.onboarding.toString());
final rememberMe = CachHelper.getData(key: MySharedKeys.rememberMe.toString());



final scaffoldKey= GlobalKey<ScaffoldState>();
final formKey= GlobalKey<FormState>();

var nameController= TextEditingController();
//var myCountry= CountryCode(name: "EG",dialCode: "+20");

//for apply job
String? userId="";

//apply job
TextEditingController usernameController=TextEditingController();
TextEditingController emailController=TextEditingController();
TextEditingController phoneController=TextEditingController();
