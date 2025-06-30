import 'package:flutter/material.dart';
import 'package:review_dashboard_ui/utils/app_color.dart';
import 'package:review_dashboard_ui/utils/app_dimensions.dart';
import 'package:review_dashboard_ui/utils/app_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.dividerColor,
    this.textColor = AppColors.darkText,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return isOutlined ? _buildOutlinedButton() : _buildElevatedButton();
  }

  Widget _buildOutlinedButton() {
    return SizedBox(
      height: 25,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          textStyle: TextStyle(color: Colors.black),
          // foregroundColor: backgroundColor,
          side: BorderSide(color: backgroundColor, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.borderRadiusDefault,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing20,
            vertical: AppDimensions.spacing12,
          ),
        ),
        child: _buildButtonContent(textColor: backgroundColor),
      ),
    );
  }

  Widget _buildElevatedButton() {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.borderRadiusLarge,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing20,
            vertical: AppDimensions.spacing12,
          ),
          elevation: 2,
        ),
        child: _buildButtonContent(textColor: textColor),
      ),
    );
  }

  Widget _buildButtonContent({required Color textColor}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, color: textColor, size: AppDimensions.iconSizeDefault),
          AppDimensions.width8,
        ],
        Text(text, style: AppStyles.buttonText.copyWith(color: textColor)),
      ],
    );
  }
}
