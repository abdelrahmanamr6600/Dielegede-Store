import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/bag/presentation/ui/widgets/CustomDialog.dart';
import 'package:dielegende_store/features/profile/presentation/cubit/ProfileCubit.dart';
import 'package:dielegende_store/features/profile/presentation/cubit/ProfileState.dart';
import 'package:dielegende_store/features/profile/presentation/ui/widgets/LogOutDialog.dart';
import 'package:dielegende_store/features/profile/presentation/ui/widgets/ProfileImage.dart';
import 'package:dielegende_store/features/profile/presentation/ui/widgets/ProfileLisTile.dart';
import 'package:dielegende_store/features/profile/presentation/ui/widgets/ProfileSkeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Profile"),
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const ProfileSkeleton();
            } else if (state is ProfileFailure) {
              return Center(child: Text(state.message));
            } else if (state is ProfileSuccess) {
              final user = state.user;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ProfileImage(),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name ?? '',
                                style: AppTextStyles.largeText().copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                    color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                user.email ?? '',
                                style: AppTextStyles.mainText().copyWith(
                                  fontSize: 12.sp,
                                  color: greyColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        ProfileLisTile(
                          title: "Your Profile",
                          onTap: () {
                            context.push('/editProfileScreen').then((_) {
                              context.read<ProfileCubit>().getProfile();
                            });
                          },
                        ),
                        ProfileLisTile(
                            title: "Privacy policy",
                            onTap: () {
                              context.push('/privacyPolicyScreen');
                            }),
                        ProfileLisTile(
                          title: "Log out",
                          onTap: () {
                            final outerContext = context;
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (dialogContext) {
                                return BlocListener<ProfileCubit, ProfileState>(
                                  listener: (context, state) {
                                    if (state is ProfileLoggedOut) {
                                      // Navigator.of(dialogContext)
                                      //     .pop(); // اقفل الديالوج

                                      outerContext.go('/');
                                    }
                                  },
                                  child: LogOutDialog(
                                    action: () {
                                      outerContext
                                          .read<ProfileCubit>()
                                          .logout();
                                    },
                                    headerMessage: "Log out?",
                                    bodyMessage:
                                        "Are you sure you want to log out from your account?",
                                    buttonText: "Log out",
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
