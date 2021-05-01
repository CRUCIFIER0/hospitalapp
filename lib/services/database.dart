import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hospitalapp/models/Trans.dart';
import 'package:hospitalapp/models/userdetails.dart';

import 'package:hospitalapp/services/auth.dart';

class DatabaseServices{
  final String uid;

  //creating db instance for binder collection
  final AuthService auth = AuthService();

  DatabaseServices({this.uid});
  CollectionReference collectionReference = Firestore.instance.collection("user_details");

  Future initiateDocument() async{
    return await Firestore.instance.collection("user_details").document(uid).setData({});
  }

  Future updateUserData(UserDetails userDetails) async{
    return await Firestore.instance.collection("user_details").document(uid).collection(uid).document(uid).setData(userDetails.toJson());
  }
  Future makerecord(UserDetails userDetails) async{
    return await Firestore.instance.collection("hospitals").document(uid).setData(userDetails.toJson());
  }

  Future maketrans(Trans trans) async{
    return await Firestore.instance.collection("transactions").document(uid).setData(trans.toJson());
  }

  UserDetails userDetailsFromSnapshot(DocumentSnapshot snapshot){
    return UserDetails(
      uid : uid,
      name : snapshot.data['name'],
      type : snapshot.data['type'],
      city: snapshot.data['city'],
      email : snapshot.data['email'],
    );
  }

  Stream<UserDetails> get userDetails{
    return Firestore.instance.collection("user_details").document(uid)
        .snapshots().map(userDetailsFromSnapshot);
  }
}