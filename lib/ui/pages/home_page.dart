import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/destination_card.dart';
import 'package:airplane/ui/widgets/destination_tile.dart';
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal ,
          child: Row(
            children : [
              DestinationCard(
                name : 'Lake Ciliwung',
                city:  'Tangerang',
                imageUrl: 'assets/image_destination1.png',
                rating: 4.9,
              ),
              DestinationCard(
                name : 'White Houses',
                city:  'Spain',
                imageUrl: 'assets/image_destination2.png',
                rating: 4.7,
              ),
              DestinationCard(
                name : 'Hill Heyo',
                city:  'Monaco',
                imageUrl: 'assets/image_destination3.png',
                rating: 2.9,
              ),
              DestinationCard(
                name : 'Menara',
                city:  'Japan',
                imageUrl: 'assets/image_destination4.png',
                rating: 4.9,
              ),
              DestinationCard(
                name : 'Payung Teduh ',
                city:  'Singapore',
                imageUrl: 'assets/image_destination5.png',
                rating: 4.6,
              ),
        
            ],
          ),
        ),
      );
    }
    
    Widget newDestination(){
      return Container(
        margin: EdgeInsets.only(top: 30,
        left: defaultMargin,
        right: defaultMargin,
        bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New This Year',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold
            ),
          ),
            DestinationTile(
              name: 'Danau Beratan',
              city: 'Singaraja',
              imageUrl: 'assets/image_destination6.png',
              rating: 4.4,
            ),
              DestinationTile(
              name: 'Sydney Opera',
              city: 'Australia',
              imageUrl: 'assets/image_destination7.png',
              rating: 3.4,
            ),
              DestinationTile(
              name: 'Roma',
              city: 'Italy',
              imageUrl: 'assets/image_destination8.png',
              rating: 4.2,
            ),
              DestinationTile(
              name: 'Payung Teduh',
              city: 'Singapore',
              imageUrl: 'assets/image_destination5.png',
              rating: 4.3,
            ),
              DestinationTile(
              name: 'Hill Hey',
              city: 'Monaco',
              imageUrl: 'assets/image_destination4.png',
              rating: 4.4,
            ),
             
          ],
        ),

      );
    }
    return ListView(
     children:[
       header(),
       popularDestination(),
       newDestination(),
     ]
    );
  }
}