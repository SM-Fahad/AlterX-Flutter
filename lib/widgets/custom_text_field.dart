// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class CustomTextField extends StatelessWidget {
//   final String? label;
//   final String? hintText;
//   final String? initialValue;
//   final ValueChanged<String>? onChanged;
//   final bool obscureText;
//   final TextInputType keyboardType;
//   final int? maxLength;
//   final int? maxLines;
//   final bool enabled;
//   final TextEditingController? controller;
//   final List<TextInputFormatter>? inputFormatters;
//   final bool isRequired;
//   final String? errorText;
//   final TextCapitalization textCapitalization;
//   final TextInputAction textInputAction;
//   final FocusNode? focusNode;
//   final VoidCallback? onTap;
//   final bool readOnly;

//   const CustomTextField({
//     super.key,
//     this.label,
//     this.hintText,
//     this.initialValue,
//     this.onChanged,
//     this.obscureText = false,
//     this.keyboardType = TextInputType.text,
//     this.maxLength,
//     this.maxLines = 1,
//     this.enabled = true,
//     this.controller,
//     this.inputFormatters,
//     this.isRequired = false,
//     this.errorText,
//     this.textCapitalization = TextCapitalization.none,
//     this.textInputAction = TextInputAction.next,
//     this.focusNode,
//     this.onTap,
//     this.readOnly = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (label != null)
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: Row(
//               children: [
//                 Text(
//                   label!,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: Color(0xFFDABB7E),
//                     letterSpacing: 2,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 if (isRequired)
//                   const Text(
//                     ' *',
//                     style: TextStyle(
//                       color: Colors.red,
//                       fontSize: 12,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         TextField(
//           controller: controller ?? (initialValue != null 
//               ? TextEditingController(text: initialValue) 
//               : null),
//           onChanged: onChanged,
//           obscureText: obscureText,
//           keyboardType: keyboardType,
//           maxLength: maxLength,
//           maxLines: maxLines,
//           enabled: enabled,
//           readOnly: readOnly,
//           textDirection: TextDirection.ltr, // Force LTR
//           textAlign: TextAlign.left,
//           textCapitalization: textCapitalization,
//           textInputAction: textInputAction,
//           focusNode: focusNode,
//           onTap: onTap,
//           inputFormatters: inputFormatters,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//           ),
//           decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: const TextStyle(
//               color: Color(0xFF57534E),
//               fontSize: 16,
//             ),
//             filled: true,
//             fillColor: const Color(0xFF1C1917),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Color(0xFF292524)),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Color(0xFF292524)),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Color(0xFFDABB7E)),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Colors.red),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Colors.red),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 16,
//               vertical: maxLines == 1 ? 16 : 12,
//             ),
//             counterText: '',
//             errorText: errorText,
//             errorStyle: const TextStyle(
//               color: Colors.red,
//               fontSize: 12,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // Specialized OTP Text Field
// class OtpTextField extends StatelessWidget {
//   final String? initialValue;
//   final ValueChanged<String>? onChanged;
//   final int length;

//   const OtpTextField({
//     super.key,
//     this.initialValue,
//     this.onChanged,
//     this.length = 4,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xFF1C1917),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: const Color(0xFF292524)),
//       ),
//       child: TextField(
//         controller: TextEditingController(text: initialValue),
//         style: const TextStyle(
//           fontSize: 32,
//           letterSpacing: 20,
//           fontWeight: FontWeight.w300,
//           color: Colors.white,
//         ),
//         textAlign: TextAlign.center,
//         textDirection: TextDirection.ltr,
//         maxLength: length,
//         decoration: InputDecoration(
//           hintText: '•' * length,
//           hintStyle: const TextStyle(
//             color: Color(0xFF57534E),
//             letterSpacing: 20,
//           ),
//           counterText: '',
//           border: InputBorder.none,
//           contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//         ),
//         keyboardType: TextInputType.number,
//         inputFormatters: [
//           FilteringTextInputFormatter.digitsOnly,
//           LengthLimitingTextInputFormatter(length),
//         ],
//         onChanged: onChanged,
//       ),
//     );
//   }
// }