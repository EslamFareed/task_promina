import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../cubits/main_cubit/main_cubit.dart';
import 'build_drop_down_button.dart';

AppLocalizations getLang(context) {
  return AppLocalizations.of(context)!;
}

class LangSwitch extends StatelessWidget {
  final bool isExpanded;
  final double width;
  const LangSwitch({
    Key? key,
    required this.isExpanded,
    required this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit = MainCubit.get(context);
    return SizedBox(
      width: width,
      child: DefaultDropDownButton(
        values: const ['العربية', 'English'],
        dropDownValue: cubit.language == "ar" ? "العربية" : "English",
        labelText: '',
        isExpanded: isExpanded,
        onChangeFun: (String val) {
          if (val == "العربية") {
            cubit.changeAppLanguage(context, lang: "ar");
          } else if (val == "English") {
            cubit.changeAppLanguage(context, lang: "en");
          }
        },
      ),
    );
  }
}
