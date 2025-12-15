import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingPageViewItem extends StatelessWidget {
  const OnBoardingPageViewItem({
    super.key,
    required this.image,
    required this.description,
    required this.title,
  });
  final String image, description;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(image, width: 250),
        const SizedBox(height: 16),
        title,
        const SizedBox(height: 16),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
