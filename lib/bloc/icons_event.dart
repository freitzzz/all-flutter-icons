part of 'icons_bloc.dart';

@immutable
abstract class IconsEvent {}

class RetrieveIconsStarted extends IconsEvent {
  final bool isToRetrieveCupertinoIcons;

  RetrieveIconsStarted({this.isToRetrieveCupertinoIcons});
}
