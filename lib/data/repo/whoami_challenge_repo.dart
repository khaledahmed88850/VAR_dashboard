import 'package:var_dashboard/errors/exceptions.dart';
import 'package:var_dashboard/services/database_services.dart';
import 'package:var_dashboard/utils/firestore_endpoints.dart';

class WhoamiChallengeRepo {
  final DatabaseServices databaseServices;
  const WhoamiChallengeRepo({required this.databaseServices});
  Future<void> addData({required Map<String, dynamic> data}) async {
    try {
      await databaseServices.addData(
        path: FirestoreEndpoints.whoamiChallenge,
        data: data,
      );
    } on Exception {
      throw Customexception(message: 'something went wrong');
    }
  }
}
