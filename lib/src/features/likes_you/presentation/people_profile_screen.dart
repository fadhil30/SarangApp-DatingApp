import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widget/custom_button_widget.dart';
import 'package:sarang_app/src/features/likes_you/data/data_hobby_dummy.dart';
import 'package:sarang_app/src/features/likes_you/domain/user.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';
import '../../../common_widget/people_identity_widget.dart';
import '../../../common_widget/profile_detail_image.dart';

class PeopleProfileScreen extends StatelessWidget {
  static const String routeName = '/people-profile';
  const PeopleProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileDetailImageWidget(
              imagePath: user.imagePath,
            ),
            const SizedBox(
              height: 30.0,
            ),
            PeopleIdentityWidget(user: user),
            Container(
              height: 80.0,
              margin: const EdgeInsets.only(left: 24.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final hobby = dataHobbyDummy[index];
                  return Container(
                    width: 120.0,
                    height: 80.0,
                    margin: const EdgeInsets.only(right: 16.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage(hobby))),
                  );
                },
                itemCount: dataHobbyDummy.length,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomButtonWidget(title: 'Chat Now', onTap: () {}),
            ),
            const SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
