part of 'process_jobs_bloc.dart';

class ProcessJobsState extends Equatable {
  final String jobTitle;
  final String jobType;
  final String clientName;
  final String clientAddress;
  final String jobNumber;
  final String jobDetails;
  final List<TaskModel> tasks;
  final String jobState;
  final String startDate;
  final String endDate;
  final List<JobModel> jobs;

const ProcessJobsState({
  required this.jobTitle,
  required this.jobType,
  required this.clientName,
  required this.clientAddress,
  required this.jobNumber,
  required this.jobDetails,
  required this.tasks,
  required this.jobState,
  required this.startDate,
  required this.endDate,
  required this.jobs,
});

@override
List<Object?> get props => [
  jobTitle,
  jobType,
  clientName,
  clientAddress,
  jobNumber,
  jobDetails,
  tasks,
  jobState,
  startDate,
  endDate,
  jobs,
];

}

class SetInputFieldsToDefaultValues extends ProcessJobsState {

  const SetInputFieldsToDefaultValues(
    String jobTitle,
    String jobType,
    String clientName,
    String clientAddress,
    String jobNumber,
    String jobDetails,
    List<TaskModel> tasks,
    String jobState,
    String startDate,
    String endDate,
    List<JobModel> jobs,
  ) : super (
    jobTitle: jobTitle,
    jobType: jobType,
    clientName: clientName,
    clientAddress: clientAddress,
    jobNumber: jobNumber,
    jobDetails: jobDetails,
    tasks: tasks,
    jobState: jobState,
    startDate: startDate,
    endDate: endDate,
    jobs: jobs
  );

  @override
  List<Object?> get props => [
    jobTitle,
    jobType,
    clientName,
    clientAddress,
    jobNumber,
    jobDetails,
    tasks,
    jobState,
    startDate,
    endDate,
    jobs,
  ];
}

class UpdateClientValues extends ProcessJobsState {

  const UpdateClientValues(
      String jobTitle,
      String jobType,
      String clientName,
      String clientAddress,
      String jobNumber,
      String jobDetails,
      List<TaskModel> tasks,
      String jobState,
      String startDate,
      String endDate,
      List<JobModel> jobs,
      ) : super (
      jobTitle: jobTitle,
      jobType: jobType,
      clientName: clientName,
      clientAddress: clientAddress,
      jobNumber: jobNumber,
      jobDetails: jobDetails,
      tasks: tasks,
      jobState: jobState,
      startDate: startDate,
      endDate: endDate,
      jobs: jobs
  );

  @override
  List<Object?> get props => [
    jobTitle,
    jobType,
    clientName,
    clientAddress,
    jobNumber,
    jobDetails,
    tasks,
    jobState,
    startDate,
    endDate,
    jobs,
  ];
}

class UpdateJobValues extends ProcessJobsState {

  const UpdateJobValues(
      String jobTitle,
      String jobType,
      String clientName,
      String clientAddress,
      String jobNumber,
      String jobDetails,
      List<TaskModel> tasks,
      String jobState,
      String startDate,
      String endDate,
      List<JobModel> jobs,
      ) : super (
      jobTitle: jobTitle,
      jobType: jobType,
      clientName: clientName,
      clientAddress: clientAddress,
      jobNumber: jobNumber,
      jobDetails: jobDetails,
      tasks: tasks,
      jobState: jobState,
      startDate: startDate,
      endDate: endDate,
      jobs: jobs
  );

  @override
  List<Object?> get props => [
    jobTitle,
    jobType,
    clientName,
    clientAddress,
    jobNumber,
    jobDetails,
    tasks,
    jobState,
    startDate,
    endDate,
    jobs,
  ];
}

class LoadJobs extends ProcessJobsState {

  const LoadJobs(
      String jobTitle,
      String jobType,
      String clientName,
      String clientAddress,
      String jobNumber,
      String jobDetails,
      List<TaskModel> tasks,
      String jobState,
      String startDate,
      String endDate,
      List<JobModel> jobs,
      ) : super (
      jobTitle: jobTitle,
      jobType: jobType,
      clientName: clientName,
      clientAddress: clientAddress,
      jobNumber: jobNumber,
      jobDetails: jobDetails,
      tasks: tasks,
      jobState: jobState,
      startDate: startDate,
      endDate: endDate,
      jobs: jobs
  );

  @override
  List<Object?> get props => [
    jobTitle,
    jobType,
    clientName,
    clientAddress,
    jobNumber,
    jobDetails,
    tasks,
    jobState,
    startDate,
    endDate,
    jobs,
  ];
}
