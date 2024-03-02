import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'google_login_state.dart';

class GoogleLoginCubit extends Cubit<GoogleLoginState> {
  GoogleLoginCubit() : super(GoogleLoginInitial());
  static GoogleLoginCubit get(context) => BlocProvider.of(context);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> loginWithGoogle() async {
    emit(GoogleLoginLoadingState());
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication?.idToken,
          accessToken: googleSignInAuthentication?.accessToken);
      UserCredential userCredential =
          await _auth.signInWithCredential(authCredential);
      // Use the user object for further operations or navigate to a new screen.
      User? user = await userCredential.user;
      print('Emmaail ${user?.email}');
      emit(GoogleLoginSuccessState());
    } catch (e) {
      emit(GoogleLoginFailureState(errMessage: e.toString()));
    }
  }
}
