import 'package:flutter/material.dart';
//i seperate it because i will use it a lot of times
class CustumFormTextField extends StatelessWidget {
   CustumFormTextField({this.HentText,this.textInputType,this.onChanged,this.obscureText= false});

   String? HentText;
   Function(String)? onChanged;//i can't use voidcallback here yet because i don't need void fun
   bool? obscureText;
   TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(//TextFormField i use instead of TextField because i want to use inside the form
          keyboardType: textInputType,
           style: TextStyle(color: Colors.white),//here i can change the color of the text entered by the user.
           obscureText: obscureText!,//to hide the password and ! because it must take a value
          //  validator: (value) {//value is an empty string '' but not null
          //    if (value!.isEmpty) {
          //      return 'field is requied';
          //    }
          //  }, //here i don't need validation because the user may don't want to enter any thing inside update
           onChanged: onChanged,
           decoration: InputDecoration(
            hintText: HentText,
            hintStyle: TextStyle(
              //color: Colors.white
            ),
            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(
            //     color: Colors.red 
            //   ),
            // ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                //color: Colors.white 
                
              ),
              borderRadius: BorderRadius.circular(16)
            ),
           ),
           );
  }
}