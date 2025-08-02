import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/event.dart';
import 'package:evently/utils/firebase_utils.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier{
  List<Event> eventsList = [];
  List<Event> filteredEventsList = [];
  List<String> eventsNameList = [];
  int selectedIndex = 0;

  List<String> getEventNameList (BuildContext context){
    return eventsNameList =[
      AppLocalizations.of(context)!.all,
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
  }
  void getAllEvents()async{
    //todo: get events
    QuerySnapshot<Event> querySnapshot= await FirebaseUtils.getEventsCollection().get();
    eventsList = querySnapshot.docs.map((doc) {
      return doc.data();
    },).toList();
    filteredEventsList = eventsList;
    //todo: sort events
    filteredEventsList.sort((event1, event2) =>
        event1.eventDateTime.compareTo(event2.eventDateTime));
    notifyListeners();
  }
  void getFilteredEvents()async{
    //todo: get events
    var querySnapshot = await FirebaseUtils.getEventsCollection().get();
    querySnapshot.docs.map((doc){
      return doc.data();
    }).toList();
    filteredEventsList = eventsList.where((event) {
      return event.eventName == eventsNameList[selectedIndex];
    },).toList();
    //todo: sort events
    filteredEventsList.sort((event1, event2) =>
        event1.eventDateTime.compareTo(event2.eventDateTime));
    notifyListeners();
  }
  void changeSelectedIndex(int newSelectedIndex){
    selectedIndex = newSelectedIndex;
    selectedIndex == 0 ? getAllEvents() : getFilteredEvents();
  }
}