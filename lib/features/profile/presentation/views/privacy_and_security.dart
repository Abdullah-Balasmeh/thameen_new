import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class PrivacySecurityView extends StatelessWidget {
  const PrivacySecurityView({super.key});
  static const routeName = 'privacy_and_security_view';
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
        title: const Text(
          'Privacy & Security',
          style: TextStyle(
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
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                children: [
                  const Icon(
                    Icons.security,
                    size: 80,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Your Privacy Matters',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We are committed to protecting your personal information',
                    style: AppTextStyle.medium14,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            const _SectionTitle('Data Collection'),

            const _ContentCard(
              title: 'What We Collect',
              content:
                  'We collect information you provide when creating an account (name, email, phone number), '
                  'details about lost or found items you report, and photos you upload for AI search purposes.',
            ),

            const _ContentCard(
              title: 'How We Use Your Data',
              content:
                  'Your information is used to:\n'
                  '• Facilitate connections between people who lost and found items\n'
                  '• Improve our AI search capabilities\n'
                  '• Send you notifications about potential matches\n'
                  '• Provide customer support',
            ),

            const SizedBox(height: 16),

            const _SectionTitle('Data Protection'),

            const _ContentCard(
              title: 'Security Measures',
              content:
                  'We use industry-standard encryption to protect your data. '
                  'All communications are secured with SSL/TLS protocols. '
                  'Your passwords are hashed and never stored in plain text.',
            ),

            const _ContentCard(
              title: 'Data Storage',
              content:
                  'Your data is stored on secure servers with regular backups. '
                  'We retain your information only as long as necessary to provide our services '
                  'or as required by law.',
            ),

            const SizedBox(height: 16),

            const _SectionTitle('Your Rights'),

            const _ContentCard(
              title: 'Access & Control',
              content:
                  'You have the right to:\n'
                  '• Access your personal data at any time\n'
                  '• Update or correct your information\n'
                  '• Delete your account and data\n'
                  '• Export your data\n'
                  '• Opt-out of notifications',
            ),

            const _ContentCard(
              title: 'Third-Party Sharing',
              content:
                  'We do NOT sell your personal information to third parties. '
                  'Your contact details are only shared when you choose to contact someone about an item. '
                  'We may share anonymized data for analytics purposes.',
            ),

            const SizedBox(height: 16),

            const _SectionTitle('Contact Privacy'),

            const _ContentCard(
              title: 'When You Contact Others',
              content:
                  'When you tap "Contact Reporter", your email or phone number may be shared '
                  'with the person who posted the item. This is necessary to facilitate communication. '
                  'We recommend using in-app chat for added privacy.',
            ),

            const SizedBox(height: 16),

            const _SectionTitle('Updates to Privacy Policy'),

            const _ContentCard(
              title: 'Policy Changes',
              content:
                  'We may update this privacy policy from time to time. '
                  'You will be notified of any significant changes through the app or via email. '
                  'Continued use of the app constitutes acceptance of the updated policy.',
            ),

            const SizedBox(height: 24),

            // Contact for Privacy Concerns
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.3),
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.contact_support,
                    color: AppColors.primary,
                    size: 40,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Privacy Concerns?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'If you have any questions about our privacy practices, contact us at privacy@thameenapp.com',
                    style: AppTextStyle.medium14,
                    textAlign: TextAlign.center,
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

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class _ContentCard extends StatelessWidget {
  final String title;
  final String content;

  const _ContentCard({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: AppTextStyle.medium14.copyWith(
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
