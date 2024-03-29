part of 'process_jobs_bloc.dart';

class ProcessJobsEvent {}

class AddJobEvent extends ProcessJobsEvent{
  final String jobTitle;
  final String jobType;
  final String clientName;
  final String clientAddress;
  final String jobNumber;
  final String jobDetails;
  final String jobState;
  final String startDate;
  final String endDate;

  AddJobEvent({
    required this.jobTitle,
    required this.jobType,
    required this.clientName,
    required this.clientAddress,
    required this.jobNumber,
    required this.jobDetails,
    required this.jobState,
    required this.startDate,
    required this.endDate,
  });
}

class SearchEvent extends ProcessJobsEvent{
  final String searchString;

  SearchEvent({
    required this.searchString,
  });
}

class SetActiveJobEvent extends ProcessJobsEvent{
  final String jobKey;
  final String jobType;
  final String clientName;
  final String clientAddress;
  final String jobNumber;

  SetActiveJobEvent({
    required this.jobKey,
    required this.jobType,
    required this.clientName,
    required this.clientAddress,
    required this.jobNumber,
  });
}

class UpdateClientFieldsEvent extends ProcessJobsEvent{
  final String jobTitle;
  final String jobType;
  final String clientName;
  final String clientAddress;
  final String jobNumber;
  final String jobDetails;
  final String jobState;
  final String startDate;
  final String endDate;

  UpdateClientFieldsEvent({
    required this.jobTitle,
    required this.jobType,
    required this.clientName,
    required this.clientAddress,
    required this.jobNumber,
    required this.jobDetails,
    required this.jobState,
    required this.startDate,
    required this.endDate,
  });
}

class UpdateJobFieldsEvent extends ProcessJobsEvent{
  final String jobTitle;
  final String jobType;
  final String clientName;
  final String clientAddress;
  final String jobNumber;
  final String jobDetails;
  final String jobState;
  final String startDate;
  final String endDate;

  UpdateJobFieldsEvent({
    required this.jobTitle,
    required this.jobType,
    required this.clientName,
    required this.clientAddress,
    required this.jobNumber,
    required this.jobDetails,
    required this.jobState,
    required this.startDate,
    required this.endDate,
  });
}

class SetDefaultJobStateEvent extends ProcessJobsEvent{}

class LoadJobsEvent extends ProcessJobsEvent{}

class ClearJobsEvent extends ProcessJobsEvent{}

class DeleteJobEvent extends ProcessJobsEvent{
  final String jobKey;

  DeleteJobEvent({
    required this.jobKey,
  });
}

class UpdateJobStateEvent extends ProcessJobsEvent{
  final int jobKey;
  final String jobState;

  UpdateJobStateEvent({
    required this.jobKey,
    required this.jobState,
  });
}
