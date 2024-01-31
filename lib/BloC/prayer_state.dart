part of 'prayer_bloc.dart';

@immutable
abstract class PrayerState {}

class PrayerInitial extends PrayerState {}

class PrayerBlocLoading extends PrayerState {}

class PrayerBlocLoaded extends PrayerState {}

class PrayerBlocError extends PrayerState {}
