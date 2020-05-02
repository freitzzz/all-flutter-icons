import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/icons_show.dart';

part 'icons_event.dart';
part 'icons_state.dart';

class IconsBloc extends Bloc<IconsEvent, IconsState> {
  @override
  IconsState get initialState => IconsInitial();

  @override
  Stream<IconsState> mapEventToState(
    IconsEvent event,
  ) async* {
    if (event is RetrieveIconsStarted) {
      yield* _mapRetrieveIconsStartedToState(event);
    }
  }

  Stream<IconsState> _mapRetrieveIconsStartedToState(
      RetrieveIconsStarted event) async* {
    if (event.isToRetrieveCupertinoIcons) {
      yield RetrieveIconsSuccess(isCupertinoIcons: true, icons: cupertinoIcons);
    } else {
      yield RetrieveIconsSuccess(isCupertinoIcons: false, icons: materialIcons);
    }
  }
}
