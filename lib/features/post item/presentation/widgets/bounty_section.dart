import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/utils/helper/border_builder.dart';
import 'package:thameen/features/post%20item/presentation/widgets/section_title.dart';

class BountySection extends StatefulWidget {
  const BountySection({
    super.key,
    required this.bountyController,
    required this.autovalidateMode,
    this.offerBountyEdit,
  });

  final TextEditingController bountyController;
  final AutovalidateMode autovalidateMode;
  final bool? offerBountyEdit;

  @override
  State<BountySection> createState() => _BountySectionState();
}

class _BountySectionState extends State<BountySection> {
  final FocusNode _focusNode = FocusNode();
  bool offerBounty = false;
  @override
  void initState() {
    offerBounty = widget.offerBountyEdit ?? false;
    super.initState();
    _focusNode.addListener(() {
      setState(() {}); // rebuild when focus changes
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isFocused = _focusNode.hasFocus;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Bounty (Optional)'),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Offer Bounty?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  RadioGroup<bool>(
                    groupValue: offerBounty,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => offerBounty = value);
                      }
                    },
                    child: const Row(
                      children: [
                        // YES
                        Row(
                          children: [
                            Radio<bool>(
                              value: true,
                              toggleable: false,
                              activeColor: Color(0xff0D61AD),
                            ),
                            Text('Yes'),
                          ],
                        ),

                        SizedBox(width: 8),

                        // NO
                        Row(
                          children: [
                            Radio<bool>(
                              value: false,
                              toggleable: false,
                              activeColor: Color(0xff0D61AD),
                            ),
                            Text('No'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              if (offerBounty) ...[
                const SizedBox(height: 16),
                TextFormField(
                  focusNode: _focusNode,
                  controller: widget.bountyController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Bounty Amount (JOD)',
                    hintText: 'e.g., 50',
                    prefixIcon: Icon(
                      Icons.attach_money,
                      color: isFocused
                          ? AppColors.primary
                          : theme.textTheme.bodyLarge!.color,
                    ),
                    iconColor: isFocused
                        ? AppColors.primary
                        : theme.textTheme.bodyLarge!.color,
                    suffixIconColor: isFocused
                        ? AppColors.primary
                        : theme.textTheme.bodyLarge!.color,
                    prefixIconColor: isFocused
                        ? AppColors.primary
                        : theme.textTheme.bodyLarge!.color,

                    filled: true,
                    fillColor: theme.colorScheme.surface,
                    border: buildBorder(),
                    enabledBorder: buildBorder(),
                    focusedBorder: buildFocusedBorder(),
                    errorBorder: buildErrorBorder(context),
                  ),
                  autovalidateMode: widget.autovalidateMode,
                  validator: (value) {
                    if (offerBounty && (value == null || value.isEmpty)) {
                      return 'Please enter bounty amount';
                    }

                    return null;
                  },
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
