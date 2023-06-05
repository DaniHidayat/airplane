import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerCard extends StatefulWidget {
  final List<Map<String, String>> _slideItems;
  const BannerCard(this._slideItems, {Key? key}) : super(key: key);

  @override
  State<BannerCard> createState() => _BannerCardState();
}

class _BannerCardState extends State<BannerCard> {
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentSlide = index;
              });
            },
          ),
          items: widget._slideItems.map((item) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      item['image']!,
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget._slideItems.map((item) {
            int index = widget._slideItems.indexOf(item);

            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentSlide == index
                    ? Color.fromARGB(255, 121, 5, 236)
                    : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
