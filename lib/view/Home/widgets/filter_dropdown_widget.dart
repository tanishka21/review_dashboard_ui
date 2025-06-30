import 'package:flutter/material.dart';
import 'package:review_dashboard_ui/utils/app_color.dart';
import 'package:review_dashboard_ui/utils/app_dimensions.dart';
import 'package:review_dashboard_ui/utils/app_style.dart';

class FilterDropdown extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String?> onChanged;
  final String hintText;

  const FilterDropdown({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Sorting Container
        Container(
          height: 38,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing12,
          ),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              AppDimensions.borderRadiusLarge,
            ),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedOption,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.iconColor,
              ),
              style: AppStyles.bodyText2.copyWith(color: AppColors.darkText),
              onChanged: onChanged,
              items:
                  options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              hint: Text(hintText, style: AppStyles.bodyText2),
            ),
          ),
        ),
        AppDimensions.width10,
        // Sorting Icons
        Container(
          height: 38,
          width: 95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: const Color.fromARGB(255, 199, 195, 195),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: IconButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.arrow_upward_outlined, size: 20),
                ),
              ),
              // AppDimensions.width4,
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: IconButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    // backgroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.arrow_downward_outlined, size: 20),
                ),
              ),
            ],
          ),
        ),

        // Container(
        //   height: 38,
        //   width: 85,
        //   decoration: BoxDecoration(
        //     boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
        //     color: const Color.fromARGB(255, 240, 237, 237),
        //     borderRadius: BorderRadius.circular(
        //       AppDimensions.borderRadiusLarge,
        //     ),
        //     border: Border.all(color: AppColors.borderColor),
        //   ),
        //   child: Row(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(left: 3, top: 5, bottom: 5),

        //         child: IconButton(
        //           style: ButtonStyle(
        //             shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        //               RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(
        //                   AppDimensions.borderRadiusLarge,
        //                 ),
        //               ),
        //             ),
        //             backgroundColor: WidgetStateProperty.all(Colors.white),
        //           ),
        //           onPressed: () {},
        //           icon: Icon(
        //             Icons.arrow_upward_outlined,
        //             color: const Color.fromARGB(255, 58, 30, 245),
        //           ),
        //         ),
        //       ),

        //       Padding(
        //         padding: const EdgeInsets.only(top: 2),
        //         child: IconButton(
        //           iconSize: 24.0,
        //           onPressed: () {},
        //           icon: Icon(Icons.arrow_downward_sharp, color: Colors.grey),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
