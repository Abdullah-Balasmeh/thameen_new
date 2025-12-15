import 'package:flutter/material.dart';

class TermsConditionViewBody extends StatelessWidget {
  const TermsConditionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Intro Card
          _infoCard(
            context,
            'PLEASE READ THESE TERMS OF SERVICE (“TERMS” OR “AGREEMENT”) CAREFULLY BEFORE USING THE THAMEEN APPLICATION.\n\n'
            'By downloading, accessing, or using the Thameen App (“App”), you agree to these Terms and our Privacy Policy. '
            'If you do not agree, please do not use the App.',
          ),

          const SizedBox(height: 24),

          _section(
            context,
            number: '1',
            title: 'Introduction',
            body:
                'Welcome to Thameen App (“we”, “our”, or “the Company”).\n\n'
                'Thameen is a digital platform designed to help users report, post, and recover lost items within the Hashemite Kingdom of Jordan.',
          ),

          _section(
            context,
            number: '2',
            title: 'Acceptance of Terms',
            body:
                'By accessing or using the Services, you confirm that you have read, understood, and agree to be bound by these Terms. '
                'If you do not agree, you must stop using the application.',
          ),

          _section(
            context,
            number: '3',
            title: 'Eligibility',
            body:
                'Thameen App may be used by minors, provided they use the application in a lawful and responsible manner. '
                'Parents or guardians are encouraged to supervise usage.',
          ),

          _section(
            context,
            number: '4',
            title: 'Service Description',
            body:
                'Thameen App allows users to:\n\n'
                '• Search for lost items\n'
                '• Report items they have found\n'
                '• Connect with item owners or finders\n'
                '• Post descriptions and photos\n'
                '• Receive notifications related to their posts\n\n'
                'Thameen acts solely as a connecting platform and does not guarantee item recovery.',
          ),

          _section(
            context,
            number: '5',
            title: 'User Responsibilities',
            body:
                'Users agree to:\n\n'
                '• Provide accurate information\n'
                '• Avoid misleading or false reports\n'
                '• Respect others and the law\n'
                '• Remove content violating others’ rights\n\n'
                'Users are fully responsible for uploaded content.',
          ),

          _section(
            context,
            number: '6',
            title: 'Prohibited Activities',
            body:
                'You may not:\n\n'
                '• Post stolen or illegal items\n'
                '• Claim items not belonging to you\n'
                '• Upload offensive or harmful content\n'
                '• Scam or deceive users\n'
                '• Hack or disrupt the service\n\n'
                'Violations may lead to suspension or permanent removal.',
          ),

          _section(
            context,
            number: '7',
            title: 'Privacy & Data Usage',
            body:
                'We may collect limited information such as account details, item data, and interactions.\n\n'
                'We do not sell or share user data and comply with Jordanian privacy laws.',
          ),

          _section(
            context,
            number: '8',
            title: 'Limitation of Liability',
            body:
                'Thameen App is provided “as is”. We are not liable for lost items, user interactions, fraud, or technical issues.\n\n'
                'Use of the app is at your own responsibility.',
          ),

          _section(
            context,
            number: '9',
            title: 'Governing Law',
            body:
                'These Terms are governed by the laws of the Hashemite Kingdom of Jordan. '
                'Any disputes shall be resolved according to Jordanian law.',
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  /// ===== Widgets =====

  Widget _section(
    BuildContext context, {
    required String number,
    required String title,
    required String body,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. $title',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          height: 1.6,
        ),
      ),
    );
  }
}
