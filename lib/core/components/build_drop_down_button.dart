import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color/app_colors.dart';
import '../style/text/app_text_style.dart';

class DefaultDropDownButton extends StatefulWidget {
  String dropDownValue;
  double borderSideWidth;
  Function onChangeFun;
  final String labelText;
  final IconData? prefixIcon;
  final List<String> values;
  final bool isExpanded;


  DefaultDropDownButton({
    Key? key,
    this.prefixIcon,
    this.borderSideWidth = 2.0,
    required this.labelText,
    required this.isExpanded,
    required this.dropDownValue,
    required this.values,
    required this.onChangeFun,
  }) : super(key: key);

  @override
  State<DefaultDropDownButton> createState() => _DefaultDropDownButtonState();
}

class _DefaultDropDownButtonState extends State<DefaultDropDownButton> {
  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      focusNode: myFocusNode,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20.0,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              18.0.r,
            ),
          ),
          borderSide: BorderSide(
            width: widget.borderSideWidth,
            color: Colors.grey,
          ),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? AppColors.primaryColor : Colors.grey,
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color:
                    myFocusNode.hasFocus ? AppColors.primaryColor : Colors.grey,
              )
            : null,
      ),
      value: widget.dropDownValue,
      isExpanded: widget.isExpanded,
      onChanged: (String? val) {
        widget.onChangeFun(val);
      },
      items: widget.values.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.subTitle(),
            textAlign: TextAlign.start,
          ),
        );
      }).toList(),
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }
}
