import 'package:flutter/material.dart';
import 'package:xploreceylon_mobile/constants/colors.dart';

class CustomCheckButton extends StatefulWidget {
  final String label;
  final TextStyle? style;
  final bool initialValue;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckButton({
    super.key,
    this.style,
    required this.label,
    this.initialValue = false,
    this.onChanged,
  });

  @override
  _CustomCheckButtonState createState() => _CustomCheckButtonState();
}

class _CustomCheckButtonState extends State<CustomCheckButton> {
  bool? _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          activeColor: AppColors.primaryColor,
        ),
        Text(widget.label, style: widget.style),
      ],
    );
  }
}
