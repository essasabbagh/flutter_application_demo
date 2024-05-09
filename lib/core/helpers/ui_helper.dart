// import 'package:flutter/material.dart';

// class UiHelper {
//   static void mySnack(
//     BuildContext context,
//     String message, {
//     Color? clr,
//     int? seconds = 3,
//     SnackBarAction? action,
//   }) {
//     ScaffoldMessenger.of(context).removeCurrentSnackBar();
//     // ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//           elevation: 2.0,
//           backgroundColor: clr,
//           content: Text(
//             message,
//             style: const TextStyle(
//                 fontSize: 16, fontFamily: FontConstants.fontFamily),
//           ),
//           behavior: SnackBarBehavior.floating,
//           duration: Duration(seconds: seconds!),
//           action: action

//           // SnackBarAction(
//           // label: 'إغلاق',
//           //  textColor: Colors.white,
//           //  onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
//           //  ),
//           ),
//     );
//   }

//   static Future<void> showMyDialog(
//       context, String title, String message, Function func) async {
//     return showDialog<void>(
//       context: context,
//       // barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10.0))),
//           titleTextStyle: const TextStyle(
//               color: Colors.red,
//               fontSize: 22,
//               fontFamily: FontConstants.fontFamily),
//           title: Text(title, textDirection: TextDirection.rtl),
//           content: SingleChildScrollView(
//               child: Column(
//             children: [
//               Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     message,
//                     textDirection: TextDirection.rtl,
//                     style:
//                         const TextStyle(fontFamily: FontConstants.fontFamily),
//                   )),
//               const SizedBox(height: 8.0),
//               Row(
//                 children: [
//                   TextButton(
//                       child: Text(
//                         'لا',
//                         style: TextStyle(
//                           color: Theme.of(context).disabledColor,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: FontConstants.fontFamily,
//                         ),
//                       ),
//                       onPressed: () => Navigator.of(context).pop()),
//                   TextButton(
//                     child: const Text(
//                       'نعم',
//                       style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: FontConstants.fontFamily,
//                       ),
//                     ),
//                     onPressed: () => func(),
//                   ),
//                 ],
//               )
//             ],
//           )),
//         );
//       },
//     );
//   }
// }
