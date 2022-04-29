import 'package:flutter/material.dart';
import 'package:tama_skill_test/shared/shared.dart';

class CustomCardView extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final String author;
  final String image;

  CustomCardView({
    this.title = '',
    this.description = '',
    this.date = '',
    this.author = '',
    this.image = '',
  });

  @override
  Widget build(BuildContext context) {
    final sw = SizeConfig().screenWidth;
    return Container(
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 20.0,
            spreadRadius: 4.0,
            offset: Offset(
              -10.0,
              10.0,
            ),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: sw * .3,
            height: sw * .3,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(
                      image,
                    ),
                  ),
                ),
              ),
            ),
          ),
          CommonWidget.rowWidth(width: 10.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: sw * .5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidget.subtitleText(text: title),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: CommonWidget.labelExpanded(
                        label: author,
                        value: date,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
