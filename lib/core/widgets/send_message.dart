
import 'package:flutter/material.dart';
import 'package:menophol/core/constants/assets_constants.dart';
import 'package:menophol/core/constants/color_constants.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(onTap:(){} ,




      style: const TextStyle(
          fontFamily: "PoppinsRegular",
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Colors.black),
      decoration: InputDecoration(

        filled: true,

        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        prefixIconConstraints: BoxConstraints(
          minWidth: 15, // Set minimum width for the icon
          minHeight: 15, // Set minimum height for the icon
        ),

        suffixIcon: InkWell(
            onTap: (){},

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorConstants.darkPrimaryColor
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(Assets.sendBtn,height: 10,width: 10,),
                ),
              ),
            )),
        hintText: "Write your Message..",
        hintStyle: TextStyle(
            fontFamily: "PoppinsRegular",
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color:Colors.grey),
        counterStyle: const TextStyle(
          height: double.minPositive,
        ),
        counterText: "",
        fillColor:Colors.white ,
        border: OutlineInputBorder(
          borderSide:  BorderSide(color: Colors.grey),
          borderRadius:
          BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius:
          BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.grey),
          borderRadius:
          BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
