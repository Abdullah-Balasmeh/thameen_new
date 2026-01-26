import 'package:flutter/material.dart';
import 'package:thameen/generated/l10n.dart';

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
          _infoCard(context, S.of(context).termsIntro),

          const SizedBox(height: 24),

          _section(
            context,
            number: '1',
            title: S.of(context).termsSection1Title,
            body:
                S.of(context).termsSection1Body,
          ),

          _section(
            context,
            number: '2',
            title: S.of(context).termsSection2Title,
            body:
                S.of(context).termsSection2Body,
          ),

          _section(
            context,
            number: '3',
            title: S.of(context).termsSection3Title,
            body:
                S.of(context).termsSection3Body,
          ),

          _section(
            context,
            number: '4',
            title: S.of(context).termsSection4Title,
            body:
                S.of(context).termsSection4Body,
          ),

          _section(
            context,
            number: '5',
            title: S.of(context).termsSection5Title,
            body:
                S.of(context).termsSection5Body,
          ),

          _section(
            context,
            number: '6',
            title: S.of(context).termsSection6Title,
            body:
                S.of(context).termsSection6Body,
          ),

          _section(
            context,
            number: '7',
            title: S.of(context).termsSection7Title,
            body:
                S.of(context).termsSection7Body,
          ),

          _section(
            context,
            number: '8',
            title: S.of(context).termsSection8Title,
            body:
                S.of(context).termsSection8Body,
          ),

          _section(
            context,
            number: '9',
            title: S.of(context).termsSection9Title,
            body:
                S.of(context).termsSection9Body,
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
