import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class SeatItem extends StatelessWidget {


  // NOTE 0.available 1.selected 2.unavailable
   
  final int status;

  const SeatItem({ Key? key, required this.status}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    backgroundColor(){
      switch(status){
        case 0 :
        return kAvailableColor;
        case 1 :
        return kGreenColor;
        case 2 :
        return kUnavailableColor;
        default :
         return kUnavailableColor;
      }
    }
    

    borderColor(){
      switch(status){
        case 0 :
        return kGreenColor;
        case 1 :
        return kGreenColor;
        case 2 :
        return kUnavailableColor;
        default :
         return kUnavailableColor;
      }
    }

    child(){
       switch(status){
        case 0 :
        return SizedBox();
        case 1 :
        return Center(child:
         Text('YOU',style: whiteTextStyle.copyWith(fontSize: 16,fontWeight:semiBold)));
        case 2 :
        return  SizedBox();
        default :
         return SizedBox();
      }
    }
    return  Container(
                width: 48,
                height:48,
                decoration: BoxDecoration(
                  color:  backgroundColor(),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 3,
                    color: borderColor(),
                  ),
                ),
                child: child(),
              );
  }
}