import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/model/customerprofile.dart';
import 'package:flutter_application_1/customer/povider/customerprofileprovider.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_application_1/customer/widget/buildoption.dart';
import 'package:flutter_application_1/customer/widget/customappbar.dart';
import 'package:flutter_application_1/customer/widget/iconbadge.dart';
import 'package:flutter_application_1/customer/widget/audioplayer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  final void Function(int) onTabChange;
  const Profile({super.key, required this.onTabChange});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    // Load profile once after widget is created
    Future.microtask(() {
      final provider = context.read<ProfileProvider>();
      if (provider.profile == null && !provider.isLoading) {
        provider.loadProfile(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Column(
        children: [
          CommonAppBar(
            title: themeProvider.brandName ?? "Default Brand",
            backgroundColor: theme.colorScheme.primary,
            onBack: () => widget.onTabChange(0),
            circlecolor:
                themeProvider.brandName == "Ventura"
                    ? Colors.white
                    : theme.colorScheme.secondary,
            arrowcolor: theme.colorScheme.primary,
          ),

          Expanded(
            child: Consumer<ProfileProvider>(
              builder: (context, provider, _) {
                final data = provider.profile?.data;

                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color:
                        themeProvider.brandName == "Ventura"
                            ? const Color(0xFFEAEAEA)
                            : theme.colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(37),
                      topRight: Radius.circular(37),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.3,
                            color: AppColors.black000,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // White card
                        Container(
                          width: 335,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black000.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(1, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Avatar
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: theme.colorScheme.primary,
                                    child: Text(
                                      (data?.name?.isNotEmpty ?? false)
                                          ? data!.name![0].toUpperCase()
                                          : "?",
                                      style: GoogleFonts.poppins(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: theme.colorScheme.secondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              Center(
                                child: Text(
                                  provider.isLoading
                                      ? "Loading..."
                                      : (data?.name ?? 'N/A'),
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black000,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 24),

                              Row(
                                children: [
                                  iconBadge('assets/icon/mailprofile.svg'),
                                  const SizedBox(width: 6),
                                  Flexible(
                                    child: Text(
                                      provider.isLoading
                                          ? "Loading..."
                                          : (data?.contactNumber ?? 'N/A'),
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black000,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '|',
                                    style: TextStyle(color: AppColors.gry),
                                  ),
                                  const SizedBox(width: 10),
                                  iconBadge('assets/icon/callprofile.svg'),
                                  const SizedBox(width: 6),
                                  Flexible(
                                    child: Text(
                                      provider.isLoading
                                          ? "Loading..."
                                          : (data?.email ?? 'N/A'),
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black000,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),

                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Divider(
                                  height: 1,
                                  color: AppColors.grey300,
                                ),
                              ),
                              buildOption('Privacy & Security'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
