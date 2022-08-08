import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  const ActorCard({
    Key? key,
    required this.textStyle,
    required this.actorName,
    required this.charName,
    required this.image,
  }) : super(key: key);

  final TextStyle textStyle;

  final String image;
  final String actorName;
  final String charName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 102,
      width: 49,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color(0x40000000),
                  blurRadius: 15,
                  offset: Offset(4, 4))
            ]),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9, bottom: 3),
            child: Text(
              actorName,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
          Text(
            charName,
            textAlign: TextAlign.center,
            style: textStyle.copyWith(
              color: const Color(0xffffffff).withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
