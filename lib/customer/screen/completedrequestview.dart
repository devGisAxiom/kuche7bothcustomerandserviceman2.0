import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/customer/povider/reviewacceptprovider.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:flutter_application_1/customer/screen/requestdetaildailog.dart';
import 'package:flutter_application_1/customer/screen/reviewlistpage.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_application_1/customer/widget/attachmenttile.dart';
import 'package:flutter_application_1/customer/widget/audioplayer.dart';
// import 'package:flutter_application_1/customer/widget/attachmenttile.dart';
import 'package:flutter_application_1/customer/widget/customappbar.dart';
import 'package:flutter_application_1/customer/widget/loginbutton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompletedrequestView extends StatefulWidget {
  final bool show;
  final dynamic task;

  const CompletedrequestView({
    super.key,
    this.show = false,
    required this.task,
  });

  @override
  State<CompletedrequestView> createState() => _CompletedrequestViewState();
}

class _CompletedrequestViewState extends State<CompletedrequestView> {
  bool isChecked = false;
  int currentRating = 0;
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    // stores selected star count

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SingleChildScrollView(
        //  padding: const EdgeInsets.only(bottom: 120), // adjustable padding
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
                            'K7-${widget.task.id ?? ""}',
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
                      '${widget.task.note ?? ""}',
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
                        '${widget.task.brand ?? ""}',
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

                  if (widget.task.customerReview == null)
                    Row(
                      children: [
                        Text(
                          "Rating",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.0,
                            letterSpacing: -0.3,
                            color: AppColors.grey545562,
                          ),
                        ),
                        const SizedBox(width: 12),
                        ...List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (currentRating == index + 1) {
                                  // unselect only the last star
                                  currentRating = index;
                                } else {
                                  // select up to this star
                                  currentRating = index + 1;
                                }
                              });
                            },
                            child: Icon(
                              Icons.star_rounded,
                              size: 20,
                              color:
                                  index < currentRating
                                      ? AppColors.amber
                                      : AppColors.greyShade300,
                            ),
                          );
                        }),
                      ],
                    ),
                  if (widget.task.customerReview != null)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Rating",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.0,
                            letterSpacing: -0.3,
                            color: AppColors.grey545562,
                          ),
                        ),
                        const SizedBox(width: 12),

                        // 👇 Spread the List.generate into the children list
                        ...List.generate(5, (index) {
                          int rating =
                              widget.task.customerReview ?? 0; // null-safe
                          return Icon(
                            Icons.star_rounded,
                            size: 20,
                            color:
                                index < rating
                                    ? AppColors.amber
                                    : AppColors.greyShade300,
                          );
                        }),
                      ],
                    ),

                  const SizedBox(height: 20),
                  // const SizedBox(height: 20),
                  if (widget.task.customerNote != null &&
                      widget.task.customerNote!.isNotEmpty)
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
                  if (widget.task.customerNote != null &&
                      widget.task.customerNote!.isNotEmpty)
                    const SizedBox(height: 16),
                  if (widget.task.customerNote != null &&
                      widget.task.customerNote!.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyShade300),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        widget.task.customerNote ?? "NO",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                          letterSpacing: 0,
                          color: AppColors.gry,
                        ),
                      ),
                    ),
                  if (widget.task.customerNote == null &&
                      widget.task.taskAcceptCustomer == 0)
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
                  if (widget.task.customerNote == null &&
                      widget.task.taskAcceptCustomer == 0)
                    const SizedBox(height: 16),
                  if (widget.task.customerNote == null &&
                      widget.task.taskAcceptCustomer == 0)
                    Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight: 80, // 👈 Minimum height
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyShade300),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextField(
                        controller: _noteController,
                        style: const TextStyle(color: Colors.black),
                        maxLines: null, // 👈 allows expansion
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  // if (!widget.show)
                  //if (widget.task.taskAcceptCustomer == 0)
                  if (widget.task.customerNote == null ||
                      widget.task.taskAcceptCustomer == 0)
                    const SizedBox(height: 20), // space above button
                  // if (!widget.show)
                  //if (widget.task.taskAcceptCustomer == 0)
                  if (widget.task.customerNote == null ||
                      widget.task.taskAcceptCustomer == 0)
                    Consumer<TaskProvider>(
                      builder: (context, taskProvider, child) {
                        // Schedule SnackBar for after build
                        if (taskProvider.isLoading == true) {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior:
                                    SnackBarBehavior
                                        .floating, // optional, makes it float
                                margin: const EdgeInsets.all(16),
                                content: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Please wait...",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                // duration: const Duration(minutes: 1),
                              ),
                            );
                          });
                        }
                        // else {
                        //   SchedulerBinding.instance.addPostFrameCallback((_) {
                        //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        //   });
                        // }

                        return PrimaryButton(
                          label: 'Submit',
                          onPressed: () async {
                            final note =
                                (widget.task.customerNote != null &&
                                        widget.task.customerNote!.isNotEmpty)
                                    ? widget.task.customerNote
                                    : _noteController.text;

                            final tick = isChecked ? 1 : 0;

                            final review =
                                (widget.task.customerReview != null)
                                    ? widget.task.customerReview.toString()
                                    : currentRating.toString();

                            await taskProvider.acceptTask(
                              context: context,
                              taskId: widget.task?.taskId?.toString() ?? "",
                              status: tick.toString(),
                              note: note,
                              customerReview: review,
                            );

                            // Handle result
                            if (taskProvider.errorMessage == null) {
                              Navigator.pop(context, true);
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     content: Text("Submitted Successfully "),
                              //   ),
                              // );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Submitted Successfully",
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    9,
                                    101,
                                    12,
                                  ),
                                  behavior:
                                      SnackBarBehavior
                                          .floating, // optional, makes it float
                                  margin: const EdgeInsets.all(
                                    16,
                                  ), // optional, spacing from edges
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  behavior:
                                      SnackBarBehavior
                                          .floating, // optional, makes it float
                                  margin: const EdgeInsets.all(16),
                                  content: Text(
                                    taskProvider.errorMessage!,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              );
                            }
                          },
                          backgroundColor: theme.colorScheme.primary,
                        );
                      },
                    ),
                  const SizedBox(height: 20),
                  if (widget.task.files != null)
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

                  if (widget.task.files != null &&
                      widget.task.files!.any(
                        (file) => file.fileType != "audios",
                      ))
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final files =
                            widget.task.files!
                                .where((file) => file.fileType != "audios")
                                .toList();
                        int rowCount =
                            (files.length / 2).ceil(); // 2 items per row
                        double itemWidth =
                            (constraints.maxWidth - 10) / 2; // spacing
                        double gridHeight =
                            rowCount * itemWidth + (rowCount - 1) * 10;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Grid for images/videos
                            GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children:
                                  files.map<Widget>((file) {
                                    bool isVideo = file.fileType == "videos";

                                    return attachmentTile(
                                      context,
                                      file.file ?? "",
                                      file.file?.split('/').last ?? "File",
                                      isVideo: isVideo,
                                      onTap: () {
                                        if (isVideo && file.file != null) {
                                          showGeneralDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            barrierLabel: "Dismiss",
                                            barrierColor: Colors.black
                                                .withOpacity(0.5),
                                            pageBuilder:
                                                (_, __, ___) => Center(
                                                  child: NetworkVideoPlayer(
                                                    videoUrl: file.file!,
                                                  ),
                                                ),
                                          );
                                        }
                                      },
                                    );
                                  }).toList(), // ✅ type-safe List<Widget>
                            ),

                            const SizedBox(height: 12),

                            // Audio files below
                            if (widget.task.files!.any(
                              (file) => file.fileType == "audios",
                            ))
                              Column(
                                children:
                                    widget.task.files!
                                        .where(
                                          (file) => file.fileType == "audios",
                                        )
                                        .map<Widget>(
                                          (file) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4,
                                            ),
                                            child: AudioMessagePlayer(
                                              url: file.file ?? "",
                                            ),
                                          ),
                                        )
                                        .toList(), // ✅ type-safe List<Widget>
                              ),
                          ],
                        );
                      },
                    ),

                  const SizedBox(
                    height: 240,
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
