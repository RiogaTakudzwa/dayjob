import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../repositories/job_model.dart';
import '../../repositories/task_model.dart';
import 'methods/job_methods.dart';

part 'process_jobs_event.dart';
part 'process_jobs_state.dart';

class ProcessJobsBloc extends Bloc<ProcessJobsEvent, ProcessJobsState> {

  final jobsBox = Hive.box("Jobs");

  ProcessJobsBloc() : super(ProcessJobsState(
    jobTitle: "Please enter Job Title",
    jobType: "Please enter Job Type",
    clientName: "Please enter Client Name",
    clientAddress: "Please enter Client Address",
    jobNumber: "Job Number",
    jobDetails: "Please enter Job Details",
    tasks: const [],
    jobState: "Job State",
    startDate: DateTime.now().toString(),
    endDate: DateTime.now().toString(),
    jobs: const []
  )) {
    on<AddJobEvent>(_onAddJob);
    on<LoadJobsEvent>(_onLoadJobs);
    on<DeleteJobEvent>(_onDeleteJob);
    on<UpdateJobStateEvent>(_onUpdateJobState);
    on<UpdateJobFieldsEvent>(_onUpdateJobFields);
    on<UpdateClientFieldsEvent>(_onUpdateClientFields);
    on<SetDefaultJobStateEvent>(_onSetDefaultJobState);
    on<SetActiveJobEvent>(_onSetActiveJob);
  }

  _onAddJob(emit, event) async {

    String jobNumber = Method().generateJobNumber as String;

    await jobsBox.add({
      "jobTitle": event.jobTitle,
      "jobType": event.jobType,
      "clientName": event.clientName,
      "clientAddress": event.clientAddress,
      "jobNumber": jobNumber,
      "jobDetails": event.jobDetails,
      "tasks": [],
      "jobState": event.jobState,
      "startDate": event.startDate,
      "endDate": event.endDate,
    });
  }

  _onLoadJobs(emit, event){
    // Open hive box
    final data = jobsBox.keys.map((key) {
      final item = jobsBox.get(key);
      return {
        "key": key,
        "jobTitle": item["jobTitle"],
        "jobType": item["jobType"],
        "clientName": item["clientName"],
        "clientAddress": item["clientAddress"],
        "jobNumber": item["jobNumber"],
        "jobDetails": item["jobDetails"],
        "tasks": [],
        "jobState": item["jobState"],
        "startDate": item["startDate"],
        "endDate": item["endDate"],
      };
    }).toList();

    List<JobModel> jobs = Method().loadJobs(data);

    emit(LoadJobs(
      state.jobTitle,
      state.jobType,
      state.clientName,
      state.clientAddress,
      state.jobNumber,
      state.jobDetails,
      state.tasks,
      state.jobState,
      state.startDate,
      state.endDate,
      jobs,
    ));

  }

  _onDeleteJob(event, emit) async {
    jobsBox.delete(event.jobKey);
  }

  _onUpdateJobState(event, emit) async {

    // Open hive box
    final data = jobsBox.keys.map((key) {
      final item = jobsBox.get(key);
      return {
        "key": key,
        "jobTitle": item["jobTitle"],
        "jobType": item["jobType"],
        "clientName": item["clientName"],
        "clientAddress": item["clientAddress"],
        "jobNumber": item["jobNumber"],
        "jobDetails": item["jobDetails"],
        "tasks": [],
        "jobState": item["jobState"],
        "startDate": item["startDate"],
        "endDate": item["endDate"],
      };
    }).toList();

    //Get the job with the same key
    List<JobModel> listOfJobs = Method().loadJobs(data);
    // JobModel updatedJob = JobModel(
    //   key: 0,
    //   jobTitle: "Please enter Job Title",
    //   jobType: "Please enter Job Type",
    //   clientName: "Please enter Client Name",
    //   clientAddress: "Please enter Client Address",
    //   jobNumber: "Job Number",
    //   jobDetails: "Please enter Job Details",
    //   tasks: const [],
    //   jobState: "Job State",
    //   startDate: DateTime.now().toString(),
    //   endDate: DateTime.now().toString(),
    // );

    for(JobModel job in listOfJobs){
      if(job.key == event.jobKey){
        JobModel updatedJob = Method().updateJob(job, event.jobState);

        // Delete old job
        await jobsBox.delete(event.jobKey);

        // Write updated job
        await jobsBox.add(updatedJob);
      }
    }
  }

  _onSetDefaultJobState(event, emit) async {

    emit(SetInputFieldsToDefaultValues(
      "Please enter Job Title",
      "Please enter Job Type",
      "Please enter Client Name",
      "Please enter Client Address",
      "Job Number",
      "Please enter Job Details",
      state.tasks,
      "Job State",
      DateTime.now().toString(),
      DateTime.now().toString(),
      state.jobs,
    ));

  }

  _onUpdateJobFields(event, emit) async {

    String jobNumber = Method().generateJobNumber as String;

    emit(UpdateJobValues(
      event.jobTitle,
      event.jobType,
      event.clientName,
      event.clientAddress,
      jobNumber,
      event.jobDetails,
      const [],
      event.jobState,
      event.startDate,
      event.endDate,
      state.jobs,
    ));

  }

  _onUpdateClientFields(event, emit) async {

    emit(UpdateClientValues(
      state.jobTitle,
      state.jobType,
      event.clientName,
      event.clientAddress,
      state.jobNumber,
      state.jobDetails,
      const [],
      state.jobState,
      state.startDate,
      state.endDate,
      state.jobs,
    ));

  }

  _onSetActiveJob(event, emit) async {

    emit(UpdateClientValues(
      event.jobTitle,
      event.jobType,
      event.clientName,
      event.clientAddress,
      event.jobNumber,
      event.jobDetails,
      const [],
      event.jobState,
      event.startDate,
      event.endDate,
      event.jobs,
    ));

  }

}
