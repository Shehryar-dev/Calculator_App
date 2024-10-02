import 'package:flutter/material.dart';



class button  extends StatelessWidget {
  final String title;
  final CallbackAction;
  final Color bgColor;
   const button ({super.key, this.title = '', this.CallbackAction,  this.bgColor =const Color(0xffa5a5a5)});

  @override
  Widget build(BuildContext context) {
     return InkWell(
       onTap: CallbackAction,
       child: Padding(
         padding: const  EdgeInsets.symmetric(vertical: 12.0),
         child: Container(
           alignment: Alignment.center,
           width: 80,
           decoration: BoxDecoration(
             color: bgColor,
             shape: BoxShape.circle
           ),
           child:Text(title,style:const TextStyle(color: Color(0xffFFFFFF),fontSize: 20,fontWeight: FontWeight.bold),),
         ),
       ),
     );
  }
}
