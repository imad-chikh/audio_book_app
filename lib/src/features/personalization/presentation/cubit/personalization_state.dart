part of 'personalization_cubit.dart';

abstract class PersonalizationState extends Equatable {
  const PersonalizationState();

  @override
  List<Object> get props => [];
}

class PersonalizationInitial extends PersonalizationState {}
