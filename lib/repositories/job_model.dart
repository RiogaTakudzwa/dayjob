import 'package:dayjob/repositories/task_model.dart';
import 'package:equatable/equatable.dart';

class JobModel extends Equatable{
  final int key;
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

  const JobModel({
    required this.key,
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
  });

  @override
  List<Object> get props => [
    key,
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
  ];

  factory JobModel.fromJson(dynamic json) {
    return JobModel(
      key: json['key'] ?? 0,
      jobTitle: json['jobTitle'] ?? "No Title",
      jobType: json['jobType'] ?? "No Job Type",
      clientName: json['clientName'] ?? "No Client Name",
      clientAddress: json['clientAddress'] ?? "No Client Address",
      jobNumber: json['jobNumber'] ?? "No Job Number",
      jobDetails: json['jobDetails'] ?? "No Details",
      tasks: const [],
      jobState: json['jobState'] ?? "No State",
      startDate: json['startDate'] ?? "No Start Date",
      endDate: json['endDate'] ?? "No End Date",
    );
  }

  JobModel copyWith({
    int? key,
    String? jobTitle,
    String? jobType,
    String? clientName,
    String? clientAddress,
    String? jobNumber,
    String? jobDetails,
    List<TaskModel>? tasks,
    String? jobState,
    String? startDate,
    String? endDate,
  }){
    return JobModel(
      key: key ?? this.key,
      jobTitle: jobTitle ?? this.jobTitle,
      jobType: jobType ?? this.jobType,
      clientName: clientName ?? this.clientName,
      clientAddress: clientAddress ?? this.clientAddress,
      jobNumber: jobNumber ?? this.jobNumber,
      jobDetails: jobDetails ?? this.jobDetails,
      tasks: tasks ?? this.tasks,
      jobState: jobState ?? this.jobState,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

}