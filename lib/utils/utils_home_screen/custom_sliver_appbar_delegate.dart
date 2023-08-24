// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../../app/constants.dart';
// import '../../model/weather_model.dart';
// import '../../services/weather_service.dart';
// import '../utils_search_screen/custom_snack_bar.dart';
// import 'custom_app_bar.dart';

// class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final double expandedHeigth;
//   final WeatherModel? provider;

//   const CustomSliverAppBarDelegate({
//     required this.expandedHeigth,
//     required this.provider,
//   });

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Stack(
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       fit: StackFit.expand,
//       children: [
//         buildBackground(shrinkOffset, context),
//         buildAppBar(shrinkOffset, context, provider),
//       ],
//     );
//   }

//   double appear(double shrinkOffset) => shrinkOffset / expandedHeigth;
//   double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeigth;

//   Widget buildAppBar(double shrinkOffset, context, provider) => Opacity(
//         opacity: appear(shrinkOffset),
//         child: AppBar(
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
//           ),
//           backgroundColor: kPrimaryColor,
//           systemOverlayStyle: const SystemUiOverlayStyle(
//             systemNavigationBarColor: Colors.transparent,
//           ),
//           toolbarHeight: 100,
//           title: CustomAppBar(provider: provider),
//         ),
//       );

//   Widget buildBackground(double shrinkOffset, context) => Opacity(
//         opacity: disappear(shrinkOffset),
//         child: Container(
//           clipBehavior: Clip.antiAlias,
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black54,
//                 spreadRadius: 1.5,
//                 blurRadius: 4,
//               )
//             ],
//           ),
//           child: Stack(
//             alignment: Alignment.topRight,
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     colorFilter:
//                         ColorFilter.mode(Colors.black38, BlendMode.darken),
//                     image: AssetImage(Images.backgroundNightWeather),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 34,
//                 right: 31,
//                 child: CircleAvatar(
//                   radius: 16,
//                   backgroundColor: kWhite,
//                   child: IconButton(
//                     padding: EdgeInsets.zero,
//                     onPressed: () async {
//                       // Navigator.pushNamed(context, SearchScreen.routeName);
//                       // showSearch(context: context, delegate: Search());
//                       try {
//                         await OldWeatherService.searchLocation(
//                           "damascus",
//                           context,
//                         );
//                       } catch (e) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           CustomSnackBar(
//                             "No matching location found, Please Try Again",
//                           ),
//                         );
//                       }
//                     },
//                     icon: const Icon(
//                       Icons.search,
//                       color: Colors.blueGrey,
//                       size: 22,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );

//   @override
//   double get maxExtent => expandedHeigth;

//   @override
//   double get minExtent => kToolbarHeight + 40;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
