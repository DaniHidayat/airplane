import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget header(){
      return Container(
        margin:  EdgeInsets.only(left: defaultMargin,right: defaultMargin,top: 30),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Howdy,\nDani Hidayat ',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text('Where to fly today?',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light
                  ),)
            
                ],
              ),
            ),
            Container(
              width: 60,
              height:60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image:DecorationImage(image: AssetImage('assets/image_profile.png'))
              ),

            )
          ],
        ),
      );
    }
    Widget popularDestination(){
      return Container(
        margin : EdgeInsets.only(top:30),
        child: Row(
          children : [
            Container(
              width : 200,
              height : 323,
              margin : EdgeInsets.only(left:defaultMargin,),
               padding: EdgeInsets.all(10),
              decoration : BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kWhiteColor,
              ),
              child: Column(
                children :[
                  Container(
                    width: 180,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        image : AssetImage('assets/image_destination1.png'
                        ),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 55,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(18),
                          ),
                        ),
                        child: 
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
                            Text('4.8',
                            style: blackTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 14,
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ]
              ),

            )
          ]
        )
      );

    }
    
    return ListView(
     children:[
       header(),
       popularDestination(),
     ]
    );
  }
}