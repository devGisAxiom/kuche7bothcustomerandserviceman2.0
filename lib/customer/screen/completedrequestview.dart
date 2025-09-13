import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:flutter_application_1/customer/screen/reviewlistpage.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_application_1/customer/widget/attachmenttile.dart';
// import 'package:flutter_application_1/customer/widget/attachmenttile.dart';
import 'package:flutter_application_1/customer/widget/customappbar.dart';
import 'package:flutter_application_1/customer/widget/loginbutton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompletedrequestView extends StatefulWidget {
  final bool show;
  const CompletedrequestView({super.key, this.show = false});

  @override
  State<CompletedrequestView> createState() => _CompletedrequestViewState();
}

class _CompletedrequestViewState extends State<CompletedrequestView> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CommonAppBar(
              title: themeProvider.brandName ?? "Default Brand",
              backgroundColor: theme.colorScheme.primary,
              circlecolor:
                  themeProvider.brandName == "Ventura"
                      ? Colors.white
                      : theme.colorScheme.secondary,
              arrowcolor: theme.colorScheme.primary,
            ),

            Container(
              width: MediaQuery.of(context).size.width, // Make it responsive

              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(37),
                  topRight: Radius.circular(37),
                ),
              ),

              // --- Content inside the panel ---
              child: Column(
                mainAxisSize: MainAxisSize.min, // Adjust height to content
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      // ─── left-hand cluster ───
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ID:',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.0,
                              letterSpacing: -0.3,
                              color: AppColors.grey545562,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'K7-1023',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.0,
                              letterSpacing: 0,
                              color: AppColors.redEE,
                            ),
                          ),
                        ],
                      ),
                      if (!widget.show)
                        const Spacer(), // ← automatically takes the extra space
                      // ─── right-hand status ───
                      if (!widget.show)
                        Text(
                          'Approved!',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.0,
                            letterSpacing: 0,
                            color: AppColors.green,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (widget.show)
                    Theme(
                      data: Theme.of(context).copyWith(
                        checkboxTheme: CheckboxThemeData(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: BorderSide(
                            color: AppColors.colorswith,
                            width: 1,
                          ),
                          fillColor: WidgetStateProperty.resolveWith((states) {
                            if (states.contains(WidgetState.selected)) {
                              return AppColors
                                  .greens; // Background when checked
                            }
                            return AppColors.white; // Background when unchecked
                          }),
                          checkColor: MaterialStateProperty.all(
                            AppColors.white,
                          ), // Tick color
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity:
                              VisualDensity.compact, // Makes checkbox smaller
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'You can approve service',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.0, // 100% line-height
                              letterSpacing: -0.3,
                              // Equivalent to background: #000000
                              color:
                                  AppColors
                                      .black000, // Text color to contrast the background
                            ),
                          ),
                          SizedBox(width: 8),
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  if (widget.show) const SizedBox(height: 20),
                  Text(
                    "Note",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      letterSpacing: -0.3,
                      color: AppColors.grey545562,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyShade300),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "Cupboard Door Brocken.",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                        letterSpacing: 0,
                        color: AppColors.gry,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    width: 335,
                    child: Divider(
                      height: 1, // total vertical space the Divider takes
                      thickness: 1, // actual line thickness
                      color: AppColors.divcolor, // #EAEAEA
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Product Name :',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.0, // 100% line height
                          letterSpacing: -0.3, // -0.3px
                          color: AppColors.grey545562,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Kuche7 Cupboard',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.0, // 100% line height
                          letterSpacing: 0.0, // 0%
                          color: AppColors.black000, // red text
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Review",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                          letterSpacing: -0.3,
                          color: AppColors.grey545562,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.star_rounded,
                        size: 20,
                        color: AppColors.amber,
                      ),
                      const Icon(
                        Icons.star_rounded,
                        size: 20,
                        color: AppColors.amber,
                      ),
                      const Icon(
                        Icons.star_rounded,
                        size: 20,
                        color: AppColors.amber,
                      ),
                      const Icon(
                        Icons.star_rounded,
                        size: 20,
                        color: AppColors.amber,
                      ),
                      Icon(
                        Icons.star_rounded,
                        size: 20,
                        color: AppColors.greyShade300,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyShade300),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "Cupboard Door Brocken.",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                        letterSpacing: 0,
                        color: AppColors.gry,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // space above button
                  PrimaryButton(
                    label: 'Submit',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Reviewlistpage(),
                        ),
                      );
                    },
                    backgroundColor: theme.colorScheme.primary,
                  ),

                  const SizedBox(height: 20),
                  Text(
                    "Attachment",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      letterSpacing: -0.3,
                      color: AppColors.black000, //const Color(0xFF000108),
                    ),
                  ),

                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                    shrinkWrap: true, // Important
                    physics: const NeverScrollableScrollPhysics(), // Important
                    children: [
                      // attachmentTile(
                      //   context,
                      //   "assets/kucheproduct.jpg",
                      //   "Kitchen1.jpg",
                      //   isVideo: false,
                      // ),
                      // attachmentTile(
                      //   context,
                      //   "assets/kucheproduct.jpg",
                      //   "Kitchen2.jpg",
                      //   isVideo: false,

                      // attachmentTile(

                      //   context,
                      //   "assets/kucheproduct.jpg",
                      //   "Kitchen1Mp4",
                      //   isVideo: true,
                      // ),
                      // attachmentTile(
                      //   context,
                      //   "assets/kucheproduct.jpg",
                      //   "Kitchen2Mp4",
                      //   isVideo: true,
                      // ),
                    ],
                  ),
                  const SizedBox(height: 20), // space above button
                  PrimaryButton(
                    label: 'Cancel Request',
                    onPressed: () {},
                    backgroundColor: AppColors.grey7F,
                  ),
                  const SizedBox(
                    height: 10,
                  ), // Add some padding below the button
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
