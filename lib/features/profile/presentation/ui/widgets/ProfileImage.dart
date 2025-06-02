import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageSize = size.width * 0.3;

    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              color: greyColor.withOpacity(0.4),
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage('assets/images/user.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Positioned(
          //   bottom: 8,
          //   right: 8,
          //   // child: Container(
          //   //   padding: const EdgeInsets.all(6),
          //   //   decoration: BoxDecoration(
          //   //     shape: BoxShape.circle,
          //   //     color: Colors.grey.shade200,
          //   //   ),
          //   child: SvgPicture.asset(
          //     "",
          //     width: 20.w,
          //   ),
          // ),
        ],
      ),
    );
  }
}
