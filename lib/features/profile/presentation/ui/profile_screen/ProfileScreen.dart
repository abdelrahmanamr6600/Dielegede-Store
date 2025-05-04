import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/features/profile/presentation/ui/widgets/ProfileLisTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "Profile",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 45.sp,
                    backgroundImage: NetworkImage(
                      "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Abdelrahman Amr ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          "Abdelrahmanamr85@gmail.com",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  ProfileLisTile(
                      title: "Your Profile",
                      onTap: () {
                        context.push('/editProfileScreen');
                      }),
                  ProfileLisTile(title: "Language", onTap: () {}),
                  ProfileLisTile(title: "Privacy policy", onTap: () {
                    context.push('/privacyPolicyScreen');
                  }),
                  ProfileLisTile(title: "Invites Firends", onTap: () {}),
                  ProfileLisTile(title: "Log out", onTap: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

