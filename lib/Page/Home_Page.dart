import 'package:age_calculator/Services/DataHandle.dart';
import 'package:age_calculator/Services/Preferences.dart';
import 'package:age_calculator/Services/allData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {

    DataHandle dataHandle=Get.put(DataHandle());

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.defaultDialog(
          radius: 7,
          title: "Exit",
          content: Text("Are You Sure Exit this App."),
          actions: [
            TextButton(onPressed: () {
              Get.back();
            }, child: Text("No,Cancle",style: TextStyle(color: Colors.green),)),
            TextButton(onPressed: () {
              SystemNavigator.pop();
            }, child: Text("Yes,Exit",style: TextStyle(color: Colors.red),))
          ]
        );
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.white
          ),
          backgroundColor: allData.customTealColor,
          centerTitle: true,
          title: Text(
            "title".tr,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Preferences.setLanguage();
                  print(Preferences.getLanguage());
                  print(Preferences.getCountryCode());
                  Get.updateLocale(Locale('${Preferences.getLanguage()}','${Preferences.getCountryCode()}'));
                },
                icon: Icon(Icons.g_translate)
            ),
          ]
        ),
        backgroundColor: allData.customBgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(left: 10,top: 10,right: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "firstTextFiled".tr,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,top: 10,right: 10),
                child: Obx(() => TextField(
                  onTap: ()  {
                    dataHandle.setDate(context: context,isToday: true);
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: dataHandle.todayDate.value.isEmpty
                          ? "DD - MM - YYYY"
                          : dataHandle.todayDate.value,
                      hintStyle: dataHandle.todayDate.value.isNotEmpty?
                                  TextStyle(
                                      color: allData.customTextWhiteColor
                                  ):null,
                      fillColor: allData.customTextfiledBgColor,
                      filled: true,
                      suffixIcon: Icon(Icons.date_range),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey
                          )
                      )
                  ),
                ),),
              ),

              Container(
                margin: EdgeInsets.only(left: 10,top: 20,right: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "secondTextFiled".tr,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,top: 10,right: 10),
                child: Obx(() => TextField(
                  onTap: () {
                    dataHandle.setDate(context: context, isToday: false);
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: dataHandle.birthDate.value.isEmpty?
                                  "DD - MM - YYYY":
                                  dataHandle.birthDate.value,
                      hintStyle: dataHandle.birthDate.value.isNotEmpty?
                                  TextStyle(
                                    color: allData.customTextWhiteColor
                                  ):null,
                      fillColor: allData.customTextfiledBgColor,
                      filled: true,
                      suffixIcon: Icon(Icons.date_range),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey
                          )
                      )
                  ),
                ),),
              ),

              Container(
                margin: EdgeInsets.only(left: 10,top: 10,right: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          dataHandle.setCler();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)
                            ),
                            border: Border.all(
                                color: allData.customBorderColor,
                                width: 2
                            ),
                          ),
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "clearButton".tr,
                            style: TextStyle(
                                fontSize: 25,
                                color: allData.customTextWhiteColor
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          dataHandle.getCompareAge();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)
                            ),
                            border: Border.all(
                                color: allData.customBorderColor,
                                width: 2
                            ),
                            color: allData.customTealColor,
                          ),
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "calculateButton".tr,
                            style: TextStyle(
                                fontSize: 25,
                                color: allData.customTextWhiteColor
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 10,top: 20,right: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "yourAgeTitle".tr,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(
                        color: allData.customBorderColor
                    )
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            Text(
                              "yearTitle".tr,
                              style: TextStyle(
                                  color: allData.customTealColor,
                                  fontSize: 18
                              ),
                            ),
                            Obx(() => Text(
                              "${dataHandle.ageYear.value==0?"00":dataHandle.ageYear.value}",
                              style: TextStyle(
                                  color: allData.customTextWhiteColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                              ),
                              ),
                            )
                          ],
                        )
                    ),
                    Expanded(
                        child: Column(
                          children: [
                            Text(
                              "monthTitle".tr,
                              style: TextStyle(
                                  color: allData.customTealColor,
                                  fontSize: 18
                              ),
                            ),
                            Obx(() {
                              return Text(
                                "${dataHandle.ageMonths.value==0?"00":dataHandle.ageMonths.value}",
                                style: TextStyle(
                                    color: allData.customTextWhiteColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                ),
                              );
                            },)
                          ],
                        )
                    ),
                    Expanded(
                        child: Column(
                          children: [
                            Text(
                              "dayTitle".tr,
                              style: TextStyle(
                                  color: allData.customTealColor,
                                  fontSize: 18
                              ),
                            ),
                            Obx(() => Text(
                              "${dataHandle.ageYear.value==0?"00":dataHandle.ageYear.value}",
                              style: TextStyle(
                                  color: allData.customTextWhiteColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                              ),
                            ),)
                          ],
                        )
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 10,top: 20,right: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "NextBirthdayTitle".tr,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(
                        color: allData.customBorderColor
                    )
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            Text(
                              "monthTitle".tr,
                              style: TextStyle(
                                  color: allData.customTealColor,
                                  fontSize: 18
                              ),
                            ),
                            Obx(
                              () => Text(
                                "${dataHandle.nextMonth.value==0?"00":dataHandle.nextMonth.value}",
                                style: TextStyle(
                                    color: allData.customTextWhiteColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                    Expanded(
                        child: Column(
                          children: [
                            Text(
                              "dayTitle".tr,
                              style: TextStyle(
                                  color: allData.customTealColor,
                                  fontSize: 18
                              ),
                            ),
                            Obx(
                              () => Text(
                                "${dataHandle.nextDay.value==0?"00":dataHandle.nextDay.value}",
                                style: TextStyle(
                                    color: allData.customTextWhiteColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 10,top: 20,right: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "ExtrasTitle".tr,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                          color: allData.customBorderColor
                      )
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TotalYearsTitle".tr,
                            style: TextStyle(
                                color: allData.customTextGreyColor,
                                fontSize: 18
                            ),
                          ),
                          Obx(
                            () => Text(
                              "${dataHandle.totalYear.value}",
                              style: TextStyle(
                                  color: allData.customTextWhiteColor,
                                  fontSize: 18
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TotalMonthsTitle".tr,
                            style: TextStyle(
                                color: allData.customTextGreyColor,
                                fontSize: 18
                            ),
                          ),
                          Obx(
                            () => Text(
                              "${dataHandle.totalMonth.value}",
                              style: TextStyle(
                                  color: allData.customTextWhiteColor,
                                  fontSize: 18
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TotalWeeksTitle".tr,
                            style: TextStyle(
                                color: allData.customTextGreyColor,
                                fontSize: 18
                            ),
                          ),
                          Obx(
                            () => Text(
                              "${dataHandle.totalWeek.value}",
                              style: TextStyle(
                                  color: allData.customTextWhiteColor,
                                  fontSize: 18
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TotalDaysTitle".tr,
                            style: TextStyle(
                                color: allData.customTextGreyColor,
                                fontSize: 18
                            ),
                          ),
                          Obx(
                            () => Text(
                              "${dataHandle.totalDay.value}",
                              style: TextStyle(
                                  color: allData.customTextWhiteColor,
                                  fontSize: 18
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TotalHoursTitle".tr,
                            style: TextStyle(
                                color: allData.customTextGreyColor,
                                fontSize: 18
                            ),
                          ),
                          Obx(
                            () => Text(
                              "${dataHandle.totalHour.value}",
                              style: TextStyle(
                                  color: allData.customTextWhiteColor,
                                  fontSize: 18
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TotalMinutesTitle".tr,
                            style: TextStyle(
                                color: allData.customTextGreyColor,
                                fontSize: 18
                            ),
                          ),
                          Obx(
                            () => Text(
                              "${dataHandle.totalMinute.value}",
                              style: TextStyle(
                                  color: allData.customTextWhiteColor,
                                  fontSize: 18
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TotalSecondsTitle".tr,
                            style: TextStyle(
                                color: allData.customTextGreyColor,
                                fontSize: 18
                            ),
                          ),
                          Obx(
                            () => Text(
                              "${dataHandle.totalSecond.value}",
                              style: TextStyle(
                                  color: allData.customTextWhiteColor,
                                  fontSize: 18
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
