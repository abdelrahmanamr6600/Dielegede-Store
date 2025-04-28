import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              const Column(
                children: [
                  CustomListTile(title: "Your Profile"),
                  CustomListTile(title: "Language"),
                  CustomListTile(title: "Privacy policy"),
                  CustomListTile(title: "Invites Firends"),
                  CustomListTile(title: "Log out"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: AppTextStyles.getTextStyle().copyWith(color: Colors.black),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 5.sp, vertical: 10.sp),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: MediaQuery.textScalerOf(context).scale(16),
            color: const Color(0xFF9B9B9B),
          ),
          onTap: () {},
        ),
        Align(
          alignment: Alignment.center,
          child: Divider(
            height: 1.sp,
            thickness: 0.8,
            color: Colors.grey.shade300,
          ),
        )
      ],
    );
  }
}
