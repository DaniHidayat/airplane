import 'package:airplane/ui/pages/success_checkout_page.dart';
import 'package:airplane/ui/widgets/booking_details_item.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget route(){
      return Container(
        margin: EdgeInsets.only(top:50),
        child: Column(
          children: [
            Container(
              width: 291,
              height:65,
              margin: EdgeInsets.only(bottom:30),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/image_checkout.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children :[
                    Text('CGK',style:blackTextStyle.copyWith(fontSize: 24,fontWeight: semiBold)
                    ),
                     Text('Tangerang',style:greyTextStyle.copyWith(fontWeight: light)
                    )
                  ]
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children :[
                    Text('TLC',style:blackTextStyle.copyWith(fontSize: 24,fontWeight: semiBold)
                    ),
                     Text('Ciliwung',style:greyTextStyle.copyWith(fontWeight: light)
                    )
                  ]
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget bookingDetails(){
      return Container(
        margin: EdgeInsets.only(top:30),
        padding:  EdgeInsets.symmetric(
          horizontal: 20,
          vertical : 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color :kWhiteColor,
        ),
        child: Column(
          children :[

            //NOTE:DESTINATIPN TILE
        Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin:  EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                
                image: DecorationImage(
                  fit:BoxFit.cover,
                  image: AssetImage('assets/image_destination1.png'))
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lake Ciliwung',style: 
                  blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 18,
                  ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Tangerang',
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: light
                  ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.only(right: 2),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:  AssetImage('assets/icon_star.png'),
                    ),
                  ),
                ),
                Text('48',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 14,
                ),)
              ],
            ),
            
          ],
        ),
       Container(
         margin: EdgeInsets.only(top:20),
         child: Row(
          children:[
             Text('Booking Details',style:blackTextStyle.copyWith(fontSize: 16,fontWeight:semiBold))
          ]
         )
       ),

       //Boxing Detail
      BookingDetailsItem(
        title: 'Traveler',
        valueText: '2 person',
        valueColor: kBlackColor),
       BookingDetailsItem(
        title: 'Seat',
        valueText: 'A3, B3',
        valueColor: kBlackColor),
       
       BookingDetailsItem(
        title: 'Insurance',
        valueText: 'YES',
        valueColor: kGreenColor),
       
       BookingDetailsItem(
        title: 'Refundable',
        valueText: 'NO',
        valueColor: kReedColor),
       
         BookingDetailsItem(
        title: 'VAT',
        valueText: '45%',
        valueColor: kBlackColor),
       
            BookingDetailsItem(
        title: 'Price',
        valueText: 'IDR 8.500.690',
        valueColor: kBlackColor),
         BookingDetailsItem(
        title: 'Grand Total',
        valueText: 'IDR 12.000.000',
        valueColor: kPrimaryColor),
          ]
        ),

      );
    }
    Widget paymentDetails(){
      return Container(
        margin: EdgeInsets.only(top:30),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical:30,
        ),
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text('Payment Details',style:blackTextStyle.copyWith(fontWeight: semiBold,fontSize: 16),),
            Container(
              margin :EdgeInsets.only(top:16),
              child: Row(
                children: [
                  Container(
                    width:100,
                    height: 70,
                    margin: EdgeInsets.only(right:16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),

                      image: DecorationImage(
                        fit: BoxFit.cover,
                      image: AssetImage('assets/image_card2.png')
                      ),
                    ),
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width:24,
                          height:24,
                          margin: EdgeInsets.only(right:6),
                          decoration: BoxDecoration(
                            
                      image: DecorationImage(
                      image: AssetImage('assets/icon_plane.png')
                      ),
                    ),
                        ),
                        Text('PAY',style:whiteTextStyle.copyWith(fontSize: 16,fontWeight: medium),
                        ),

                      ],
                    ),),
                  ),
                  Expanded(
                    child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('IDR 80.400.000',style:blackTextStyle.copyWith(fontSize: 18,fontWeight: medium),overflow: TextOverflow.ellipsis),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Current Balance',style:greyTextStyle.copyWith(fontSize: 14,fontWeight: light),),
                    ],
                  ) ,),
                  
                ],
              ),
            )

          ]
        )
      );
    }

    Widget payNowButton(){
      return CustomButton(title: 'Pay Now', onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => SuccessCheckoutPage(),),);
      },
      margin:EdgeInsets.only(top: 30),);
    }
    Widget tacButton(){
        return Container(
          alignment: Alignment.center,
          margin:  EdgeInsets.only(top: 30,bottom: 30),
          child: Text('Terms and Conditions',style:greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
            decoration: TextDecoration.underline
          ),
          ),
        );
      }
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal:defaultMargin,),
        children: [
          route(),
          bookingDetails(),
          paymentDetails(),
          payNowButton(),
          tacButton(),
        ],
      ),
      
    );
  }
}