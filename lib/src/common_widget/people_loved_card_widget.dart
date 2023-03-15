import 'package:flutter/material.dart';
import 'package:sarang_app/src/features/likes_you/domain/user.dart';
import 'package:sarang_app/src/features/likes_you/presentation/people_profile_screen.dart';
import 'package:sarang_app/src/theme_manager/color_manager.dart';
import 'package:sarang_app/src/theme_manager/font_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';

import '../theme_manager/asset_image_icon_manager.dart';

class PeopleLovedCardWidget extends StatelessWidget {
  const PeopleLovedCardWidget({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, PeopleProfileScreen.routeName,
              arguments: user);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 18.0),
          decoration: BoxDecoration(
              color: ColorManager.secondary,
              borderRadius: BorderRadius.circular(20.0)),
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('${user.imagePath}'))),
            ),
            title: Text(
              '${user.fullName}',
              style: getWhiteTextstyle(
                  fontSize: 20.0, fontWeight: FontWeightManager.semiBold),
            ),
            subtitle: Text(
              '${user.age}, ${user.occupation}',
              style: getGrey60Textstyle(),
            ),
          ),
        ),
      ),
    );
  }
}
