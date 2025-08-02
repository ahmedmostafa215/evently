import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event.dart';

class FirebaseUtils{
  static CollectionReference<Event> getEventsCollection(){
    return FirebaseFirestore.instance.collection(Event.collectionName).
    withConverter<Event>(
      fromFirestore: (snapshot, options) => Event.fromFireStore(snapshot.data()!),
      toFirestore: (event, options) => event.toFireStore(),
    );
  }

  static Future <void> addEventToFireStore(Event event){
    //todo:created collection
    CollectionReference<Event> collectionRef = getEventsCollection();
    //todo:created document
    DocumentReference<Event> docRef = collectionRef.doc();
    // todo:assign auto id to event id
    event.id = docRef.id;
    return docRef.set(event);
  }
}