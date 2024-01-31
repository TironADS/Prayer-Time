part of 'prayer_bloc.dart';

@immutable
abstract class PrayerEvent {}

class FetchPrayer extends PrayerEvent {
  final String location;

  FetchPrayer({required this.location});
}
