import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
              width: 300,
              height: 150,
              margin: EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_success.png')
                )
              ),
            ),
            Text(
              'Well Booked 😍',style: blackTextStyle.copyWith(fontSize: 32, fontWeight:semiBold)
            ),
            SizedBox(height:10),
            Text('Are you ready to explore the new \nworld of experiences?',style:greyTextStyle.copyWith(fontWeight: light,fontSize: 16),textAlign: TextAlign.center,),

            CustomButton(title: 'My Bookings',
             onPressed: () { 
               Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
          },
            width: 202, margin: EdgeInsets.only(top: 50)),
          ]
        )
      ),

    );
  }
}