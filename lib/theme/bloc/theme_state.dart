part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final CupertinoThemeData themeData;

  ThemeState({@required this.themeData}) : super();

  @override
  List<Object> get props => [this.themeData];
}
