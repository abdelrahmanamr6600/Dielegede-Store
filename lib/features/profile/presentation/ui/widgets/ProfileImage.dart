import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageSize = size.width * 0.4;

    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: imageSize,
            height: imageSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/men.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            // child: Container(
            //   padding: const EdgeInsets.all(6),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: Colors.grey.shade200,
            //   ),
            child: SvgPicture.asset(
              "assets/icons/edit.svg",
              width: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}
