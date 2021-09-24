import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'checkout_page.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    Widget title(){
      return Container(
        margin:  EdgeInsets.only(top:50),
        child:
        Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(
            fontSize:24,
            fontWeight: semiBold
          ),
        ),
      );
    }

    Widget seatStatus(){
        return Container(
          margin : EdgeInsets.only(top:30),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              //NOTE: AVALIBLE
              Container(
              width: 16,
              height: 16,
              margin:  EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_available2.png'
                  )
                ),
              ),
            ),
            Text('Available',style: blackTextStyle ,),

               //NOTE: SELECTED
             Container(
              width: 16,
              height: 16,
              margin:  EdgeInsets.only(right: 6 ,left:10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_selected2.png'
                  )
                ),
              ),
            ),
            Text('Selected',style: blackTextStyle,),

              //NOTE: UNVAILABLE
             Container(
              width: 16,
              height: 16,
              margin:  EdgeInsets.only(right: 6 ,left:10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_unavailable.png'
                  )
                ),
              ),
            ),
            Text('Unvailable',style: blackTextStyle ,)
            ]
           
            
          ),
        );
    }
  Widget selectSeat(){
      return Container(
        width:double.infinity,
        margin: EdgeInsets.only(top:30),
        padding: EdgeInsets.symmetric(horizontal:22,vertical:30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor
        ),
        child: Column(
          children: [

            //NOTE: SEAT INDIKATOR
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width:48,
                  height:48,
                  child: 
                Center(
                  child: Text('A',style:greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                ),
                Container(
                  width:48,
                  height:48,
                  child: 
                Center(
                  child: Text('B',style:greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                ),
                 Container(
                  width:48,
                  height:48,
                  child: 
                Center(
                  child: Text(' ',style:greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                ),
                 Container(
                  width:48,
                  height:48,
                  child: 
                Center(
                  child: Text('C',style:greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                ),
                 Container(
                  width:48,
                  height:48,
                  child: 
                Center(
                  child: Text('D',style:greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                ),
              ],
            ),



          //NOTE SEAT 1
          Container(
            margin : EdgeInsets.only(top:16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
             SeatItem(status: 0),
              SeatItem(status: 1),
               Container(
                width: 48,
                height:48,
               child: Center(child: Text('1',style: greyTextStyle.copyWith(fontSize: 16),))
              ),
                SeatItem(status: 2),
                SeatItem(status: 0),
            ],),
          ),
          //NOTE SEAT 2
          Container(
            margin : EdgeInsets.only(top:16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
             SeatItem(status: 0),
              SeatItem(status: 1),
               Container(
                width: 48,
                height:48,
               child: Center(child: Text('2',style: greyTextStyle.copyWith(fontSize: 16),))
              ),
                SeatItem(status: 2),
                SeatItem(status: 0),
            ],),
          ),
          //NOTE SEAT 3
          Container(
            margin : EdgeInsets.only(top:16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
             SeatItem(status: 0),
              SeatItem(status: 1),
               Container(
                width: 48,
                height:48,
               child: Center(child: Text('3',style: greyTextStyle.copyWith(fontSize: 16),))
              ),
                SeatItem(status: 2),
                SeatItem(status: 0),
            ],),
          ),
          //NOTE SEAT 4
          Container(
            margin : EdgeInsets.only(top:16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
             SeatItem(status: 0),
              SeatItem(status: 1),
               Container(
                width: 48,
                height:48,
               child: Center(child: Text('4',style: greyTextStyle.copyWith(fontSize: 16),))
              ),
                SeatItem(status: 2),
                SeatItem(status: 0),
            ],),
          ),
          //NOTE SEAT 5
          Container(
            margin : EdgeInsets.only(top:16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
             SeatItem(status: 0),
              SeatItem(status: 1),
               Container(
                width: 48,
                height:48,
               child: Center(child: Text('5',style: greyTextStyle.copyWith(fontSize: 16),))
              ),
                SeatItem(status: 2),
                SeatItem(status: 0),
            ],),
          ),
          //note Your seat
          Container(
            margin: EdgeInsets.only(top:30),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children:[
                Text('Your Seat',  style: greyTextStyle.copyWith(
              fontWeight: light,
            ),
            ),
              Text('A3,B3',  style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize:16
            ),
            ),
              ]
            )
          
          ),
          //NOTE:TOTAL CONTAINER
    Container(
            margin: EdgeInsets.only(top:16),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children:[
                Text('TOTAL',  style: greyTextStyle.copyWith(
              fontWeight: light,
            ),
            ),
              Text('IDR 540.000.000',  style: greenTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize:16
            ),
            ),
              ]
            )
          
          ),
          ],
        ),
      );
    }

    Widget checkoutButton(){
      return  CustomButton(title: 'Continue to Checkout', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckoutPage(),),);},
      margin: EdgeInsets.only(top: 30,bottom:46));
    }
    


    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding:  EdgeInsets.symmetric(horizontal: 24,),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          checkoutButton(),

        ],
      ),
    );
  }


}