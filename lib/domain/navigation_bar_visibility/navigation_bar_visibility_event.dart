part of 'navigation_bar_visibility_bloc.dart';

class NavigationBarVisibilityEvent {}

class UpdateNavigationBarVisibilityEvent extends NavigationBarVisibilityEvent{
  final bool visibility;

  UpdateNavigationBarVisibilityEvent({
    required this.visibility
  });
}
