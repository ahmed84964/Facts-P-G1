part of 'fact_cubit.dart';

@immutable
sealed class FactState {}

final class FactInitial extends FactState {}
final class FactLoading extends FactState {}
final class FactSuccess extends FactState {
  final FactModel model;
  FactSuccess(this.model);

}
final class FactError extends FactState {
  final String error;
  final String error_message;

  FactError(this.error, this.error_message) {
  }
}
