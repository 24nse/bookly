import 'package:bookly/core/utils/function/launch_url.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/data/models/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';  
class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookEntity bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child:  Row(
        children: [
          Expanded(child: CustomButton(  text:"Free",backgroundColor:  Colors.white,textColor: Colors.black,borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),)),
        Expanded(child: CustomButton(onPressed: (){
         launchCustomUrl(context, bookModel.previewLink);
        },text: getText(bookModel),fontSize: 16, backgroundColor:const Color(0xffEF8262),textColor:  Colors.black,borderRadius :const BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16)),))
      
        ],
      ),
    );
  }
  
 String getText(BookEntity bookModel) {
  if(bookModel.previewLink==null){
    return 'Not Avaliable';
  }
  else{
    return "Preview";
  }
 }
}