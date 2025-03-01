import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataHandle extends GetxController{

  //text filed data
  var todayDate="${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}".obs;
  var birthDate="".obs;

  //age deffrent data
  var ageYear=0.obs;
  var ageMonths=0.obs;
  var ageDays=0.obs;

  //next birthdat data
  var nextMonth=0.obs;
  var nextDay=0.obs;

  //total details data
  var totalYear=0.obs;
  var totalMonth=0.obs;
  var totalWeek=0.obs;
  var totalDay=0.obs;
  var totalHour=0.obs;
  var totalMinute=0.obs;
  var totalSecond=0.obs;

  //set data in textfiled
  Future<void> setDate({required BuildContext context,required bool isToday}) async {
    var date=await showDatePicker(
        context: context,
        firstDate: DateTime(1950),
        lastDate: DateTime(DateTime.now().year+1)
    );
    if(isToday){
      todayDate.value="${date!.day} - ${date.month} - ${date.year}";
    }else{
      birthDate.value="${date!.day} - ${date.month} - ${date.year}";
    }
  }

  //set the data
  void getCompareAge() {
    // Show error if birth date is not selected
    if (birthDate.value.isEmpty) {
      Get.snackbar("Error", "Please Select Date of Birth.", colorText: Colors.red, backgroundColor: Colors.black);
      return;
    }

    List<String> todayParts = todayDate.value.split(" - ");
    DateTime today = DateTime(
        int.parse(todayParts[2]),
        int.parse(todayParts[1]),
        int.parse(todayParts[0])
    );

    List<String> birthParts = birthDate.value.split(" - ");
    DateTime birth = DateTime(
        int.parse(birthParts[2]),
        int.parse(birthParts[1]),
        int.parse(birthParts[0])
    );

    // अगर जन्मतिथि आज की तारीख से बड़ी है, तो return कर दो
    if (birth.isAfter(today)) {
      Get.snackbar("Error", "Birth date cannot be greater than today.", colorText: Colors.red, backgroundColor: Colors.black);
      return;
    }

    int years = today.year - birth.year;
    int months = today.month - birth.month;
    int days = today.day - birth.day;

    if (days < 0) {
      DateTime previousMonth = DateTime(today.year, today.month, 0);
      days += previousMonth.day;
      months -= 1;
    }

    if (months < 0) {
      years -= 1;
      months += 12;
    }

    ageYear.value = years;
    ageMonths.value = months;
    ageDays.value = days;

    // Get Next Birthday
    DateTime nextBirthday = DateTime(today.year, birth.month, birth.day);
    if (nextBirthday.isBefore(today) || nextBirthday.isAtSameMomentAs(today)) {
      nextBirthday = DateTime(today.year + 1, birth.month, birth.day);
    }

    Duration diff = nextBirthday.difference(today);
    nextMonth.value = (diff.inDays / 30).floor();
    nextDay.value = diff.inDays % 30;

    // Get total details
    Duration totalDiff = today.difference(birth);
    totalYear.value = years;
    totalMonth.value = (years * 12) + months;
    totalWeek.value = (totalDiff.inDays / 7).floor();
    totalDay.value = totalDiff.inDays;
    totalHour.value = totalDiff.inHours;
    totalMinute.value = totalDiff.inMinutes;
    totalSecond.value = totalDiff.inSeconds;

  }

  //clear data
  void setCler(){

    todayDate.value="${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}";
    birthDate.value="";

    ageYear.value=0;
    ageMonths.value=0;
    ageDays.value=0;

    nextMonth.value=0;
    nextDay.value=0;

    totalYear.value=0;
    totalMonth.value=0;
    totalWeek.value=0;
    totalDay.value=0;
    totalHour.value=0;
    totalMinute.value=0;
    totalSecond.value=0;
  }

}