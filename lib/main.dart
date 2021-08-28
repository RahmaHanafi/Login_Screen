import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => loginScreenState();
}

class loginScreenState extends State<LoginScreen>{
  var nameController = TextEditingController();
  bool remember_me = false;
  bool bool_color = false;

  String get txt{
    if(nameController.text=="") {
      bool_color = false;
      return "* Name Field is required";
    }
    else{
      bool_color=true;
      return "Hello "+nameController.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              SizedBox(height: 50.0,),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 115.0,
                ),
                child: Image(image: NetworkImage('https://www.pinclipart.com/picdir/big/533-5333028_free-png-mobile-shop-swipe-icon-mobile-shoping.png'),),
              ),
              Text('BuyIt',
                style: new TextStyle(fontFamily: 'Pacifico',fontSize: 20.0,),
              ),
              SizedBox(height: 50.0,),
              Container(
                height: 40.0,
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: Colors.white70, filled: true,
                    hintText: 'Enter Your Name',
                    hintStyle: TextStyle(color: Colors.black54,fontSize: 14.0),
                    prefixIcon: Icon(Icons.drive_file_rename_outline,color: Colors.amber,size: 20.0,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20),),
                      borderSide: BorderSide(width: 1,color: Colors.white70,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 40.0,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white70, filled: true,
                    hintText: 'Enter Your email',
                    hintStyle: TextStyle(color: Colors.black54,fontSize: 14.0,),
                    prefixIcon: Icon(Icons.email,color: Colors.amber,size: 20.0,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(width: 1,color: Colors.white70,),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 40.0,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white70, filled: true,
                    hintText: 'Enter Your password',
                    hintStyle: TextStyle(color: Colors.black54,fontSize: 14.0,),
                    prefixIcon: Icon(Icons.lock,color: Colors.amber,size: 20.0,),
                    suffixIcon: Icon(Icons.remove_red_eye,color: Colors.amber,size: 20.0,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(width: 1,color: Colors.white70,),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              ),
              Row(
                children: [
                  Checkbox(value: remember_me,
                      onChanged: (value){
                    setState(() {
                      remember_me = value!;
                    });
                    },
                    activeColor: Colors.amberAccent,
                  ),
                  Text('Remember Me',style: TextStyle(),),
                ],
              ),
              SizedBox(height: 10.0,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(15.0),
                ),
                height: 30.0,
                width: 140.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context, builder: (context)
                    {
                      return AlertDialog(
                        content: Text(txt,
                            style: bool_color? TextStyle(color: Colors.indigo,
                                fontFamily: 'Pacifico',
                                fontSize: 25.0)
                                : TextStyle(color: Colors.red,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                      );
                    },);
                  },
                  child: Text('Login', style: TextStyle(color: Colors.white,),),
                  color: Colors.black87,
                ),
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15.0),
                      ),
                      height: 30.0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text('Admin',
                           style: remember_me ?TextStyle(color: Colors.black87,):TextStyle(color: Colors.white,)),
                        style: ElevatedButton.styleFrom(
                          primary: remember_me ? Colors.grey : Colors.black87, // This is what you need!
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15.0),
                      ),
                      height: 30.0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text('User',
                            style: remember_me ?TextStyle(color: Colors.white,):TextStyle(color: Colors.black87,)),
                        style: ElevatedButton.styleFrom(
                          primary: remember_me ? Colors.black87 : Colors.grey, // This is what you need!
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.amber,
    );
  }
}