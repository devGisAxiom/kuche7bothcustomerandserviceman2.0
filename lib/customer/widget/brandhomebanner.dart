// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/customer/utils/appcolor.dart';

// class BrandHomeBanner extends StatelessWidget {
//   const BrandHomeBanner({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 335,
//       height: 75,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(6),
//         boxShadow: const [
//           BoxShadow(
//             color: AppColors.black1A, // #0000001A
//             offset: Offset(1, 5),
//             blurRadius: 8,
//           ),
//         ],
//         image: const DecorationImage(
//           image: AssetImage(
//             'assets/kucheproduct.jpg',
//           ), // Replace with your image
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Align(
//         alignment: Alignment.center,
//         child: Container(
//           width: 105, // exact width
//           height: 54.35, // exact height (54.3539 rounded)
//           padding: const EdgeInsets.all(7.98),
//           decoration: BoxDecoration(
//             color: AppColors.lightshadered, // #FFE9EA
//             borderRadius: BorderRadius.circular(2.4), // 2.4 px all corners
//           ),
//           // whatever “gap: 3.99 px” refers to in Figma is handled by this padding
//           child: Image.asset('assets/kuche.png', fit: BoxFit.contain),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:provider/provider.dart';

class BrandHomeBanner extends StatelessWidget {
  const BrandHomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    //final bannerImage = context.watch<ThemeProvider>().bannerImage;
    final themeProvider = context.watch<ThemeProvider>();
    final bannerImage = themeProvider.bannerImage;
    final logo = themeProvider.logo;

    return Container(
      width: 335,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: AppColors.black1A, // #0000001A
            offset: Offset(1, 5),
            blurRadius: 8,
          ),
        ],
        // image: const DecorationImage(
        //   image: AssetImage(
        //     'assets/kucheproduct.jpg',
        //   ), // Replace with your image
        //   fit: BoxFit.cover,
        // ),
        image: DecorationImage(
          image:
              bannerImage != null && bannerImage.startsWith("http")
                  ? NetworkImage(bannerImage) as ImageProvider
                  : const AssetImage('assets/kucheproduct.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 105, // exact width
          height: 54.35, // exact height (54.3539 rounded)
          padding: const EdgeInsets.all(7.98),
          decoration: BoxDecoration(
            color: themeProvider.theme.colorScheme.secondary, // #FFE9EA
            borderRadius: BorderRadius.circular(2.4), // 2.4 px all corners
          ),
          // whatever “gap: 3.99 px” refers to in Figma is handled by this padding
          //child: Image.asset('assets/kuche.png', fit: BoxFit.contain),
          child:
              logo != null && logo.startsWith("http")
                  ? Image.network(logo, fit: BoxFit.contain)
                  : Image.asset('assets/kuche.png', fit: BoxFit.contain),
        ),
      ),
    );
  }
}
