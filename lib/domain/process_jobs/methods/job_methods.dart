import 'dart:math';
import 'package:intl/intl.dart';

import '../../../repositories/job_model.dart';

class Method {

  List<JobModel> searchJobs(List<JobModel> jobsInHive, String searchString){
    List<JobModel> jobs = [];

    for(JobModel job in jobsInHive){
      if(job.jobTitle.contains(searchString)){
        jobs.add(job);
      }
    }

    return jobs;
  }

  List<JobModel> loadJobs(List<Map<String, dynamic>> jobsInHive){
    List<JobModel> jobs = [];
    for(Map<String, dynamic> job in jobsInHive){
      jobs.add(JobModel.fromJson(job));
    }
    return jobs;
  }

  String generateJobNumber(){
    const prefixCharacters = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    const suffixCharacters = '1234567890';

    Random r = Random();
    String prefix = String.fromCharCodes(Iterable.generate(5, (_) => prefixCharacters.codeUnitAt(r.nextInt(prefixCharacters.length))));
    String suffix = String.fromCharCodes(Iterable.generate(8, (_) => suffixCharacters.codeUnitAt(r.nextInt(suffixCharacters.length))));
    String formattedDate = DateFormat('ddMMyy').format(DateTime.now());

    // Ideally we'd like to check if the combination of prefix and suffix already exist in the DB and generate a new job number if it does

    String result = "$prefix-$suffix$formattedDate";
    return result;
  }

  JobModel updateJob(JobModel job, String newState) {
    JobModel updatedJob = job.copyWith(jobState: newState);
    return updatedJob;
  }
}