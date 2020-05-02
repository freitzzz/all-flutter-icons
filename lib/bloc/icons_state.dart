part of 'icons_bloc.dart';

@immutable
abstract class IconsState {}

class IconsInitial extends IconsState {}

class RetrieveIconsSuccess extends IconsState {
  final bool isCupertinoIcons;
  final List<IconModel> icons;

  RetrieveIconsSuccess({this.isCupertinoIcons, this.icons});
}
