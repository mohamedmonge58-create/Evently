import 'package:evently/services/snack_bar_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {

 static Future <bool> createAccount(String emailAddress, String password,)async{
  try {
    final credential = await FirebaseAuth.instance.
    createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    return Future.value(true);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {

      SnackBarServices.showError('The password provided is too weak.');
      return Future.value(false);

    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      SnackBarServices.showError('The account already exists for that email.');
      return Future.value(false);

    }
    return Future.value(false);

  } catch (e) {
    SnackBarServices.showError('SomeThing Went Wrong.');
    return Future.value(false);

  }
}





 static Future <bool> signInWithAccount(String emailAddress,String password,)async{

  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password
    );
    return Future.value(true);

  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      SnackBarServices.showError('No user found for that email.');
      return Future.value(false);

    } else if (e.code == 'invalid.credentials') {
      SnackBarServices.showError('Wrong password provided for that user.');
      return Future.value(false);
    }
    return Future.value(false);

  } catch (e) {
        SnackBarServices.showError(

            'SomeThing Went Wrong.');
        return Future.value(false);
      }
  }

}

