import 'package:flutter/material.dart';

class CustomRadioButton<T> extends StatefulWidget {
  final List<T> options;
  final T? initialValue;
  final ValueChanged<T?>? onChanged;
  final String Function(T) labelBuilder;
  final double spacing;

  const CustomRadioButton({
    Key? key,
    required this.options,
    required this.labelBuilder,
    this.initialValue,
    this.onChanged,
    this.spacing = 25.0, // Default spacing is 3.0
  }) : super(key: key);

  @override
  _CustomRadioButtonState<T> createState() => _CustomRadioButtonState<T>();
}

class _CustomRadioButtonState<T> extends State<CustomRadioButton<T>> {
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.options.map((option) {
        return Padding(
          padding: EdgeInsets.only(right: widget.spacing),
          child: Row(
            children: [
              Radio<T>(
                value: option,
                groupValue: _selectedValue,
                onChanged: (T? value) {
                  setState(() {
                    _selectedValue = value;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(value);
                  }
                },
              ),
              Text(widget.labelBuilder(option),
                  style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        );
      }).toList(),
    );
  }
}
