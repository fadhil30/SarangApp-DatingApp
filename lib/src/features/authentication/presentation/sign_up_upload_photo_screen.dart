import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang_app/src/common_widget/custom_button_widget.dart';
import 'package:sarang_app/src/common_widget/custom_text_button_widget.dart';
import 'package:sarang_app/src/common_widget/logo_and_tagline_widget.dart';
import 'package:sarang_app/src/common_widget/upload_photo_widget.dart';
import 'package:sarang_app/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/utils/image_picker_util.dart';

import '../domain/user_account.dart';
import 'bloc/auth_bloc.dart';

class SignUpUploadPhotoScreen extends StatefulWidget {
  static const String routeName = '/sign-up-upload-photo';
  const SignUpUploadPhotoScreen({super.key});

  @override
  State<SignUpUploadPhotoScreen> createState() =>
      _SignUpUploadPhotoScreenState();
}

class _SignUpUploadPhotoScreenState extends State<SignUpUploadPhotoScreen> {
  File? image;

  void getImageProfile(GetImageFrom source) async {
    final result = await ImagePickerUtil.getImage(source);
    if (result != null) {
      setState(() {
        image = File(result.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    UserAccount userAccount =
        ModalRoute.of(context)?.settings.arguments as UserAccount;

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, ExplorePeopleScreen.routeName, (route) => false);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 50.0,
            horizontal: 24.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LogoAndTaglineWidget(),
                SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(24.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        getImageProfile(GetImageFrom.camera);
                                      },
                                      icon: const Icon(
                                        Icons.camera,
                                        size: 50.0,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        getImageProfile(GetImageFrom.gallery);
                                      },
                                      icon: const Icon(
                                        Icons.photo,
                                        size: 50.0,
                                      ))
                                ],
                              ),
                            );
                          });
                    },
                    child: UploadPhotoWidget(
                      image: image,
                    )),
                const SizedBox(
                  height: 53.0,
                ),
                Text(
                  '${userAccount.fullname}',
                  style: getWhiteTextstyle(
                      fontSize: 22.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  '${userAccount.age}, ${userAccount.occupation}',
                  style: getBlack60Textstyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 240.0,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return Center(child: const CircularProgressIndicator());
                    }
                    return CustomButtonWidget(
                        title: 'Update My Profile',
                        onTap: () {
                          if (image == null) {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('No image update')));
                            return;
                          }
                          userAccount.imageProfile = image?.path;
                          context.read<AuthBloc>().add(RegisterAuthEvent(
                              userAccount: userAccount, isRegister: true));
                        });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomTextButtonWidget(
                    title: 'Skip for Now',
                    onPressed: () {
                      context.read<AuthBloc>().add(RegisterAuthEvent(
                          userAccount: userAccount, isRegister: true));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
