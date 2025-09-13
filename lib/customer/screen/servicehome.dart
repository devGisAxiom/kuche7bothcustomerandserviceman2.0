import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/model/servicelistmodel.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:flutter_application_1/customer/screen/requestdetaildailog.dart';
// import 'package:flutter_application_1/customer/widget/attachmenttile.dart';
import 'package:flutter_application_1/customer/screen/createserviceform.dart';
import 'package:flutter_application_1/customer/screen/completedrequestview.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_application_1/customer/widget/customappbar.dart';
import 'package:flutter_application_1/customer/widget/loginbutton.dart'; // Assuming this file defines PrimaryButton
import 'package:flutter_application_1/customer/widget/requestcard.dart';
import 'package:flutter_application_1/customer/widget/togglebutton.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Service extends StatefulWidget {
  final void Function(int) onTabChange;
  const Service({super.key, required this.onTabChange});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  bool showOpenRequests =
      true; // State to toggle between open and completed requests
  bool showForm = false; // State to show/hide the service request form

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () =>
          Provider.of<ServiceRequestListProvider>(
            context,
            listen: false,
          ).fetchServiceRequests(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          theme
              .colorScheme
              .primary, //const Color(0xFFEE262D), // Scaffold background is red
      body: CustomScrollView(
        // Use CustomScrollView for complex scroll behaviors
        slivers: [
          // The CommonAppBar as a Sliver
          SliverToBoxAdapter(
            child: CommonAppBar(
              onBack: () {
                widget.onTabChange(0); // 👈 Go to Home tab
              },
              title: themeProvider.brandName ?? "Default Brand",
              backgroundColor:
                  theme
                      .colorScheme
                      .primary, //const Color(0xFFEE262D), // AppBar is red
              circlecolor:
                  themeProvider.brandName == "Ventura"
                      ? Colors.white
                      : theme.colorScheme.secondary,
              arrowcolor: theme.colorScheme.primary,
            ),
          ),

          // The main content panel as a Sliver
          SliverFillRemaining(
            // This will fill the remaining space if content is short
            hasScrollBody:
                false, // Indicates this sliver contains scrollable content (though here it's static)
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color:
                    themeProvider.brandName == "Ventura"
                        ? const Color(0xFFEAEAEA) // special case
                        : theme
                            .colorScheme
                            .secondary, //Color(0xFFFDE9EA), // This is the pink background
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(37),
                  topRight: Radius.circular(37),
                ),
              ),
              child: Column(
                // This column holds your main content
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Service',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.3,
                      color: AppColors.black000, //const Color(0xFF000108),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ToggleButton(
                          label: 'Service request',
                          selected: showOpenRequests,
                          onTap: () {
                            setState(() {
                              showOpenRequests = true;
                              showForm = false;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ToggleButton(
                          label: 'Completed request',
                          selected: !showOpenRequests,
                          onTap: () {
                            setState(() {
                              showOpenRequests = false;
                              showForm = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (showForm)
                    CreateServiceForm(
                      onCancel: () {
                        setState(() {
                          showForm = false;
                        });
                      },
                    )
                  else if (showOpenRequests) ...[
                    Consumer<ServiceRequestListProvider>(
                      builder: (context, provider, child) {
                        // if (provider.isLoading) {
                        //   return const Center(
                        //     child: CircularProgressIndicator(),
                        //   );
                        // }
                        if (provider.isLoading) {
                          return Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(height: 10), // spacing above loader
                              Center(child: CircularProgressIndicator()),
                              SizedBox(height: 20),
                            ],
                          );
                        } else if (provider.errorMessage != null) {
                          return Center(child: Text(provider.errorMessage!));
                        }

                        // ✅ get current idProduct from ThemeProvider
                        final idProduct =
                            Provider.of<ThemeProvider>(
                              context,
                              listen: false,
                            ).idProduct;

                        // ✅ filter requests
                        final filteredRequests =
                            provider.requests.where((req) {
                              return req.idProduct == idProduct;
                            }).toList();

                        // if (filteredRequests.isEmpty) {
                        //   return const Center(
                        //     child: Text("No service requests found."),

                        //   );
                        // }
                        if (filteredRequests.isEmpty) {
                          return Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(height: 10),
                              Center(
                                child: Text(
                                  "No service requests found.",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          );
                        }

                        // return Column(
                        //   children: [
                        //     ...filteredRequests.map(
                        //       (request) => Column(
                        //         children: [
                        //           RequestCard(
                        //             requestNo: 'K7-${request.id ?? ""}',
                        //             status: request.status ?? '',
                        //             date: request.createdDate ?? '',
                        //             time: request.createdTime ?? '',
                        //             onView: () {
                        //               showDialog(
                        //                 context: context,
                        //                 barrierDismissible: true,
                        //                 builder: (context) {
                        //                   return RequestDetailDialog();
                        //                 },
                        //               );
                        //             },
                        //             showView: true,
                        //           ),
                        //           const SizedBox(height: 10),
                        //         ],
                        //       ),
                        //     ),
                        //     const SizedBox(height: 10),
                        //   ],
                        // );
                        return Column(
                          children: [
                            ...filteredRequests.map(
                              (request) => Column(
                                children: [
                                  RequestCard(
                                    requestNo: 'K7-${request.id ?? ""}',
                                    status: request.status ?? '',
                                    date: request.createdDate ?? '',
                                    time: request.createdTime ?? '',
                                    onView: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (context) {
                                          return RequestDetailDialog(
                                            requestId: request.id ?? 0,
                                            allRequests: filteredRequests,
                                          ); // ✅ pass request
                                        },
                                      );
                                    },
                                    showView: true,
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),

                    //const SizedBox(height: 20),
                    PrimaryButton(
                      backgroundColor: theme.colorScheme.primary,
                      textColor: theme.colorScheme.onPrimary,
                      label: 'Create Service Request',
                      onPressed: () {
                        setState(() {
                          showForm = true;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                  ] else ...[
                    RequestCard(
                      requestNo: 'K7-0501',
                      status: 'Completed',
                      date: '01/04/2024',
                      time: '11:00 AM',
                      onView: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CompletedrequestView(),
                          ),
                        );
                      },
                      showView: true,
                      ratingshow: true,
                      shownotapprove: false,
                    ),
                    const SizedBox(height: 10),
                    RequestCard(
                      requestNo: 'K7-0415',
                      status: 'Completed',
                      date: '28/03/2024',
                      time: '02:15 PM',
                      onView: () {
                        // MaterialPageRoute(
                        //   builder:
                        //       (context) => CompletedrequestView(show: false),
                        // );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) => CompletedrequestView(show: true),
                          ),
                        );
                      },
                      showView: true,
                      ratingshow: true,
                      shownotapprove: true,
                    ),
                    const SizedBox(height: 20),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
