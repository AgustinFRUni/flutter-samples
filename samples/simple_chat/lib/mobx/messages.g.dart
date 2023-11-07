// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MessagesStore on _MessagesStore, Store {
  Computed<List<DocumentSnapshot<Object?>>>? _$sortedFirebaseDataComputed;

  @override
  List<DocumentSnapshot<Object?>> get sortedFirebaseData =>
      (_$sortedFirebaseDataComputed ??=
              Computed<List<DocumentSnapshot<Object?>>>(
                  () => super.sortedFirebaseData,
                  name: '_MessagesStore.sortedFirebaseData'))
          .value;

  late final _$firebaseDataAtom =
      Atom(name: '_MessagesStore.firebaseData', context: context);

  @override
  ObservableList<DocumentSnapshot<Object?>> get firebaseData {
    _$firebaseDataAtom.reportRead();
    return super.firebaseData;
  }

  @override
  set firebaseData(ObservableList<DocumentSnapshot<Object?>> value) {
    _$firebaseDataAtom.reportWrite(value, super.firebaseData, () {
      super.firebaseData = value;
    });
  }

  late final _$addMessageAsyncAction =
      AsyncAction('_MessagesStore.addMessage', context: context);

  @override
  Future<void> addMessage(String enteresMessage) {
    return _$addMessageAsyncAction.run(() => super.addMessage(enteresMessage));
  }

  @override
  String toString() {
    return '''
firebaseData: ${firebaseData},
sortedFirebaseData: ${sortedFirebaseData}
    ''';
  }
}
