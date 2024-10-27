import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/shared/components/components.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey =GlobalKey<FormState>();
  bool isobscure=true;
  IconData icon= Icons.remove_red_eye;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 500,
        shadowColor: Colors.black,
        actions: const [
          Icon(Icons.notifications_active),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 50,
                ),
                defultTextField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  preicon: Icons.email,
                  label: "Email",
                  validate: (value){
                    if(value!.isEmpty){
                      return "Email is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                defultTextField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  posticon: icon,
                  preicon: Icons.lock,
                  obscure:isobscure,
                  funicon:(){
                  setState(() {
                    isobscure=!isobscure;
                    if(icon== Icons.remove_red_eye){
                      icon= Icons.remove_red_eye_outlined;
                    }
                    else{
                      icon=Icons.remove_red_eye;
                    }
                  });
                  },
                  label: "Password",
                  validate: (value){
                    if(value!.isEmpty){
                      return "Password is required";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                defultButton(
                    function: (){
                      if(formKey.currentState!.validate()){
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    text: "LOGIN"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(onPressed: (){},
                        child: Text("Register")
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




