import 'package:flutter/material.dart';
import 'package:thameen/features/post%20item/presentation/widgets/report_form.dart';
//import 'package:image_picker/image_picker.dart';

class PostReportViewBody extends StatefulWidget {
  const PostReportViewBody({super.key});

  @override
  State<PostReportViewBody> createState() => _PostReportViewBodyState();
}

class _PostReportViewBodyState extends State<PostReportViewBody>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize animations
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation =
        Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: _fadeController,
            curve: Curves.easeIn,
          ),
        );

    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0.2),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _slideController,
            curve: Curves.easeOutCubic,
          ),
        );

    // Start animations
    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ReportForm(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
