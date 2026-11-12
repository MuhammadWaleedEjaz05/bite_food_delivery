import 'package:equatable/equatable.dart';

class FaqItemModel extends Equatable {
  final String question;
  final String answer;

  const FaqItemModel({required this.question, required this.answer});

  @override
  List<Object?> get props => [question, answer];
}
