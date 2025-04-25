import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crypt/crypt.dart';
import 'package:order_management_app/modules/common_dialogs.dart';
import 'package:order_management_app/modules/data.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String accountType='basic';
  bool passwordObscure=true;
  bool confirmPasswordObscure=true;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  
  Future<void> signUp() async {
    try{
      var result = await appData.into(appData.user).insert(UserCompanion.insert(
        firstName: userNameController.text,
        email: emailController.text,
        passKey: Crypt.sha256(passwordController.text).toString(),
      ));
      debugPrint(result.toString());
    
      showDialog(context: context,
      builder: (BuildContext context){
        return AlertDialog(
          content: const Text('Account created sucessfully!',
            style: TextStyle(
              color: Colors.green,
              fontSize: 18
            )
          ),
          actions: [
            ElevatedButton(
              onPressed: (){
              Navigator.pop(context);
            },
            child: const Text('OK',
             style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold
             )
            )
            )            
          ]
        );
      });
    }catch(exception){
      print('Exception\n\n');
      debugPrint(exception.toString());
      print('\n\n');
      dialog.errorMessage('Failed!Check internet connection and try again.', context);
    }
    return ;
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Form(
        key: loginFormKey,
        child: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: ListView(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            children: <Widget>[
              const Divider(
                color : Colors.deepPurple,
                height: 25
              ),
              TextFormField(
                controller: userNameController,
                style: const TextStyle(fontSize: 20,color: Colors.black),
                decoration: const InputDecoration(
                  labelText: ('User Name'),
                  labelStyle: TextStyle(fontSize:20, color: Colors.black),
                  hintText:  ('Enter preferred name'),
                  icon: Icon(
                    Icons.contact_page,
                    color: Colors.deepPurple,
                    size: 50
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
                ),
                keyboardType: TextInputType.emailAddress,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15)
                ],
                onChanged:(String val){},
                //onSaved:(String val){},
                //validator: (String val){}
              ),
              const Divider(
                color: Colors.deepPurple,
                height: 15
              ),
              TextFormField(
                controller: emailController,
                style: const TextStyle(fontSize: 20,color: Colors.black),
                decoration: const InputDecoration(
                  labelText: ('Email Address'),
                  labelStyle: TextStyle(fontSize:20, color: Colors.black),
                  hintText:  ('you@gmail.com'),
                  icon: Icon(
                    Icons.email_rounded,
                    color: Colors.deepPurple,
                    size: 50
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
                ),
                keyboardType: TextInputType.emailAddress,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(40),
                ],
                onChanged:(String val){},
                //onSaved:(String val){},
                //validator: (String val){}
              ),
              const Divider(
                color: Colors.deepPurple,
                height: 15
              ),
              TextFormField(
                controller: passwordController,
                obscureText: passwordObscure,
                style: const TextStyle(fontSize: 20,color: Colors.black),
                decoration: InputDecoration(
                  labelText: ('Password'),
                  labelStyle: const TextStyle(fontSize:20, color: Colors.black),
                  hintText:  ('*****'),
                  icon: const Icon(
                    Icons.password_rounded,
                    color: Colors.deepPurple,
                    size: 50
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.remove_red_eye),
                    onPressed: (){
                      setState(() {
                        if(passwordObscure==false){
                          passwordObscure=true;
                        }else{
                          passwordObscure=false;
                        }                        
                      });
                    }
                  ),
                  border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
                ),
                keyboardType: TextInputType.emailAddress,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15)
                ],
                onChanged:(String val){},
                //onSaved:(String val){},
                //validator: (String val){}
              ),
              const Divider(
                color: Colors.deepPurple,
                height: 15
              ),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: confirmPasswordObscure,
                style: const TextStyle(fontSize: 20,color: Colors.black),
                decoration: InputDecoration(
                  labelText: ('Confirm Password'),
                  labelStyle: const TextStyle(fontSize:20, color: Colors.black),
                  hintText:  ('*****'),
                  icon: const Icon(
                    Icons.password_rounded,
                    color: Colors.deepPurple,
                    size: 50
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.remove_red_eye),
                    onPressed: (){
                      setState(() {
                        if(confirmPasswordObscure==false){
                          confirmPasswordObscure=true;
                        }else{
                          confirmPasswordObscure=false;
                        }                        
                      });
                    }
                  ),
                  border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
                ),
                keyboardType: TextInputType.emailAddress,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15)
                ],
                onChanged:(String val){},
                //onSaved:(String val){},
                //validator: (String val){}
              ),
              const Divider(
                color: Colors.deepPurple,
                height: 15.0,
              ),
              Column(
                children: [
                  const Text(
                    'Select Type of Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Colors.black
                    )
                  ), 
                  Row(
                    children: [
                      FormField(
                        builder: (FormFieldState<String> state){
                          return Radio<String>(
                            value: 'basic',
                            groupValue: accountType,
                            onChanged: (val){
                              setState(() {
                              accountType=val.toString();
                              });
                            },
                          );
                        },
                      ),                      
                      const Text(
                        'Basic(for customers)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color: Colors.black
                        )
                      ), 
                    ]
                  ),
                  Row(
                    children: [
                      FormField(
                        builder: (FormFieldState<String> state){
                          return Radio<String>(
                            value: 'premium',
                            groupValue: accountType,
                            onChanged: (val){
                              setState(() {
                              accountType=val.toString();
                              });
                            },
                          );
                        }
                      ),                      
                      const Text(
                        'Premium(for vendors)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color: Colors.black
                        )
                      ), 
                    ]
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: (){
                  setState((){
                    signUp();
                  });
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.white
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
