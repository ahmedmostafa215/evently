import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/ui/tabs/home/widgets/event_tab_item.dart';
import 'package:evently/ui/tabs/widgets/custom_elevated_button.dart';
import 'package:evently/ui/tabs/widgets/custom_text_field.dart';
import 'package:evently/ui/tabs/widgets/date_or_time.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selectedIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  String formatedDate = '';
  TimeOfDay? selectedTime;
  String formatedTime = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> eventsNameList =[
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    List<String> eventImages =[
      AppAssets.sport,
      AppAssets.birthdayCard,
      AppAssets.meeting,
      AppAssets.gaming,
      AppAssets.workshop,
      AppAssets.bookclub,
      AppAssets.exhibition,
      AppAssets.holiday,
      AppAssets.eating,
    ];
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        title: Text(AppLocalizations.of(context)!.create_event, style: AppStyles.medium20Primary,),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width*0.04,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(eventImages[selectedIndex]),
              ),
              SizedBox(height: height*0.02,),
              SizedBox(
                height: height*0.04,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          selectedIndex = index;
                          setState(() {

                          });
                        },
                        child: EventTabItem(
                          borderColor: AppColors.primaryLight,
                          selectedBgColor: AppColors.primaryLight,
                            isSelected: selectedIndex == index,
                            selectedTextStyle: Theme.of(context).textTheme.displayLarge!,
                            unSelectedTextStyle: Theme.of(context).textTheme.displayMedium!,
                            eventName: eventsNameList[index]
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: width*0.02,);
                    },
                    itemCount: eventsNameList.length),
              ),
              SizedBox(height: height*0.01,),
              Form(
                key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(AppLocalizations.of(context)!.title,
                        style: Theme.of(context).textTheme.titleLarge,),
                      SizedBox(height: height*0.01,),
                      CustomTextField(
                        colorBorderSide: Theme.of(context).cardColor,
                        controller: titleController,
                        validator: (text){
                          if(text == null || text.isEmpty){
                            return AppLocalizations.of(context)!.please_enter_event_title;
                          }
                          return null;
                        },
                        prefixIcon: Image.asset(AppAssets.textEdit,
                        color: Theme.of(context).dividerColor,),
                        hintText: AppLocalizations.of(context)!.event_title,
                        hintStyle: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: height*0.01,),
                      Text(AppLocalizations.of(context)!.description,
                        style: Theme.of(context).textTheme.titleLarge,),
                      SizedBox(height: height*0.01,),
                      CustomTextField(
                        validator: (text){
                          if(text == null || text.isEmpty){
                            return AppLocalizations.of(context)!.please_enter_event_description;
                          }
                          return null;
                        },
                        controller: descriptionController,
                        colorBorderSide: Theme.of(context).cardColor,
                        hintText: AppLocalizations.of(context)!.event_description,
                        hintStyle: Theme.of(context).textTheme.titleMedium,
                        maxLines: 4,
                      ),
                      SizedBox(height: height*0.01,),
                      DateOrTime(
                          iconDateOrTime: AppAssets.dateIcon,
                          eventDateOrTime: AppLocalizations.of(context)!.event_date,
                          chooseDateOrTime: selectedDate == null ?
                          AppLocalizations.of(context)!.choose_date :
                          formatedDate ,
                          onChooseDateOrTime: chooseDate),
                      DateOrTime(
                          iconDateOrTime: AppAssets.timeIcon,
                          eventDateOrTime: AppLocalizations.of(context)!.event_time,
                          chooseDateOrTime: selectedTime == null ?
                          AppLocalizations.of(context)!.choose_time:
                          formatedTime,
                          onChooseDateOrTime: chooseTime),
                      SizedBox(height: height*0.01,),
                      Text(AppLocalizations.of(context)!.location,
                        style: Theme.of(context).textTheme.titleLarge,),
                      SizedBox(height: height*0.01,),
                      InkWell(
                        onTap: (){
                          //todo: navigate to map screen
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: height*0.01
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: width*0.02,
                              vertical: height*0.01
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: AppColors.primaryLight,
                                width: 1
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width*0.03,
                                    vertical: height*0.02
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.primaryLight,),
                                child: Image.asset(AppAssets.locationIcon),
                              ),
                              SizedBox(width: width*0.02,),
                              Text(AppLocalizations.of(context)!.choose_event_location,
                                style: AppStyles.medium16Primary,),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios, color: AppColors.primaryLight,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.01,),
                      CustomElevatedButton(
                          onPressed: () {
                            addEvent();
                          },
                          text: AppLocalizations.of(context)!.add_event),
                      SizedBox(height: height*0.02,),
                    ],
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void chooseDate()async{
    var chooseDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
    selectedDate = chooseDate;
    if(selectedDate != null){
      formatedDate = DateFormat('dd/MM/yyyy').format(selectedDate!);
      setState(() {

      });
    }
  }
  void chooseTime()async{
    var chooseTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    );
    selectedTime = chooseTime;
    if(selectedTime != null){
      formatedTime = selectedTime!.format(context);
      setState(() {

      });
      }
  }
  void addEvent() {
    if (formKey.currentState?.validate()==true){

    }
  }

}

