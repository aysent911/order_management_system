import 'package:flutter/material.dart';
class Dialog{
  void errorMessage(String message, BuildContext buildContext){
    showDialog(
      context: buildContext,
      builder: (BuildContext context){
        return AlertDialog(
          content: Text('$message',
            style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.red
                )
          ),
          actions: [
            TextButton(
              child: const Text('OK',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                )
              ),
              onPressed: (){
                Navigator.pop(context);
              }
            ),
            TextButton(
              child: const Text('Cancel',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                )
              ),
              onPressed: (){
                Navigator.pop(context);
              }
            )
          ]
        );
      }
    );
  }
}
Dialog dialog = Dialog();
