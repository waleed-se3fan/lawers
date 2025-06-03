part of 'issues_bloc.dart';

@immutable
sealed class IssuesEvent {}

final class GetIssuesEvent extends IssuesEvent {}

final class AddNewIssueEvent extends IssuesEvent {
  final String caseNumber;
  final String caseTitle;
  final String caseType;
  final String courtName;
  final String circle;
  final String opponentName;
  final String opponentType;
  final String opponentPhone;
  final String opponentAddress;
  final String opponentNation;
  final String opponentLawyerName;
  final String opponentLawyerPhone;
  final String judgeName;
  final String attorneyNumber;
  final String contractPrice;
  final String notes;
  AddNewIssueEvent({
    required this.caseNumber,
    required this.caseTitle,
    required this.caseType,
    required this.courtName,
    required this.circle,
    required this.opponentName,
    required this.opponentType,
    required this.opponentPhone,
    required this.opponentAddress,
    required this.opponentNation,
    required this.opponentLawyerName,
    required this.opponentLawyerPhone,
    required this.judgeName,
    required this.attorneyNumber,
    required this.contractPrice,
    required this.notes,
  });
}
