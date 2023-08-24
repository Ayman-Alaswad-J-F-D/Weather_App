// import 'package:flutter/material.dart';
// import 'package:glassmorphism/glassmorphism.dart';

// import '../../app/constants.dart';

// class CustomGlassmorphicContainer extends StatelessWidget {
//   const CustomGlassmorphicContainer({
//     Key? key,
//     required this.height,
//     required this.child,
//     this.border = 0.0,
//   }) : super(key: key);

//   final double height;
//   final double border;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: GlassmorphicContainer(
//         width: double.infinity,
//         height: height,
//         borderRadius: 20,
//         linearGradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Colors.black.withOpacity(0.1),
//             Colors.black.withOpacity(0.2),
//           ],
//           stops: const [
//             0.1,
//             1,
//           ],
//         ),
//         border: border,
//         blur: 15,
//         borderGradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             kPrimaryColor.withOpacity(0.4),
//             kPrimaryColor.withOpacity(0.5),
//           ],
//         ),
//         child: child,
//       ),
//     );
//   }
// }
