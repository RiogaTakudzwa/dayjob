import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'screen_navigation_event.dart';
part 'screen_navigation_state.dart';

class ScreenNavigationBloc extends Bloc<ScreenNavigationEvent, ScreenNavigationState> {
  ScreenNavigationBloc() : super(const ScreenNavigationState(
    screenIndex: 0,
    previousScreenIndex: 0,
    screenTitle: "Home",
    previousScreenTitle: "Home",
    isBackButtonActive: false,
    activeBottomNavigationIconIndex: 0
  )) {
    on<UpdateScreenIndexEvent>(_onUpdateScreenIndex);
    on<UpdateScreenTitleEvent>(_onUpdateScreenTitle);
    on<UpdatePreviousScreenIndexEvent>(_onUpdatePreviousScreenIndex);
    on<UpdatePreviousScreenTitleEvent>(_onUpdatePreviousScreenTitle);
    on<UpdateBackButtonStateEvent>(_onUpdateBackButtonState);
    on<UpdateActiveNavigationIconIndexEvent>(_onUpdateActiveNavigationIconIndex);
  }

  _onUpdateScreenIndex(event, emit){
    emit(UpdateScreenIndex(
      event.index,
      state.previousScreenIndex,
      state.screenTitle,
      state.previousScreenTitle,
      state.isBackButtonActive,
      state.activeBottomNavigationIconIndex
    ));
  }

  _onUpdateScreenTitle(event, emit){
    emit(UpdateScreenIndex(
      state.screenIndex,
      state.previousScreenIndex,
      event.screenTitle,
      state.previousScreenTitle,
      state.isBackButtonActive,
      state.activeBottomNavigationIconIndex
    ));
  }

  _onUpdatePreviousScreenIndex(event, emit){
    emit(UpdateScreenIndex(
      state.screenIndex,
      event.previousScreenIndex,
      state.screenTitle,
      state.previousScreenTitle,
      state.isBackButtonActive,
      state.activeBottomNavigationIconIndex
    ));
  }

  _onUpdatePreviousScreenTitle(event, emit){
    emit(UpdateScreenIndex(
      state.screenIndex,
      state.previousScreenIndex,
      state.screenTitle,
      event.previousScreenTitle,
      state.isBackButtonActive,
      state.activeBottomNavigationIconIndex
    ));
  }

  _onUpdateBackButtonState(event, emit){
    emit(UpdateScreenIndex(
      state.screenIndex,
      state.previousScreenIndex,
      state.screenTitle,
      state.previousScreenTitle,
      event.isBackButtonActive,
      state.activeBottomNavigationIconIndex
    ));
  }

  _onUpdateActiveNavigationIconIndex(event, emit){
    emit(UpdateScreenIndex(
      state.screenIndex,
      state.previousScreenIndex,
      state.screenTitle,
      state.previousScreenTitle,
      state.isBackButtonActive,
      event.activeBottomNavigationIconIndex
    ));
  }

}
