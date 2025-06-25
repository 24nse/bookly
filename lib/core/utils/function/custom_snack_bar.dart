import 'package:flutter/material.dart';
import 'package:bookly/core/widgets/custom_text.dart';

void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomText(text),));
}

