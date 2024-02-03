part of 'screen_navigation_bloc.dart';

class ScreenNavigationEvent {
  const ScreenNavigationEvent();
}

class UpdateScreenIndexEvent extends ScreenNavigationEvent{
  final int index;

  const UpdateScreenIndexEvent({
    required this.index
  });

}

class UpdateScreenTitleEvent extends ScreenNavigationEvent{
  final String screenTitle;

  const UpdateScreenTitleEvent({
    required this.screenTitle
  });

}

class UpdatePreviousScreenIndexEvent extends ScreenNavigationEvent{
  final int previousScreenIndex;

  const UpdatePreviousScreenIndexEvent({
    required this.previousScreenIndex
  });

}

class UpdatePreviousScreenTitleEvent extends ScreenNavigationEvent{
  final String previousScreenTitle;

  const UpdatePreviousScreenTitleEvent({
    required this.previousScreenTitle
  });

}

class UpdateBackButtonStateEvent extends ScreenNavigationEvent{
  final bool isBackButtonActive;

  const UpdateBackButtonStateEvent({
    required this.isBackButtonActive
  });

}

class UpdateActiveNavigationIconIndexEvent extends ScreenNavigationEvent{
  final int activeBottomNavigationIconIndex;

  const UpdateActiveNavigationIconIndexEvent({
    required this.activeBottomNavigationIconIndex
  });

}