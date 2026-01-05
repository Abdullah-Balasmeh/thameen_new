import 'package:flutter/material.dart';
import 'package:thameen/core/constants/jordan_cities.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/post%20item/presentation/widgets/drop_down_form_button_city.dart';

class FilterByLocation extends StatelessWidget {
  const FilterByLocation({
    super.key,
    required this.locationController,
  });

  final TextEditingController locationController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter by Location',
          style: AppTextStyle.medium16,
        ),
        const SizedBox(height: 16),

        DropDownFormButtonCity(
          city: jordanCities,
          hintText: 'Select City',
          prefixIcon: const Icon(Icons.location_city),
          keyboardType: TextInputType.text,
          controller: locationController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select an item location';
            }
            return null;
          },
          onChanged: (value) {
            locationController.text = value;
          },
        ),
      ],
    );
  }
}
