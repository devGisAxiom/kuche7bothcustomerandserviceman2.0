import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:flutter_application_1/customer/screen/freeservice.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_application_1/customer/widget/brandhomebanner.dart';
import 'package:flutter_application_1/customer/widget/brandhomeiconbutton.dart';
import 'package:flutter_application_1/customer/widget/customappbar.dart';
import 'package:provider/provider.dart';

class BrandHome extends StatelessWidget {
  final void Function(int) onTabChange;
  const BrandHome({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary, //const Color(0xFFEE262D),
      body: Column(
        children: [
          // CommonAppBar(
          //   title: 'Kuche7',
          //   backgroundColor: theme.colorScheme.primary, //Color(0xFFEE262D),

          // ),
          CommonAppBar(
            title: themeProvider.brandName ?? "Default Brand",
            backgroundColor:
                theme.colorScheme.primary, //const Color(0xFFEE262D),
            //circlecolor: theme.colorScheme.secondary,
            circlecolor:
                themeProvider.brandName == "Ventura"
                    ? Colors.white
                    : theme.colorScheme.secondary,
            arrowcolor: theme.colorScheme.primary,
            //arrowcolor: theme.colorScheme.primary,
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 375,
                height: 688,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(37),
                    topRight: Radius.circular(37),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BrandHomeBanner(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ServiceTile(
                            iconAsset: 'assets/icon/service.svg',

                            label: 'Service',
                            onTap: () {
                              onTabChange(1); // 👈 Switch to Service tab
                            },
                          ),
                          ServiceTile(
                            iconAsset: 'assets/icon/freeservice.svg',
                            label: 'Free Service',
                            onTap: () {
                              // onTabChange(1); // You can customize this
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => FreeService(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
