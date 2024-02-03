import 'package:dayjob/domain/process_jobs/process_jobs_bloc.dart';
import 'package:dayjob/presentation/mobile/screens/create_job/widgets/submit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/constraints/screen_constraits.dart';
import '../../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../../common/widgets/bottom_naviagtion_bar/navigation_bar.dart';
import '../../../../../services/notifications/snackbar/snackbar.dart';
import 'input_field.dart';

class CreateJob extends StatefulWidget {
  const CreateJob({super.key});

  @override
  State<CreateJob> createState() => _CreateJobState();
}

class _CreateJobState extends State<CreateJob> {

  final submitKey = GlobalKey<FormState>();

  TextEditingController jobTitleController = TextEditingController();
  TextEditingController jobTypeController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController clientAddress1Controller = TextEditingController();
  TextEditingController clientAddress2Controller = TextEditingController();
  TextEditingController clientAddress3Controller = TextEditingController();

  submitFunction(){

    final isValid = submitKey.currentState!.validate();

    if(!isValid){
      AppSnackBar.showSnackBar(
        "A field is Missing information"
      );
    }else{
      // Add job
      BlocProvider.of<ProcessJobsBloc>(context).add(AddJobEvent(
        jobTitle: jobTitleController.text,
        jobType:  jobTypeController.text,
        clientName: clientNameController.text,
        clientAddress: "${clientAddress1Controller.text} , ${clientAddress2Controller.text} , ${clientAddress3Controller.text}",
        jobNumber: '',
        jobDetails: '',
        jobState: '',
        startDate: '',
        endDate: ''
      ));
    }
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            screenHeight * ScreenConstraints().appBarHeight
        ), child: const CustomAppBar(),
      ),

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              bottom: screenHeight * ScreenConstraints().screenPaddingBottom
            ),
            height: screenHeight
                - screenHeight * ScreenConstraints().appBarHeight
                - screenHeight * ScreenConstraints().buttonHeight,
            child: SingleChildScrollView(
              child: Form(
                key: submitKey,
                child: Column(
                  children: [
                    TextInputField(
                      textEditingController: jobTitleController,
                      canBeEmpty: false,
                      hintText: "Enter Job Title",
                    ),

                    SizedBox(height: 10),

                    TextInputField(
                      textEditingController: jobTypeController,
                      canBeEmpty: false,
                      hintText: "Enter Job Type",
                    ),

                    SizedBox(height: 10),

                    TextInputField(
                      textEditingController: clientNameController,
                      canBeEmpty: false,
                      hintText: "Enter Client name",
                    ),

                    SizedBox(height: 10),

                    TextInputField(
                      textEditingController: clientAddress1Controller,
                      canBeEmpty: false,
                      hintText: "Enter Client Address 1",
                    ),

                    SizedBox(height: 10),

                    TextInputField(
                      textEditingController: clientAddress2Controller,
                      canBeEmpty: true,
                      hintText: "Enter Client Address 2",
                    ),

                    SizedBox(height: 10),

                    TextInputField(
                      textEditingController: clientAddress3Controller,
                      canBeEmpty: true,
                      hintText: "Enter Client Address 3",
                    ),

                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),

          SubmitButton(
            text: "Submit",
            submit: submitFunction(),
          )

        ],
      ),

    );
  }
}
