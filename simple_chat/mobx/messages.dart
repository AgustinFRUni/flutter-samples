import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'messages.g.dart';

//Clase utilizada para mobx
class MessagesStore = _MessagesStore with _$MessagesStore;

abstract class _MessagesStore with Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //Instancia de firebase sobre la que se observa los datos necesarios

  @observable
  ObservableList<DocumentSnapshot> firebaseData =
      ObservableList<DocumentSnapshot>.of([]);

  //Subscripcion del observable a la coleccion deseada
  _MessagesStore() {
    _firestore
        .collection('messages')
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      firebaseData = ObservableList.of(snapshot.docs);
    });
  }

  //Funcion necesaria para enviar mensajes
  @action
  Future<void> addMessage(String enteresMessage) async {
    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    FirebaseFirestore.instance.collection('messages').add({
      'text': enteresMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'userName': userData.data()!['username'],
    });
  }

  @computed
  List<DocumentSnapshot> get sortedFirebaseData =>
      List.from(firebaseData)..sort((a, b) => b.id.compareTo(a.id));
}
