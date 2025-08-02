import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DateOrTime extends StatelessWidget {
  final String iconDateOrTime;
  final String eventDateOrTime;
  final String chooseDateOrTime;
  final VoidCallback onChooseDateOrTime;
  final String? errorText;

  const DateOrTime({
    super.key,
    required this.iconDateOrTime,
    required this.eventDateOrTime,
    required this.chooseDateOrTime,
    required this.onChooseDateOrTime,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(iconDateOrTime, color: Theme.of(context).canvasColor),
            SizedBox(width: width * 0.04),
            Text(eventDateOrTime, style: Theme.of(context).textTheme.titleLarge),
            const Spacer(),
            TextButton(
              onPressed: onChooseDateOrTime,
              child: Text(
                chooseDateOrTime,
                style: AppStyles.medium16Primary,
              ),
            ),
          ],
        ),
        if (errorText != null)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(top: height * 0),
              child: Text(
                errorText!,
                style: AppStyles.medium16Primary.copyWith(color: AppColors.redColor),
                textAlign: TextAlign.right,
              ),
            ),
          ),
      ],
    );
  }
}

