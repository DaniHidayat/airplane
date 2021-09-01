import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
          decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                   'assets/image_get_started.png',
                  ),
                  fit:BoxFit.cover
                ),
              ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text('Fly Like a Bird',style: whiteTextStyle.copyWith(
                fontSize:32,
                fontWeight:semiBold
              ),
              ),
              SizedBox(
                height:10
              ),
              Text('Explore new world with us and let\yourself get an amazing experiences',style:whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
              ),
              Container(
                width: 220,
                height: 55,
                margin: EdgeInsets.only(top:50,bottom: 80),
                child: TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/sign-up');
                },
                style: TextButton.styleFrom(
                  backgroundColor:kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius)
                  )
                ),
                child:Text('Get Started',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                    ),
                  ),
                ),
              )
            ],
            ),
          ),
        ],
      ),
      
    );
  }
}