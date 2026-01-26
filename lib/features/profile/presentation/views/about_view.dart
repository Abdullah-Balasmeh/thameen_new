import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/assets.dart';
import 'package:thameen/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});
  static const routeName = 'about_view';
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          S.of(context).about,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Logo and Info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              color: Theme.of(context).cardColor,
              child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: SvgPicture.asset(
                      Assets.imagesLogoSvg,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    S.of(context).lostAndFoundPlatform,
                    style: AppTextStyle.medium16.copyWith(
                      color: AppTextStyle.medium14.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    S.of(context).version,
                    style: AppTextStyle.medium14.copyWith(
                      color: AppTextStyle.medium14.color,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Mission
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).ourMission,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      S.of(context).ourMissionDescription,
                      style: AppTextStyle.medium14.copyWith(
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Features
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).keyFeatures,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _FeatureItem(
                    icon: Icons.search,
                    title: S.of(context).aiPoweredSearch,
                    description:
                        S.of(context).aiPoweredSearchDescription,
                  ),
                  _FeatureItem(
                    icon: Icons.post_add,
                    title: S.of(context).easyReporting,
                    description: S.of(context).easyReportingDescription,
                  ),
                  _FeatureItem(
                    icon: Icons.chat_bubble_outline,
                    title: S.of(context).directChat,
                    description: S.of(context).directChatDesc,
                  ),
                  _FeatureItem(
                    icon: Icons.notifications_active,
                    title: S.of(context).smartNotifications,
                    description: S.of(context).smartNotificationsDescription,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Social Media
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).connectWithUs,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _SocialButton(
                          icon: Icons.facebook,
                          color: const Color(0xFF1877F2),
                          onTap: () =>
                              _launchURL('https://facebook.com/thameenapp'),
                        ),
                        _SocialButton(
                          icon: Icons.facebook, // Use twitter icon if available
                          color: const Color(0xFF1DA1F2),
                          onTap: () =>
                              _launchURL('https://twitter.com/thameenapp'),
                        ),
                        _SocialButton(
                          icon: Icons.camera_alt, // Instagram
                          color: const Color(0xFFE4405F),
                          onTap: () =>
                              _launchURL('https://instagram.com/thameenapp'),
                        ),
                        _SocialButton(
                          icon: Icons.language,
                          color: AppColors.primary,
                          onTap: () => _launchURL('https://thameenapp.com'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Legal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _LegalLink(
                    title: S.of(context).termsOfService,
                    onTap: () {
                      // TODO: Navigate to terms of service
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(S.of(context).termsOfService)),
                      );
                    },
                  ),
                  _LegalLink(
                    title: S.of(context).privacyPolicy,
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to privacy screen
                    },
                  ),
                  _LegalLink(
                    title: S.of(context).licenses,
                    onTap: () {
                      showLicensePage(
                        context: context,
                        applicationName: S.of(context).thameen,
                        applicationVersion: '1.0.0',
                        applicationLegalese:
                            S.of(context).applicationLegalese,
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Copyright
            Center(
              child: Column(
                children: [
                  Text(
                    S.of(context).copyright,
                    style: AppTextStyle.medium12.copyWith(
                      color: AppTextStyle.medium14.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    S.of(context).allRightsReserved,
                    style: AppTextStyle.medium12.copyWith(
                      color: AppTextStyle.medium14.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    S.of(context).madeInJordan,
                    style: AppTextStyle.medium12.copyWith(
                      color: AppTextStyle.medium14.color,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppTextStyle.medium14.color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: AppTextStyle.medium14.copyWith(
                    color: AppColors.darkTextSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color, size: 28),
      ),
    );
  }
}

class _LegalLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _LegalLink({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyle.medium16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
