import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_application_1/customer/widget/speechbuble.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestCard extends StatefulWidget {
  final String requestNo;
  final String status;
  final String date;
  final String time;
  final String buttonName;
  final VoidCallback onView;
  final bool showView;
  final bool ratingshow;
  final bool shownotapprove;
  final bool showreviewpagelist;
  final int rating;

  const RequestCard({
    super.key,
    required this.requestNo,
    required this.status,
    required this.date,
    required this.time,
    required this.onView,
    this.buttonName = 'View',
    this.showView = true,
    this.ratingshow = false,
    this.shownotapprove = false,
    this.showreviewpagelist = false,
    this.rating = 0,
  });

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  bool _showCustomBubble = false;

  (Color, Color) statusColors(String raw) {
    final key = raw.trim().toLowerCase().replaceAll(RegExp(r'[\s\-_]+'), '');
    switch (key) {
      case 'pending':
        return (AppColors.orange1A, AppColors.orange);
      case 'inprogress':
        return (AppColors.blue1A, AppColors.blue);
      case 'completed':
        return (AppColors.green1A, AppColors.green);
      default:
        return (AppColors.greyE0, AppColors.grey75);
    }
  }

  @override
  Widget build(BuildContext context) {
    final (bgColor, textColor) = statusColors(widget.status);

    return Container(
      width: 335,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: AppColors.black1A,
            offset: Offset(1, 5),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Top Row ───────────────────────────────
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (widget.shownotapprove) {
                      setState(() {
                        _showCustomBubble = !_showCustomBubble;
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        'Request No :',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3,
                          height: 1.4,
                          color: AppColors.grey4F,
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (!widget.shownotapprove)
                        Flexible(
                          child: Text(
                            widget.requestNo,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.3,
                              height: 1.4,
                              color: AppColors.redEE, //const Color(0xFFEE262D),
                            ),
                          ),
                        ),
                      if (widget.shownotapprove)
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    widget.requestNo,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.3,
                                      height: 1.4,
                                      color:
                                          AppColors
                                              .redEE, //const Color(0xFFEE262D),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        AppColors.brown9B, //Color(0xFF9B6161),
                                    child: Icon(
                                      Icons.priority_high,
                                      size: 10,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (_showCustomBubble)
                              Positioned(
                                bottom: 25,
                                right: -118,
                                child: SpeechBubble(
                                  message: 'You are not approve \nthe service!',
                                  background:
                                      AppColors
                                          .redEE, //const Color(0xFFEE262D),
                                  textColor: AppColors.white,
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              widget.showreviewpagelist
                  ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 12),
                      Icon(
                        Icons.star_rounded,
                        size: 20,
                        color: AppColors.amber,
                      ),
                      Icon(
                        Icons.star_rounded,
                        size: 20,
                        color: AppColors.amber,
                      ),
                      Icon(
                        Icons.star_rounded,
                        size: 20,
                        color: AppColors.amber,
                      ),
                      Icon(
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
                  )
                  : Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      widget.status,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                  ),
            ],
          ),

          const SizedBox(height: 5),
          const SizedBox(
            width: 170,
            child: Divider(thickness: 1, color: AppColors.greyE0),
          ),
          const SizedBox(height: 5),

          // ─── Date, Time, View ───────────────
          Row(
            children: [
              Text(
                widget.date,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.grey9E,
                ),
              ),
              const Text('   │   ', style: TextStyle(color: AppColors.grey9E)),
              Text(
                widget.time,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.grey9E,
                ),
              ),
              const Spacer(),

              // Conditional display
              if (widget.showView)
                InkWell(
                  onTap: widget.onView,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                    ), // Ensures right-alignment
                    child: Text(
                      widget.buttonName,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        letterSpacing: -0.3,
                        color: AppColors.blue475,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.blue475,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 1,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 10),

          if (widget.ratingshow)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Review',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.0,
                    letterSpacing: -0.3,
                    color: AppColors.grey545562,
                  ),
                ),
                const SizedBox(width: 12),
                // const Icon(
                //   Icons.star_rounded,
                //   size: 20,
                //   color: AppColors.amber,
                // ),
                // const Icon(
                //   Icons.star_rounded,
                //   size: 20,
                //   color: AppColors.amber,
                // ),
                // const Icon(
                //   Icons.star_rounded,
                //   size: 20,
                //   color: AppColors.amber,
                // ),
                // const Icon(
                //   Icons.star_rounded,
                //   size: 20,
                //   color: AppColors.amber,
                // ),
                // Icon(
                //   Icons.star_rounded,
                //   size: 20,
                //   color: AppColors.greyShade300,
                // ),
                buildRatingStars(widget.rating),
              ],
            ),
        ],
      ),
    );
  }
}

Widget buildRatingStars(int rating) {
  const int maxStars = 5;
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(maxStars, (index) {
      return Icon(
        Icons.star_rounded,
        size: 20,
        color: index < rating ? AppColors.amber : AppColors.greyShade300,
      );
    }),
  );
}
