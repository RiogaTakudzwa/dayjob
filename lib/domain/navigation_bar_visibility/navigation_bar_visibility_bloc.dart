import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_bar_visibility_event.dart';
part 'navigation_bar_visibility_state.dart';

class NavigationBarVisibilityBloc extends Bloc<NavigationBarVisibilityEvent, NavigationBarVisibilityState> {
  NavigationBarVisibilityBloc() : super(const NavigationBarVisibilityState(
    isVisible: true
  )) {
    on<UpdateNavigationBarVisibilityEvent>(_onUpdateNavigationBarVisibility);
  }

  _onUpdateNavigationBarVisibility(event, emit){
    emit(UpdateNavigationBarVisibility(event.visibility));
  }
}
