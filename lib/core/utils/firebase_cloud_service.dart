import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event_data.dart';

class FirebaseCloudService {

  static CollectionReference<EventData> _getCollectoinReference() {
    return FirebaseFirestore.instance
        .collection(EventData.collectionName)
        .withConverter<EventData>(
          fromFirestore: (snapshot, options) =>
              EventData.fromFirestore(snapshot.data()!),
          toFirestore: (data, options) => data.toFirestore(),
        );
  }

  static Future<bool> createNewEvent(EventData eventData) {
    try {
      final collectionRef = _getCollectoinReference();
      final docRef = collectionRef.doc();

      eventData.id = docRef.id;

      docRef.set(eventData);
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  static Future<List<EventData>> getEventData() async {
    List<EventData> eventDataList = [];
    final collectionRef = _getCollectoinReference();
    final data = await collectionRef.get();
    eventDataList = data.docs.map((e) => e.data()).toList();
    return eventDataList;
  }

  static Future<List<EventData>> updateEventData(EventData eventData) async {
    final collectionRef = _getCollectoinReference();
    final docRef = collectionRef.doc(eventData.id);
    await docRef.update(eventData.toFirestore());

    return getEventData();
  }

  static Future<List<EventData>> deleteEventData(EventData eventData) {
    final collectionRef = _getCollectoinReference();
    final docRef = collectionRef.doc(eventData.id);
    docRef.delete();
    return getEventData();
  }

  static Stream<QuerySnapshot<EventData>> getRealtimeAllEventData() {
    final collectionRef = _getCollectoinReference();
    return collectionRef.snapshots();
  }

  static Stream<QuerySnapshot<EventData>> getRealtimeEventData(
    String eventID,
  ) {
    final collectionRef = _getCollectoinReference().where(
      'eventID',
      isEqualTo: eventID,
    );
    return collectionRef.snapshots();
  }

  static Stream<QuerySnapshot<EventData>> getRealtimeFavouriteEventData() {
    final collectionRef = _getCollectoinReference().where(
      'isFavorite',
      isEqualTo: true,
    );
    return collectionRef.snapshots();
  }
}
