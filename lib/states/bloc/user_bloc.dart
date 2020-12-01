import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comida/model/model.dart';
import 'package:comida/network/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoadUser) {
      User user = await UserRepository.getUser();

      yield UserLoaded(user);
    }
    else if (event is SignOut) {
      yield UserInitial();
    }
  }
}
