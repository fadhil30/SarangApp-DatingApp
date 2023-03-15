import 'package:flutter/material.dart';
import 'package:sarang_app/src/features/likes_you/presentation/explore_people_screen.dart';

import '../theme_manager/asset_image_icon_manager.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';
import 'match_button_widget.dart';

class ProfileDetailImageWidget extends StatelessWidget {
  const ProfileDetailImageWidget({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 420.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imagePath))),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 26.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MatchButtonWidget(
                  dimension: 24.0,
                  iconPath: 'icon_arrow_left.png',
                  onTap: () {
                    Navigator.pop(context);
                  }),
              Text(
                'Lover Profile\nDetail',
                textAlign: TextAlign.center,
                style: getWhiteTextstyle(
                    fontSize: 20.0, fontWeight: FontWeightManager.semiBold),
              ),
              MatchButtonWidget(
                  dimension: 24.0,
                  iconPath: 'icon_close_circle.png',
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        ExplorePeopleScreen.routeName, (route) => false);
                  })
            ],
          ),
        )
      ],
    );
  }
}
