import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:meta/meta.dart';

part 'facebook_login_state.dart';

class FacebookLoginCubit extends Cubit<FacebookLoginState> {
  FacebookLoginCubit() : super(FacebookLoginInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();

  void loginWithFacebook() async {
    FacebookLoginResult result =
        await _facebookLogin.logIn(customPermissions: ['email']);
    final accessToken = result.accessToken?.token;

    if (result.status == FacebookLoginStatus.success) {
      final faceCredential = FacebookAuthProvider.credential(accessToken ?? '');
      // UserCredential userCredential =
      await _auth.signInWithCredential(faceCredential);
    }
  }
}
