part of 'screen_navigation_bloc.dart';

class ScreenNavigationState extends Equatable {
  final int screenIndex;
  final int previousScreenIndex;
  final String screenTitle;
  final String previousScreenTitle;
  final bool isBackButtonActive;
  final int activeBottomNavigationIconIndex;

  const ScreenNavigationState({
    required this.screenIndex,
    required this.previousScreenIndex,
    required this.screenTitle,
    required this.previousScreenTitle,
    required this.isBackButtonActive,
    required this.activeBottomNavigationIconIndex,
  });

  @override
  List<Object?> get props => [screenIndex, previousScreenIndex, screenTitle, previousScreenTitle, isBackButtonActive, activeBottomNavigationIconIndex];
}

class UpdateScreenIndex extends ScreenNavigationState{
  const UpdateScreenIndex(
    int screenIndex,
    int previousScreenIndex,
    String screenTitle,
    String previousScreenTitle,
    bool isBackButtonActive,
    int activeBottomNavigationIcon,
  ) : super (
    screenIndex: screenIndex,
    previousScreenIndex: previousScreenIndex,
    screenTitle: screenTitle,
    previousScreenTitle: previousScreenTitle,
    isBackButtonActive: isBackButtonActive,
    activeBottomNavigationIconIndex: activeBottomNavigationIcon
  );

  @override
  List<Object?> get props => [screenIndex, previousScreenIndex, screenTitle, previousScreenTitle, isBackButtonActive, activeBottomNavigationIconIndex];
}

class UpdateScreenTitle extends ScreenNavigationState{
  const UpdateScreenTitle(
    int screenIndex,
    int previousScreenIndex,
    String screenTitle,
    String previousScreenTitle,
    bool isBackButtonActive,
    int activeBottomNavigationIcon,
  ) : super (
    screenIndex: screenIndex,
    previousScreenIndex: previousScreenIndex,
    screenTitle: screenTitle,
    previousScreenTitle: previousScreenTitle,
    isBackButtonActive: isBackButtonActive,
    activeBottomNavigationIconIndex: activeBottomNavigationIcon
  );

  @override
  List<Object?> get props => [screenIndex, previousScreenIndex, screenTitle, previousScreenTitle, isBackButtonActive, activeBottomNavigationIconIndex];
}

class UpdatePreviousScreenIndex extends ScreenNavigationState{
  const UpdatePreviousScreenIndex(
    int screenIndex,
    int previousScreenIndex,
    String screenTitle,
    String previousScreenTitle,
    bool isBackButtonActive,
    int activeBottomNavigationIcon,
  ) : super (
    screenIndex: screenIndex,
    previousScreenIndex: previousScreenIndex,
    screenTitle: screenTitle,
    previousScreenTitle: previousScreenTitle,
    isBackButtonActive: isBackButtonActive,
    activeBottomNavigationIconIndex: activeBottomNavigationIcon
  );

  @override
  List<Object?> get props => [screenIndex, previousScreenIndex, screenTitle, previousScreenTitle, isBackButtonActive, activeBottomNavigationIconIndex];
}

class UpdateActiveNavigationIconIndex extends ScreenNavigationState{
  const UpdateActiveNavigationIconIndex(
    int screenIndex,
    int previousScreenIndex,
    String screenTitle,
    String previousScreenTitle,
    bool isBackButtonActive,
    int activeBottomNavigationIcon,
  ) : super (
    screenIndex: screenIndex,
    previousScreenIndex: previousScreenIndex,
    screenTitle: screenTitle,
    previousScreenTitle: previousScreenTitle,
    isBackButtonActive: isBackButtonActive,
    activeBottomNavigationIconIndex: activeBottomNavigationIcon
  );

  @override
  List<Object?> get props => [screenIndex, previousScreenIndex, screenTitle, previousScreenTitle, isBackButtonActive, activeBottomNavigationIconIndex];
}



