import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  SearchText({
    required this.controller,
    required this.onChanged,
    required this.onTap,
    required this.backgroundColor,
  });

  final TextEditingController controller;
  final Function onChanged;
  final Function onTap;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor != null ? backgroundColor : Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: new TextField(
        onTap: () {
          onTap();
        },
        // onChanged: (value) {
        //   onChanged();
        // },
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        decoration: new InputDecoration(
            contentPadding: EdgeInsets.only(left: 20),
            // prefixIcon:
            suffixIcon: new IconButton(
                padding: EdgeInsets.only(right: 14),
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  // color: Colors.grey[600],
                  size: 20,
                )),
            hintText: 'Search',
            hintStyle: TextStyle(fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.blueGrey.withOpacity(0.5), width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.blueGrey.withOpacity(0.5), width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: Colors.blueGrey.withOpacity(0.5), width: 1))),
      ),
    );
  }
}
