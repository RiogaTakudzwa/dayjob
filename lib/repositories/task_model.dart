import 'package:equatable/equatable.dart';

class TaskModel extends Equatable{
  final String taskTitle;
  final String jobNumber;
  final String taskDetails;

  const TaskModel({
    required this.taskTitle,
    required this.jobNumber,
    required this.taskDetails,
  });

  @override
  List<Object> get props => [
    taskTitle,
    jobNumber,
    taskDetails
  ];

  factory TaskModel.fromJson(dynamic json) {
    return TaskModel(
      taskTitle: json['taskTitle'] as String,
      jobNumber: json['jobTitle'] as String,
      taskDetails: json['taskDetails'] as String,
    );
  }

  TaskModel copyWith({
    String? taskTitle,
    String? jobNumber,
    String? taskDetails,
  }){
    return TaskModel(
      taskTitle: taskTitle ?? this.taskTitle,
      jobNumber: jobNumber ?? this.jobNumber,
      taskDetails: taskDetails ?? this.taskDetails,
    );
  }

}