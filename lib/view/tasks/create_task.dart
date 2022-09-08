import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_promina/core/style/color/app_colors.dart';

import '../../models/category.dart';

class CreateTaskScreen extends StatefulWidget {
  CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  List<Category> categories = [
    Category(id: "1", name: "Development"),
    Category(id: "2", name: "Research"),
    Category(id: "3", name: "Design"),
    Category(id: "4", name: "Backend"),
    Category(id: "5", name: "UI UX"),
  ];

  String _valueToValidate4 = '';
  String _valueSaved4 = '';
  String _valueChanged4 = '';

  _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.whitBackGroundColor,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 25.w),
          child: IconButton(
              onPressed: () {}, icon: Image.asset("assets/images/menu.png")),
        )
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Create New Task",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.insert_drive_file_outlined, size: 50.sp)
            ],
          ),
          SizedBox(height: 50.h),
          Container(
            margin: EdgeInsets.only(left: 25.w),
            child: Text(
              "Task Name",
              style: TextStyle(color: AppColors.primaryColor, fontSize: 20.sp),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              child: TextFormField(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              )),
          SizedBox(height: 50.h),
          Container(
              margin: EdgeInsets.only(left: 25.w, right: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Category",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "See all",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              )),
          SizedBox(height: 10.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  children: [
                    ...categories.map(
                      (e) => Container(
                        padding: EdgeInsets.all(10.sp),
                        margin: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.primaryColor, width: 1.w),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Text(
                          e.name!,
                          style: const TextStyle(color: AppColors.primaryColor),
                        ),
                      ),
                    )
                  ],
                )),
          ),
          SizedBox(height: 50.h),
          Container(
            margin: EdgeInsets.only(left: 25.w, right: 25.w),
            child: DateTimePicker(
              type: DateTimePickerType.date,
              dateMask: 'd MMM, yyyy',
              initialValue: DateTime.now().toString(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              icon: const Icon(Icons.event),
              dateLabelText: 'Date',
              selectableDayPredicate: (date) {
                if (date.weekday == 6 || date.weekday == 7) {
                  return false;
                }

                return true;
              },
              onChanged: (val) => print(val),
              validator: (val) {
                print(val);
                return null;
              },
              onSaved: (val) => print(val),
            ),
          ),
          SizedBox(height: 50.h),
          Container(
            margin: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Row(
              children: [
                Expanded(
                  child: DateTimePicker(
                    type: DateTimePickerType.time,
                    initialValue: '',
                    timeLabelText: "Start Time",
                    use24HourFormat: false,
                    locale: const Locale('pt', 'BR'),
                    onChanged: (val) => setState(() => _valueChanged4 = val),
                    validator: (val) {
                      setState(() => _valueToValidate4 = val ?? '');
                      return null;
                    },
                    onSaved: (val) => setState(() => _valueSaved4 = val ?? ''),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: DateTimePicker(
                    type: DateTimePickerType.time,
                    initialValue: '',
                    timeLabelText: "End Time",
                    use24HourFormat: false,
                    locale: const Locale('pt', 'BR'),
                    onChanged: (val) => setState(() => _valueChanged4 = val),
                    validator: (val) {
                      setState(() => _valueToValidate4 = val ?? '');
                      return null;
                    },
                    onSaved: (val) => setState(() => _valueSaved4 = val ?? ''),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50.h),
          Container(
            margin: EdgeInsets.only(left: 25.w),
            child: Text(
              "Description",
              style: TextStyle(color: AppColors.primaryColor, fontSize: 20.sp),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              child: TextFormField(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              )),
          SizedBox(height: 50.h),
          Center(
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 25.sp),
                  ),
                ),
                child: Text(
                  "Create Task",
                  style: TextStyle(
                    fontSize: 25.sp,
                  ),
                )),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
