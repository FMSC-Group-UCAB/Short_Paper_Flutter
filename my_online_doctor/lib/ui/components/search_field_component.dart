import 'package:flutter/material.dart';
import 'package:my_online_doctor/core/context_manager.dart';
import 'package:my_online_doctor/core/injection_manager.dart';
import 'package:my_online_doctor/ui/styles/colors.dart';

class SearchFieldComponent extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchFieldComponent({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchFieldComponentState createState() => _SearchFieldComponentState();
}

class _SearchFieldComponentState extends State<SearchFieldComponent> {
  final _searchController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {

    getIt<ContextManager>().screenSize = MediaQuery.of(context).size;

    const styleActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: getIt<ContextManager>().screenSize.height * 0.075,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colorWhite,
        border: Border.all(color: colorPrimary),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    _searchController.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}