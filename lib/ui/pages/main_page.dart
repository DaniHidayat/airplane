import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/ui/pages/home_page.dart';
import 'package:airplane/ui/pages/setting_page.dart';
import 'package:airplane/ui/pages/transaction_page.dart';
import 'package:airplane/ui/pages/wallet_page.dart';
import 'package:airplane/ui/widgets/bottom_custom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bulidContent(int currentIndex){

      switch(currentIndex){
        case 0 :
        return HomePage();
         case 1 :
        return TrasactionPage();
         case 2 :
        return WalletPage();
         case 3 :
        return SettingPage();
         default:
        return HomePage();

      }
      
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
            BottomCustomNagivationItem(index: 0, imageUrl: 'assets/icon_home2.png',),
              BottomCustomNagivationItem(index:1,imageUrl: 'assets/icon_booking.png',),
                BottomCustomNagivationItem(index:2,imageUrl: 'assets/icon_card.png',),
                  BottomCustomNagivationItem(index: 3,imageUrl: 'assets/icon_settings.png',),
               
            ],
          ),
        ),
      );
    }
    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor ,
          body: Stack(
            children : [
             bulidContent(currentIndex),
              customBottomNavigation(),
            ]
            ),
        );
      },
    );
  }
}