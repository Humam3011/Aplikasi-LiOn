import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  //get collection of the data
  final CollectionReference notes = FirebaseFirestore.instance.collection('data');


  //CREATE : add new data
  Future<void> addNote(String note) {
    return notes.add({
      'note' : note,
      'timestamp' : Timestamp.now(),
    });
  }

  //READ  : get the data from the database

  //UPDATE : update the data from the database

  //DELETE  : delete the data from the database
}