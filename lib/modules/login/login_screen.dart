import 'package:flutter/material.dart';
import '../../layout/clothes_menu.dart';
import 'package:login_screen/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => loginScreenState();
}

class loginScreenState extends State<LoginScreen>{
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool rememberMe = false;
  bool boolColor = false;
  bool isPassword = true;
  bool get isEmail{
    String p = '[a-z0-9!#\$%&\'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&\'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(emailController.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 30.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 115.0,
                  ),
                  child: Image(image: NetworkImage('https://www.pinclipart.com/picdir/big/533-5333028_free-png-mobile-shop-swipe-icon-mobile-shoping.png'),),
                ),
                Text('BuyIt',
                  style: new TextStyle(fontFamily: 'Pacifico',fontSize: 20.0,),
                ),
                SizedBox(height: 25.0,),
                defaultTextField(
                  textEdControl: nameController,
                  hintText: 'Enter Your Name',
                  prefixIcon: Icons.drive_file_rename_outline,
                  validator: (nameController){
                    if(nameController.toString().isEmpty)
                      return 'Name field is required';
                    return null;
                    },
                ),
                SizedBox(height: 10.0,),
                defaultTextField(
                  textEdControl: emailController,
                  textInType: TextInputType.emailAddress,
                  hintText: 'Enter Your Email',
                  prefixIcon: Icons.email,
                  validator: (emailController){
                    if(emailController.toString().isEmpty)
                      return 'Your Email is empty!';
                    else if(!isEmail)
                      return 'Check Your Email';
                    return null;
                    },
                ),
                SizedBox(height: 10.0,),
                defaultTextField(
                  textEdControl: passwordController,
                  hintText: 'Enter Your password',
                  prefixIcon: Icons.lock,
                  textInType: TextInputType.visiblePassword,
                  validator: (passwordController){
                    if(passwordController.toString().isEmpty)
                      return 'Your password is empty!';
                    else if(passwordController.toString().length<=6)
                      return 'Password must be greater than 6 characters';
                    return null;
                  },
                  suffix: isPassword? Icons.visibility :Icons.visibility_off,
                  isPassword: isPassword,
                  suffixPressed: (){
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                ),
                Row(
                  children: [
                    Checkbox(value: rememberMe,
                      onChanged: (value){
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                      activeColor: Colors.amberAccent,
                    ),
                    Text('Remember Me',style: TextStyle(),),
                  ],
                ),
                SizedBox(height: 10.0,),
                defaultButton(
                    function: (){
                      if(formKey.currentState!.validate()){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>ClothesMenu()),
                        );
                      }
                    },
                    text: 'login',
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?',style: TextStyle(color: Colors.white),),
                    TextButton(onPressed: (){}, child: Text('Sign Up',style: TextStyle(color: Colors.black87),),),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      child: defaultButton(
                        function: (){},
                        text: 'Admin',
                        background: rememberMe ? Colors.grey : Colors.black87,
                        textColor: rememberMe ? Colors.black87 : Colors.white,
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child: defaultButton(
                        function: (){},
                        text: 'User',
                        background: rememberMe ? Colors.black87: Colors.grey,
                        textColor: rememberMe ? Colors.white : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.amber,
    );
  }
}