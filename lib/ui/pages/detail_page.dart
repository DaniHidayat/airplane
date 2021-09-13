import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/interest_item.dart';
import 'package:airplane/ui/widgets/photo_item.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';


class DetailPage extends StatelessWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget backgroundImage(){
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image:  DecorationImage(
            fit: BoxFit.cover,
            image:  AssetImage('assets/image_destination1.png'),
          ),
        ),
      );
    }
    Widget customShadow(){
      return Container(
        width: double.infinity,
        height: 214,
        margin:  EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient : LinearGradient(
            begin:  Alignment.topCenter,
            end:  Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95)
            ]
          )
        ),
      );
    }
    Widget content(){
      return 
          Container(
           width: double.infinity,
           margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            children: [
              //NOTE: EMBLEM
              Container(
                width: 108,
                height: 24,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/icon_emblem.png'))
                ),
              ),
              //NOTE: TITLE
              Container(
                margin: EdgeInsets.only(top: 256),
                child:
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lake Ciliwung',style:whiteTextStyle.copyWith(fontSize: 24,fontWeight: semiBold),
                          overflow: TextOverflow.ellipsis,
                          ),
                          Text('Tangerang',style:whiteTextStyle.copyWith(fontSize:16,fontWeight: light),
                          )
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
                                  Text('4.5',
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 14,
                                  ),)
                                ],
                              ),
                  ],
                )
              ),
            
              //DESCRIPTION
              Container(
                width: double.infinity,
                margin : EdgeInsets.only(top: 30),
                padding : EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30
                ),
                decoration: BoxDecoration(
                  color:  kWhiteColor,
                  borderRadius: BorderRadius.circular(18)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //About
                    Text('About',style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold),),
                    SizedBox(height:16),
                    Text('Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat  dengan Kebun Raya Eka Karya  menjadikan tempat Bali.',style: blackTextStyle.copyWith(
                      height: 2
                    ),
                    ),
                    SizedBox(
                      height:20
                    ),
                    Text('About',style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold),),
                  SizedBox(
                      height:6
                    ),
                    Row(
                      children: [
                        PhotoItem(imageUlr: 'assets/image_photo1.png',),
                         PhotoItem(imageUlr: 'assets/image_photo2.png',),
                          PhotoItem(imageUlr: 'assets/image_photo3.png',),
                      ],
                    ),
                    SizedBox(
                      height:20
                    ),

                    //NOTE:INTERES
                    
                    Text('Interest',style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold),),
                    SizedBox(height: 6,),
                      Row(
                        children :[
                        InterestItem(text: 'Kids Park',),
                        InterestItem(text : 'Honor Brige'),
                        ]
                        ),
                        SizedBox(height: 10,),
                        Row(
                        children :[
                        InterestItem(text:'City Museum' ,),
                        InterestItem(text:'Centaral Mall' ,),
                        ]
                        ),
                  ],
                ),
              ),
            
            //NOTE: PRICE & BUTTON
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 30),
              child:  Row(
                children: [
                  //NOTE: PRICE
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('IDR 2.500.000',style: blackTextStyle.copyWith(fontSize: 18,fontWeight: medium),),
                        SizedBox(height: 5,),
                        Text('Per Orang',style: greyTextStyle.copyWith(
                          fontWeight: light
                        ),)
                      ],
                    ),
                  ),
                  CustomButton(title: 'Book Now', onPressed:(){
                  
                  },width: 170,)
                ],
              ),
            ),

            ],
          ) ,
          );
        

      
      //Note
      
    }
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body:SingleChildScrollView(
        child: Stack(
              children :[
                backgroundImage(),
                customShadow(),
                content(),
              ]
            ),
      ),
        
    );
  }
}