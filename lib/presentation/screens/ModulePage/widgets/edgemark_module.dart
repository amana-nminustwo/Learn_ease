// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class EdgemarkModuleTile extends StatelessWidget {
//   final String id;
//   final String title;
//   final String subtitle;
//
//   const EdgemarkModuleTile({
//     super.key,
//     required this.id,
//     required this.title,
//     required this.subtitle,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.15),
//             blurRadius: 6,
//             offset: const Offset(0, 15),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           // Left purple section (different color)
//           Container(
//             width: 60,
//             height: 75,
//             decoration: const BoxDecoration(
//               color: Color(0xFF8000FF),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(14),
//                 bottomLeft: Radius.circular(14),
//               ),
//             ),
//             alignment: Alignment.center,
//             child: Text(
//               id,
//               style: const TextStyle(
//                 fontFamily: 'Mooxy',
//                 color: Colors.white,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//
//           // Content section
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 10),
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontFamily: 'Mooxy',
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700, // slightly bolder
//                       color: Color(0xFF2F005F), // darker purple tone
//                       letterSpacing: 1,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     subtitle,
//                     style: GoogleFonts.inter(
//                       fontSize: 14,
//                       color: const Color(0XFF2F2965),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ),
//
//           // Arrow
//           const Padding(
//             padding: EdgeInsets.only(right: 16.0),
//             child: Icon(
//               Icons.arrow_forward_ios_rounded,
//               color: Colors.black,
//               size: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../ModulePage/PageRoute/module_desc_page.dart';

class EdgemarkModuleTile extends StatelessWidget {
  final String id;
  final String title;
  final String subtitle;

  const EdgemarkModuleTile({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const ModuleDescPage()), // ✅ navigation
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left purple section (different shade)
            Container(
              width: 60,
              height: 75,
              decoration: const BoxDecoration(
                color: Color(0xFF8000FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                id,
                style: const TextStyle(
                  fontFamily: 'Mooxy',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),

            // Main content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Mooxy',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Color(0XFF2F2965),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
