import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

class CustomDropdown<T> extends StatefulWidget {
  final String hint;
  final String label;
  final bool readOnly;
  final List<T>? dataList;
  final String Function(T)? displayText;
  final void Function(T)? onChanged;
  final String? Function(String?)? validator;
  final String? selectedItem;

  const CustomDropdown(
      {Key? key,
      required this.dataList,
      required this.hint,
      required this.label,
      required this.displayText,
      required this.onChanged,
      this.readOnly = false,
      this.validator,
      this.selectedItem})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label, style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 10),
          DropdownButtonFormField<T>(
            value: _selectedItem,
            hint: Text(
              widget.hint,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            items: widget.dataList?.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(widget.displayText!(item),
                    style: Theme.of(context).textTheme.displaySmall),
              );
            }).toList(),
            onChanged: widget.readOnly
                ? null
                : (T? newValue) {
                    setState(() {
                      _selectedItem = newValue;
                    });
                    if (widget.onChanged != null) {
                      widget.onChanged!(newValue as T);
                    }
                  },
            decoration: InputDecoration(
              fillColor: AppColors.primaryFeildColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
