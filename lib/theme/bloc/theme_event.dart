part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  final List paramProps;

  ThemeEvent(this.paramProps) : super();

  @override
  List<Object> get props => paramProps;
}

class ThemeChanged extends ThemeEvent {
  final AppTheme appTheme;

  ThemeChanged({
    @required this.appTheme,
  }) : super([appTheme]);

  @override
  List<Object> get props => [this.appTheme];
}
