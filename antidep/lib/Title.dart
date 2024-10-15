import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final String nb;
  const TitleText({
    super.key,
    required this.title,
    required this.nb,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: Color(0xFF199A8E),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                nb,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 330,
            child: Expanded(
              child: Text(title,
                  maxLines: 5,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Color(0xFF091638), fontWeight: FontWeight.bold)),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
