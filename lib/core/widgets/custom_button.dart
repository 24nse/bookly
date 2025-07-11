import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.backgroundColor, required this.textColor,  this.borderRadius,required this.text,this.fontSize, this.onPressed });
final Color backgroundColor;
final Color textColor;
final BorderRadius? borderRadius;
final String text;
final double? fontSize;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed:  onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor, 
           shape: RoundedRectangleBorder(
            borderRadius: borderRadius??BorderRadius.circular(12)
           )
        ),
        child: CustomText(text,style: Styles.textStyle18.copyWith(
          color: textColor,
          fontWeight: FontWeight.w900
        ),) ,
      ),
    );
  }
}