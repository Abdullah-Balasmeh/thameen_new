import 'package:flutter/material.dart';
import 'package:thameen/features/auth/presentation/widgets/terms_condition_view_body.dart';
import 'package:thameen/generated/l10n.dart';
import 'package:thameen/shared/widgets/app_bar.dart';

class TermsConditionView extends StatelessWidget {
  const TermsConditionView({super.key});
  static const String routeName = 'terms_condition_view';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          showButtonBack: true,
          showButtonActions: false,
          title: S.of(context).termsAndConditionsTitle,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: const TermsConditionViewBody(),
      ),
    );
  }
}
