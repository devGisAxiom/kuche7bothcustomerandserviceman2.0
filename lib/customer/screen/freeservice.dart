import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/model/freeservicemodel.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_application_1/customer/widget/customappbar.dart';
import 'package:flutter_application_1/customer/widget/requestcard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FreeService extends StatefulWidget {
  const FreeService({super.key});

  @override
  State<FreeService> createState() => _FreeServiceState();
}

class _FreeServiceState extends State<FreeService> {
  // @override
  // void initState() {
  //   super.initState();
  //   // Fetch free services
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Provider.of<FreeServiceProvider>(
  //       context,
  //       listen: false,
  //     ).loadFreeServices(context);
  //   });
  // }
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<CommonAppBarState> _commonAppBarKey = GlobalKey();
  late VoidCallback _scrollListener;

  @override
  void initState() {
    super.initState();
    _scrollListener = () => _commonAppBarKey.currentState?.hideTooltip();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
      final freeServiceProvider = Provider.of<FreeServiceProvider>(
        context,
        listen: false,
      );

      // Pass the current product ID
      freeServiceProvider.loadFreeServices(themeProvider.idProduct!, context);

      // Optional: clear idProduct after loading if needed
      // themeProvider.idProduct = null;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final freeServiceProvider = Provider.of<FreeServiceProvider>(context);
    return Scaffold(
      backgroundColor:
          theme
              .colorScheme
              .primary, // const Color(0xFFEE262D), // red background
      body: CustomScrollView(
        controller: _scrollController,
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
              key: _commonAppBarKey,
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
                        color: AppColors.black000,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Loading indicator
                    if (freeServiceProvider.isLoading)
                      const Center(child: CircularProgressIndicator()),

                    // Error message
                    if (freeServiceProvider.errorMessage != null)
                      Text(
                        freeServiceProvider.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),

                    // List of free services
                    if (freeServiceProvider.freeService?.data != null)
                      ...freeServiceProvider.freeService!.data!.map(
                        (service) => Column(
                          children: [
                            RequestCard(
                              requestNo: 'K7-${service.id}',
                              status: service.status ?? 'N/A',
                              date: service.serviceDate ?? 'N/A',
                              time: '', // If API has time, add it here
                              onView: () {},
                              showView: false,
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),

                    const Spacer(),
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
