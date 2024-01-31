import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/Api/Prayer/PrayerApi.dart';
import '../Repository/Model_Class/PrayerModel.dart';

part 'prayer_event.dart';

part 'prayer_state.dart';

class PrayerBloc extends Bloc<PrayerEvent, PrayerState> {
  PrayerApi prayerApi = PrayerApi();
  late PrayerModel prayerModel;

  PrayerBloc() : super(PrayerInitial()) {
    on<FetchPrayer>((event, emit) async {
      emit(PrayerBlocLoading());
      try {
        prayerModel = await prayerApi.getPrayer(location: event.location);
        emit(PrayerBlocLoaded());
      } catch (e) {
        print(e);
        emit(PrayerBlocError());
      }
    });
  }
}
