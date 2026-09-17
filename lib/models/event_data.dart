class EventData {

  static   String collectionName = "EventCollection";

  String? eventID;
   String id;
   String title;
   String description;
   DateTime selectedDateTime;
   bool isFavorite;

  EventData({
   required this.eventID,
  required this.id,
    required this.title,
  required this.description,
  required this.selectedDateTime,
   this.isFavorite = false,


  });

  factory EventData.fromFirestore(Map<String, dynamic>json){

    return EventData(
      eventID:json["eventID"],
      id:json["id"],
      title:json["title"],
      description:json["description"],
      selectedDateTime:DateTime.fromMillisecondsSinceEpoch(json["selectedDateTime"]),
      isFavorite:json["isFavorite"],


    );


  }
   Map<String, dynamic>toFirestore(){

    return{
      "eventID":eventID,

      "id":id,
      "title":title,
      "description":description,
      "selectedDateTime":selectedDateTime.millisecondsSinceEpoch,
      "isFavorite":isFavorite,

    };
   }


}
