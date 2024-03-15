import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoadingPortraitScreen extends StatelessWidget {
  const LoadingPortraitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CupertinoActivityIndicator(radius: 20.h, color: const Color(0xFFFF0000),),
          ),
           Gap(12.h),
          const Text("Loading", style: TextStyle(color: Color(0xFFFF0000), ),)
        ],
      ),
    );
  }
}
