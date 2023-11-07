import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'authentication.g.dart';

//Clase utilizada para mobx
class AuthenticationStore = _AuthenticationStore with _$AuthenticationStore;

abstract class _AuthenticationStore with Store {
  final _firebase = FirebaseAuth.instance;
  //Instancia de firebaseauth sobre la que se observa los datos necesarios

  @observable
  User? currentUser; // Usuario actual

  _AuthenticationStore() {
    _firebase.authStateChanges().listen((User? user) {
      currentUser =
          user; // Almacena el usuario actual al cambiar el estado de autenticación
    });
  }

  //En caso de error devuelve el mensaje correspondiente
  //Funcion necesaria para loguear un usuario
  @action
  Future<String?> login(String _enteredEmail, String _enteredPass) async {
    try {
      await _firebase.signInWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPass);
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  //Funcion necesaria para registrar un usuario
  Future<String?> signin(String _enteredEmail, String _enteredPass,
      String _enteredUserName) async {
    try {
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPass);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredentials.user!.uid)
          .set({'username': _enteredUserName});
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }
}
