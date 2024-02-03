part of 'navigation_bar_visibility_bloc.dart';

class NavigationBarVisibilityState extends Equatable{
  final bool isVisible;

  const NavigationBarVisibilityState({
    required this.isVisible
  });

  @override
  List<Object> get props => [isVisible];
}

class UpdateNavigationBarVisibility extends NavigationBarVisibilityState {
  const UpdateNavigationBarVisibility(
      bool isVisible,
  ): super (
    isVisible: isVisible
  );

  @override
  List<Object> get props => [isVisible];
}
