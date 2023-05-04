// ignore_for_file: must_be_immutable

part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ShopLoadingHomeDataStata extends HomeState {}

class ShopSuccesHomeDataStata extends HomeState {
  HomeModel DataS;

  ShopSuccesHomeDataStata( this.DataS);
}
