import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:flutter_application_1/customer/screen/viewreviewdetailpage.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_application_1/customer/widget/customappbar.dart';
import 'package:flutter_application_1/customer/widget/requestcard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Reviewlistpage extends StatefulWidget {
  const Reviewlistpage({super.key});

  @override
  State<Reviewlistpage> createState() => _ReviewlistpageState();
}

class _ReviewlistpageState extends State<Reviewlistpage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary, // red background
      body: CustomScrollView(
        slivers: [
          // AppBar inside sliver
          SliverToBoxAdapter(
            child: CommonAppBar(
              title: themeProvider.brandName ?? "Default Brand",
              backgroundColor:
                  theme.colorScheme.primary, //const Color(0xFFEE262D),
              circlecolor:
                  themeProvider.brandName == "Ventura"
                      ? Colors.white
                      : theme.colorScheme.secondary,
              arrowcolor: theme.colorScheme.primary,
            ),
          ),

          // Fills remaining screen to prevent red bottom
          SliverFillRemaining(
            hasScrollBody: false, // Important for stretch
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color:
                    themeProvider.brandName == "Ventura"
                        ? const Color(0xFFEAEAEA) // special case
                        : theme.colorScheme.secondary, // light pink
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
                      'Review',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                        letterSpacing: -0.3,
                        color: AppColors.black000,
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
                            onView: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return const ViewReviewDetail();
                                },
                              );
                            },
                            showView: true,
                            buttonName: 'View Review',
                            showreviewpagelist: true,
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
