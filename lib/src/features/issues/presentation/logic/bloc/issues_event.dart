part of 'issues_bloc.dart';

@immutable
sealed class IssuesEvent {}

final class GetIssuesEvent extends IssuesEvent {}
