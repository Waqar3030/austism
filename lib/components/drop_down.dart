// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomDropdown extends StatefulWidget {
//   final double widthh;
//   final String? hinttext;
//   final TextEditingController controller;

//   const CustomDropdown({
//     Key? key,
//     this.hinttext,
//     required this.widthh,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   State<CustomDropdown> createState() => _CustomDropdownState();
// }

// class _CustomDropdownState extends State<CustomDropdown> {
//   String? selectedValue;
//   List<String> dropdownItems = [
//     'Option 1',
//     'Option 2',
//     'Option 3'
//   ]; // Example items

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50.h,
//       width: widget.widthh, // Use the width passed from the parent
//       child: DropdownButtonFormField<String>(
//         style: const TextStyle(color: Colors.black),
//         dropdownColor: Colors.white,
//         decoration: InputDecoration(
//           fillColor: Colors.white,
//           filled: true,
//           hintText: widget.hinttext,
//           hintStyle: TextStyle(
//             color: Colors.black,
//             fontSize: 13.sp,
//             fontWeight: FontWeight.w200,
//           ),
//           border: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white, width: 1.w),
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: Colors.white,
//             ),
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: Colors.white,
//             ),
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//         ),
//         value: selectedValue, // Initial value for the dropdown
//         onChanged: (String? newValue) {
//           setState(() {
//             selectedValue = newValue!;
//           });
//         },
//         items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(
//               value,
//               style: const TextStyle(color: Colors.black),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
