import 'package:flutter/material.dart';
import 'package:login_screen/models/clothes/clothes_model.dart';

Widget defaultButton({
  double width =100,
  double height = 30,
  Color background = Colors.black87,
  Color textColor =Colors.white,
  required function,
  required String text,
  }) => Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadiusDirectional.circular(15.0),
  ),
  height: height,
  width: width,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  child: MaterialButton(
    onPressed: function,
    child: Text(text, style: TextStyle(color: textColor,),),
    color: background,
  ),
);

Widget defaultTextField ({
  required TextEditingController textEdControl,
  TextInputType textInType = TextInputType.text,
  bool isFillfed = true,
  Color fillColor = Colors.white70,
  required String hintText,
  required prefixIcon,
  Color prefixIconColor = Colors.amber,
  double prefixIconSize = 20,
  required validator,
  bool isPassword =false,
  suffix,
  suffixPressed,
  }) => Container(
    child: TextFormField(
      controller: textEdControl,
      keyboardType: textInType,
      obscureText: isPassword,
      decoration: InputDecoration(
        fillColor: fillColor, filled: isFillfed,
        hintText: hintText,
        suffixIcon: suffix != null? IconButton(icon: Icon(suffix,color: Colors.amber,size: prefixIconSize,),onPressed: suffixPressed,):null,
        prefixIcon: Icon(prefixIcon,color: prefixIconColor,size: prefixIconSize,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20),),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20),),
          borderSide: BorderSide(width: 1,color: Colors.white,),
        ),
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20),),
          borderSide: BorderSide(width: 1,color: Colors.white,),
        ),
        ),
      validator: validator,
  ),
);

Widget defaultIconButton({
  required iconButton,
  Color iconColor = Colors.black87,
  required onPressedFunction,
    })=>IconButton(icon: Icon(iconButton,color: iconColor,size: 20,),
  onPressed: onPressedFunction,);

Widget defaultTshirts(TShirts shirt)=> Stack(
  alignment: Alignment.bottomLeft,
  children: [
    Image(image: NetworkImage('${shirt.image}'),
      fit: BoxFit.cover,
      width: double.maxFinite,
    ),
    Container(
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        color: Colors.white.withOpacity(0.8),
        child: Column(
          children: [
            Text('${shirt.nameModel}',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,),),
            SizedBox(height: 5.0,),
            Text('\$${shirt.price}',style: TextStyle(fontSize: 13.0,color: Colors.black87),),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    ],
);

Widget defaultJackets(Jackets jacket)=> Stack(
  alignment: Alignment.bottomLeft,
  children: [
    Image(image: NetworkImage('${jacket.image}'),
      fit: BoxFit.cover,
      width: double.maxFinite,
    ),
    Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      color: Colors.white.withOpacity(0.8),
      child: Column(
        children: [
          Text('${jacket.jacketModel}',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,),),
          SizedBox(height: 5.0,),
          Text('\$${jacket.price}',style: TextStyle(fontSize: 13.0,color: Colors.black87),),
        ],
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    ),
  ],
);

Widget defaultGridViewList({
  required list,
  required itembuild,
})=>Container(
    padding: EdgeInsets.all(12.0),
    child: GridView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
      ),
      itemBuilder: itembuild,
    ),
);