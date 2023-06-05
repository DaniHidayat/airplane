// banner_cubit.dart
import 'package:bloc/bloc.dart';
import '../models/banner_model.dart';
import '../services/banner_service.dart';
import 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());
  void fetchBanner() async {
    try {
      emit(BannerLoading());

      BannerModel Banners = await BannerService().getBanner();
      emit(BannerSuccess(Banners as List<BannerModel>));
    } catch (e) {
      emit(BannerFailed(e.toString()));
    }
  }
}
