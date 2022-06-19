import 'package:flutter/material.dart';
import 'package:projek_mobile_c1/themes.dart';

class MusicItem extends StatelessWidget {
  String songImage;

  MusicItem({required this.songImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: defaultMargin),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(songImage),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Judul Lagu",
                style: primaryTextStyle.copyWith(
                    fontSize: 14, fontWeight: regular),
              ),
              Text(
                "Nama Penyanyi",
                style: secondaryTextStyle.copyWith(
                    fontSize: 12, fontWeight: regular),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
