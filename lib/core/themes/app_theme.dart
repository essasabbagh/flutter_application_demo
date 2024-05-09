// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:dars_app/configs/themes/colors.dart';
// import 'package:dars_app/configs/themes/fonts.dart';

// class AppTheme {
//   static ThemeData lightTheme = ThemeData(
//     fontFamily: fontFamily,
//     primaryColor: AppColor.primaryColor,
//     secondaryHeaderColor: AppColor.secondarycolor,
//     scaffoldBackgroundColor: Colors.white,
//     dialogTheme: DialogTheme(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//     ),
//     bottomSheetTheme: const BottomSheetThemeData(
//       backgroundColor: AppColor.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(12.0),
//         ),
//       ),
//     ),
//     appBarTheme: AppBarTheme(
//       color: AppColor.primaryColor,
//       systemOverlayStyle: SystemUiOverlayStyle.light,
//       titleTextStyle: title1TextStyle,
//       iconTheme: const IconThemeData(
//         color: AppColor.white,
//       ),
//     ),
//     // colorScheme: ColorScheme.fromSwatch().copyWith(
//     //   secondary: Colors.orange,
//     // ),
//     dropdownMenuTheme: const DropdownMenuThemeData(
//       inputDecorationTheme: InputDecorationTheme(
//         border: OutlineInputBorder(),
//       ),
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       contentPadding: const EdgeInsets.symmetric(
//         horizontal: 14,
//       ),
//       border: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(5.0),
//         ),
//         borderSide: BorderSide(
//           color: AppColor.borderColor,
//         ),
//       ),
//       enabledBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(5.0),
//         ),
//         borderSide: BorderSide(
//           color: AppColor.borderColor,
//         ),
//       ),
//       focusedBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(5.0),
//         ),
//         borderSide: BorderSide(
//           color: AppColor.primary700,
//           width: 2,
//         ),
//       ),
//       hintStyle: hint,

//       helperStyle: caption,
//       errorStyle: caption.copyWith(color: AppColor.error600),
//       // fillColor: Colors.grey.shade50,
//     ),
//     sliderTheme: SliderThemeData(
//       trackHeight: 4.0,
//       thumbColor: AppColor.secondary500,
//       activeTrackColor: AppColor.secondary500,
//       // activeTickMarkColor: ColorManager.primary,
//       inactiveTrackColor: AppColor.secondary50,
//       disabledActiveTrackColor: Colors.grey.shade300,
//       // overlayShape: SliderComponentShape.noOverlay,
//       // thumbShape: const SliderThumbShape(
//       //   disabledThumbRadius: 4.0,
//       //   enabledThumbRadius: 4.0,
//       // ),
//       trackShape: const RoundedRectSliderTrackShape(),
//       thumbShape: const RoundSliderThumbShape(
//         enabledThumbRadius: 12.0,
//         pressedElevation: 8.0,
//       ),
//       showValueIndicator: ShowValueIndicator.always,

//       // overlayColor: ColorManager.darkPrimary.withOpacity(0.1),
//       overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
//       tickMarkShape: const RoundSliderTickMarkShape(),
//       inactiveTickMarkColor: Colors.white,
//       valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
//       // valueIndicatorColor: ColorManager.darkPrimary,
//       valueIndicatorTextStyle: const TextStyle(
//         color: Colors.white,
//         fontSize: 20.0,
//       ),
//     ),
//   );

//   // static ThemeData darkTheme = ThemeData(
//   //   primaryColor: Colors.teal,
//   //   scaffoldBackgroundColor: Colors.grey[900],
//   //   appBarTheme: const AppBarTheme(
//   //     color: Colors.teal,
//   //     systemOverlayStyle: SystemUiOverlayStyle.light,
//   //   ),
//   //   colorScheme: ColorScheme.fromSwatch().copyWith(
//   //     secondary: Colors.amber,
//   //   ),
//   // );
// }
