import 'package:flutter/material.dart';
import 'package:sarang_app/src/features/likes_you/domain/user.dart';

import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';

class PeopleIdentityWidget extends StatelessWidget {
  const PeopleIdentityWidget({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.fullName,
            style: getWhiteTextstyle(
                fontSize: 28.0, fontWeight: FontWeightManager.semiBold),
          ),
          Text(
            '${user.age}, ${user.occupation}',
            style: getBlackTextstyle(),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            user.description,
            style: getWhiteTextstyle(),
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
