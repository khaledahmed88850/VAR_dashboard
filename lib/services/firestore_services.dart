import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:var_dashboard/errors/exceptions.dart';
import 'package:var_dashboard/services/database_services.dart';

class FirestoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      await firestore.collection(path).add(data);
    } catch (e) {
      throw Customexception(message: 'something went wrong');
    }
  }
}
