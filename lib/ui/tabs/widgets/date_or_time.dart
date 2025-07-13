import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DateOrTime extends StatelessWidget {
  String iconDateOrTime;
  String eventDateOrTime;
  String chooseDateOrTime;
  VoidCallback onChooseDateOrTime;
   DateOrTime({
      super.key,
      required this.iconDateOrTime,
      required this.eventDateOrTime,
      required this.chooseDateOrTime,
      required this.onChooseDateOrTime,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Image.asset(iconDateOrTime, color: Theme.of(context).canvasColor,),
        SizedBox(width: width * 0.04,),
        Text(eventDateOrTime,style: Theme.of(context).textTheme.titleLarge,),
        Spacer(),
        TextButton(
            onPressed: () {
              onChooseDateOrTime();
            },
            child: Text(chooseDateOrTime,
              style: AppStyles.medium16Primary,)),
      ],
    );
  }
}
