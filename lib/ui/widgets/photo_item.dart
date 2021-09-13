import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final String imageUlr;
  const PhotoItem({ Key? key, required this.imageUlr }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                      width: 70,
                      height: 70,
                      margin:  EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(18),
                        image : DecorationImage(
                          fit: BoxFit.cover,
                          image:  AssetImage(imageUlr),
                        ),
                      ),
                    );
  }
}