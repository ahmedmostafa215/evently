class Event{
  static const String collectionName = 'Events'; //todo: collection name
  // Attributes
  String eventName;
  String title;
  String eventImage;
  String description;
  String id;
  DateTime eventDateTime;
  String eventTime;
  bool isFavourite;

  Event({
    this.id = '',
    required this.title,
    required this.eventImage,
    required this.description,
    required this.eventDateTime,
    required this.eventName,
    required this.eventTime,
    this.isFavourite = false,
  });
  //todo: json to object
  Event.fromFireStore(Map<String, dynamic> data):this(
    id: data['id'],
    title: data['title'],
    description: data['description'],
    eventDateTime: DateTime.fromMillisecondsSinceEpoch(data['event_date_time']),
    eventImage: data['event_image'],
    eventName: data['event_name'],
    eventTime: data['event_time'],
    isFavourite: data['is_favourite'],
  );
  //todo: object to json
  Map<String, dynamic> toFireStore(){
    return {
      'id' : id,
      'title' : title,
      'event_image' : eventImage,
      'description' : description,
      'event_date_time' : eventDateTime.millisecondsSinceEpoch,
      'event_name' : eventName,
      'event_time' : eventTime,
      'is_favourite' : isFavourite
    };
  }
}