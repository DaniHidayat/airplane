// banner_state.dart
import 'package:airplane/models/banner_model.dart';
import 'package:equatable/equatable.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerSuccess extends BannerState {
  final List<BannerModel> data;

  BannerSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class BannerFailed extends BannerState {
  final String error;

  BannerFailed(this.error);

  @override
  List<Object> get props => [error];
}
