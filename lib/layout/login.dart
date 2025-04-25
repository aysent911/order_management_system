import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:order_management_app/modules/common_dialogs.dart';
import 'package:order_management_app/modules/data.dart';
import 'package:order_management_app/layout/stock.dart';

String userName = '';
String address ='';
String contact = '';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _passwordObscure=true;
  bool _loginSuccessful =false;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  
  Future<int> login() async {
    try{
      var result = await appData.select(appData.user).get();
      debugPrint(result.toString());
      //execute(
// 'SELECT address, contact FROM user_details WHERE user_name=:usr AND pass=:pass;',
//         {'usr':userNameController.text, 'pass':passwordController.text});
//       if(sqlResult.numOfRows>0){
//         for(var row in sqlResult.rows){
//         //debugPrint(row.assoc().toString());
//           userName=userNameController.text;
//           address=row.colAt(0).toString();
//           contact=row.colAt(1).toString();
//           loginSuccessful = true;
//         }
//       }else{
//         loginSuccessful = false;
//       }      
//       await conn.close();
    }catch(exception){
      return -1;
    }
    return 0;
  }
  Future<void> loadStockList() async{
    // final conn= await sqlConn.sqlConnect();
    // try{
    //   await conn.connect();
    //   var sqlResult = await conn.execute(
    //   'SELECT hotel_name,category,name,description,price,qty,image FROM stock_details;',
    //     {});
    //   if(sqlResult.numOfRows>0){
    //     stockList.clear();
    //     for(var row in sqlResult.rows){//debugPrint(row.assoc().toString());
    //       stockList.add(stock(hotelName:row.colAt(0).toString(),
    //       category:row.colAt(1).toString(),name:row.colAt(2).toString(),
    //       description:row.colAt(3).toString(),
    //       price:int.parse(row.colAt(4).toString()),
    //     qty:int.parse(row.colAt(5).toString()),image:row.colAt(4).toString()));
    //     }
    //     //for(var i in stockList){debugPrint(i.name.toString());}
    //   }else{
    //   }      
    //   await conn.close();
    // }catch(exception){
    //   await conn.close();
    // }
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
        child: Align(
          alignment: Alignment.center, 
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: ListView(
            shrinkWrap: true,
            //together with ALign/Center it vertically centers the listview
            scrollDirection: Axis.vertical,
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
              Center(
                child: const Text(
                  'boldplus-OMS',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                height: 70,
                color: Colors.white,
              ),
              const Divider(
                height: 30,
              ),
              const Text(
                ' Login to continue',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                  )
                ),
              const Divider(
                height: 15,
                color: Colors.white
              ),
              TextFormField(
                controller: _userNameController,
                style: const TextStyle(fontSize: 20,color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'User Email',
                  labelStyle: TextStyle(fontSize:20, color: Colors.black),
                  hintText:  'user@email.com',
                  icon: Icon(
                    Icons.account_circle_sharp,
                    color: Colors.deepPurple,
                    size: 25
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
                height: 15,
                color: Colors.white,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: _passwordObscure,
                style: const TextStyle(fontSize: 20,color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(fontSize:20, color: Colors.black),
                  hintText:  '**********',
                  icon: const Icon(
                    Icons.key,
                    color: Colors.deepPurple,
                    size: 25
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.remove_red_eye),
                    onPressed: (){
                      setState(() {
                        if(_passwordObscure==false){
                          _passwordObscure=true;
                        }else{
                          _passwordObscure=false;
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
                height: 15,
                color: Colors.white,
              ),
            //Center(
              //horizontally center
              //child: 
              ElevatedButton(
                onPressed: () async{
                  int error=await login();//use await to get a Future<>
                  setState((){
                    if(error==-1){                        
    dialog.errorMessage('Failed!Check internet connection and try again.',
    context);
                    }else if(_loginSuccessful){
                      loadStockList();
                      _userNameController.clear();
                      _passwordController.clear();
                      Navigator.pushNamed(context,"/stock");
                    }else{
    dialog.errorMessage('Account not found! Please SignUp for an account.',
    context);
                    }                  
                  });
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStateProperty<Color>.fromMap(<WidgetStatesConstraint, Color>{
                    WidgetState.focused: Colors.blueAccent,
                    WidgetState.pressed: Colors.white,
                    WidgetState.any: Colors.deepPurple,
                  }),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.white
                  )
                ),
              ),
            //),
              const Divider(
                height: 30,
              ),
              const Text(
                ' First time?',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                  )
                ),
            //Center(
              //child: 
              ElevatedButton(
                onPressed: (){
                  setState((){
                    Navigator.pushNamed(context,"/sign_up");
                  });
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStateProperty<Color>.fromMap(<WidgetStatesConstraint, Color>{
                    WidgetState.focused: Colors.blueAccent,
                    WidgetState.pressed: Colors.white,
                    WidgetState.any: Colors.deepPurple,
                  }),
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.white
                  )
                ),
              ),
            //),            
            ],
          ),
        ),
      ),
    );
  }
}
