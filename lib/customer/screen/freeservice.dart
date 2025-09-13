import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_application_1/customer/widget/customappbar.dart';
import 'package:flutter_application_1/customer/widget/requestcard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FreeService extends StatelessWidget {
  const FreeService({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          theme
              .colorScheme
              .primary, // const Color(0xFFEE262D), // red background
      body: CustomScrollView(
        slivers: [
          // AppBar inside sliver
          SliverToBoxAdapter(
            child:
            // CommonAppBar(
            //   title: themeProvider.brandName ?? "Default Brand",
            //   backgroundColor: theme.colorScheme.primary, // Color(0xFFEE262D),
            //   circlecolor: theme.colorScheme.secondary,
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
          ),

          // Fills remaining screen to prevent red bottom
          SliverFillRemaining(
            hasScrollBody: false, // Important for stretch
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color:
                    // theme
                    //     .colorScheme
                    //     .secondary, //AppColors.redFDE, //Color(0xFFFDE9EA), // light pink
                    themeProvider.brandName == "Ventura"
                        ? const Color(0xFFEAEAEA) // special case
                        : theme.colorScheme.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(37),
                  topRight: Radius.circular(37),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Free Service',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                        letterSpacing: -0.3,
                        color: AppColors.black000, //const Color(0xFF000108),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Card list
                    ...List.generate(2, (index) {
                      return Column(
                        children: [
                          RequestCard(
                            requestNo: 'K7-${1000 + index}',
                            status: 'In Progress',
                            date: '15/06/2024',
                            time: '3:45 PM',
                            onView: () {},
                            showView: false,
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    }),

                    const Spacer(), // Push everything up
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
