import 'package:firebase_auth/firebase_auth.dart';

class Authentication{
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? currentFirebaseUser;

  static Future<dynamic> signUp({required String email, required String pass}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pass);
      print('auth登録完了');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('指定したメールアドレスは登録済みです');
      } else if (e.code == 'invalid-email') {
        print('メールアドレスのフォーマットが正しくありません');
      } else if (e.code == 'operation-not-allowed') {
        print('指定したメールアドレス・パスワードは現在使用できません');
      } else if (e.code == 'weak-password') {
        print('パスワードは６文字以上にしてください');
      }
      return false;
    }
  }

  static Future<dynamic> emailSignIn({required String email, required String pass}) async {
    try {
      final UserCredential _result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
      currentFirebaseUser = _result.user;
      print('サインイン完了');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-disabled') {
        print('そのメールアドレスは利用できません');
      } else if (e.code == 'invalid-email') {
        print('メールアドレスのフォーマットが正しくありません');
      } else if (e.code == 'user-not-found') {
        print('ユーザーが見つかりません');
      } else if (e.code == 'wrong-password') {
        print('パスワードが違います');
      }else{
        print('ログインエラー');
      }
    return false;
  }
}

}