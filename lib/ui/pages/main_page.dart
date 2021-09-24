import 'package:airplane/ui/pages/home_page.dart';
import 'package:airplane/ui/pages/setting_page.dart';
import 'package:airplane/ui/pages/transaction_page.dart';
import 'package:airplane/ui/pages/wallet_page.dart';
import 'package:airplane/ui/widgets/bottom_custom_navigation_item.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {



    Widget bulidContent(){
      return HomePage();
    }

    Widget customBottomNavigation(){
      return Align( 
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom:30,
           left: defaultMargin,
           right: defaultMargin
           ),

          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            BottomCustomNagivationItem(imageUrl: 'assets/icon_home2.png',isSelected: true,),
              BottomCustomNagivationItem(imageUrl: 'assets/icon_booking.png',),
                BottomCustomNagivationItem(imageUrl: 'assets/icon_card.png',),
                  BottomCustomNagivationItem(imageUrl: 'assets/icon_settings.png',)
               
            ],
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: kBackgroundColor ,
      body: Stack(
        children : [
         bulidContent(),
          customBottomNavigation(),
        ]
        ),
    );
  }
}