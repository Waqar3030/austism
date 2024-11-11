// import 'package:austism/resources/apptext.dart';
// import 'package:austism/resources/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TextfieldTwo extends StatelessWidget {
//   final double? height;
//   final double? width;
//   final String labelText;
//   final TextEditingController controller;
//   final String hintText;
//   const TextfieldTwo(
//       {super.key,
//       this.height,
//       this.width,
//       this.labelText = "",
//       required this.controller,
//       required this.hintText});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height,
//       width: width ?? 400.w,
//       child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//         labelText.isNotEmpty
//             ? Padding(
//                 padding: EdgeInsets.only(
//                   left: 5.w,
//                 ),
//                 child: Text(
//                   labelText,
//                   style: AppTextStyle.small.copyWith(
//                     color: black,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ))
//             : const SizedBox.shrink(),
//         5.h.verticalSpace,
//         Container(
//           child: TextFormField(
//             onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
//             controller: controller,
//             style: const TextStyle(color: Colors.black),
//             cursorColor: Colors.white,
//             decoration: InputDecoration(
//               fillColor: Colors.white,
//               filled: true,
//               hintText: hintText,
//               hintStyle: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 13,
//                 fontWeight: FontWeight.w200,
//               ),
//               border: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.white, width: 1),
//                   borderRadius: BorderRadius.circular(10.r)),
//               enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                     color: Colors.white,
//                   ),
//                   borderRadius: BorderRadius.circular(10.r)),
//               focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                     color: Colors.white,
//                   ),
//                   borderRadius: BorderRadius.circular(10.r)),
//             ),
//           ),
//         )
//       ]),
//     );
//   }
// }
