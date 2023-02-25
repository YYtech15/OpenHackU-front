import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils/authentication.dart';
import 'package:myapp/utils/db/db_user.dart';
import 'package:myapp/view/user/sample.dart';
import 'package:myapp/view/user/sample_register_user.dart';

class SampleLoginPage extends StatefulWidget {
  const SampleLoginPage({Key? key}) : super(key: key);

  @override
  State<SampleLoginPage> createState() => _SampleLoginPageState();
}

class _SampleLoginPageState extends State<SampleLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:const Text('StudyCamera'),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: 220,
                    child: Container(
                      width: 300,
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(hintText: 'メールアドレス', hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                SizedBox(
                  width: 220,
                  child: Container(
                    width: 300,
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(hintText: 'パスワード', hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 220,
                  height: 80,
                  child:
                  ElevatedButton(
                      onPressed: () async{
                        var result = await Authentication.emailSignIn(email: emailController.text, pass: passwordController.text);
                        if(result is UserCredential)
                        {
                          var resultGet = await DatabaseUser.getUser(result.user!.uid);
                          if(resultGet == true){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()
                            ));
                          }
                        }
                      },
                      style:
                      ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                      child: const Text(
                        'ログイン',
                        style: TextStyle(color: Colors.white),
                      )
                  ),
                ),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      children: [
                        const TextSpan(text:'アカウントを作成していない方は'),
                        TextSpan(
                            text: 'こちら',
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SampleRegisterAccount()));
                              }
                        ),
                      ]
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



