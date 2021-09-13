import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget bonusCard(){
      return Container(
        width: 300,
        height: 211,
        padding: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          image: DecorationImage(image:AssetImage('assets/image_card2.png'),
        ),
         boxShadow :[
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.5),
            blurRadius:50,
            offset:Offset(0,11), 
          )
        ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nae',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light
                    ),
                    ),
                    Text('Dani Hidayat',style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: medium
                    ),
                    overflow: TextOverflow.ellipsis,), //untuk mengatasi text panjang
                  ],
                ),
              ),
              Container(
                width: 24,
                height: 24,
                margin: EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:AssetImage(
                      'assets/icon_plane.png'
                    )
                  )
                ),
              ),
              Text('Pay',style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
              ),
            ],
            ),
            SizedBox(
              height: 41,
            ),
            Text('Balance',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight:light
            ),
            ),
            Text(
            'IDR 280.000.000',
              style: whiteTextStyle.copyWith(
                fontSize: 26,
                fontWeight: medium
               ),
            ),
          ],
        ),
      );
    }

    Widget title(){
      return Container(
        margin: EdgeInsets.only(top: 80),
        child: Text(
          'Big Bonus 🎉',
          style:blackTextStyle.copyWith(
            fontSize: 32,
            fontWeight: semiBold,
          ),),
      );
    }

    Widget subTitle(){
      return Container(
         margin: EdgeInsets.only(top: 10),
        child: Text(
          'We give you early credit so that \nyou can buy a flight ticket',
          style:blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
          ),
          textAlign: TextAlign.center,
          ),
      );
    }

    Widget startButton(){
      return CustomButton(title:'Start Fly Now',margin: EdgeInsets.only(top:50), width:220,
      onPressed: (){
         Navigator.pushNamed(context, '/main');
      });
    }
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bonusCard(),
            title(),
            subTitle(),
            startButton(),
          ],
        )
        ),
    );
  }
}