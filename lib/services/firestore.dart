import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:musapp/services/models.dart';

class FirestoreService with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final Reference storageRef =
      FirebaseStorage.instance.ref(dotenv.get("MUSEUM_NAME"));

  Museo? _museo;
  Museo? get museo => _museo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchMuseum() async {
    if (_museo != null) return;
    _isLoading = true;
    notifyListeners();

    var ref = _db.collection('museums').doc(dotenv.get("MUSEUM_NAME"));
    var snapshot = await ref.get();
    var data = snapshot.data();
    Museo museo = Museo.fromJson(data ?? {});

    // populating complete urls for images, audio and video
    if (museo.percorsi != null) {
      await Future.wait(museo.percorsi!.map((percorso) async {
        percorso.imgUrl =
            await storageRef.child(percorso.immagine!).getDownloadURL();
        if (percorso.tappe != null) {
          await Future.wait(percorso.tappe!.map((tappa) async {
            if (tappa.immagine != null) {
              tappa.immagine!.url = await storageRef
                  .child(tappa.immagine!.link)
                  .getDownloadURL();
            }
            if (tappa.audio != null) {
              tappa.audio!.url =
                  await storageRef.child(tappa.audio!.link).getDownloadURL();
            }
            if (tappa.video != null) {
              tappa.video!.url =
                  await storageRef.child(tappa.video!.link).getDownloadURL();
            }
          }));
        }
      }));
    }

    _museo = museo;
    _isLoading = false;

    notifyListeners();
  }
}
