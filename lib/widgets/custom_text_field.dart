import 'package:flutter/material.dart';
import 'package:xploreceylon_mobile/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String label;
  final IconButton? iconButton;
  final TextInputType? inputType;
  final TextInputAction? textInputAction;
  final Function(String?)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final bool readOnly;
  final String? initialValue;
  final String? value;

  const CustomTextField(
      {Key? key,
      required this.hint,
      required this.label,
      this.iconButton,
      this.obscureText = false,
      this.inputType,
      this.initialValue,
      this.validator,
      this.readOnly = false,
      this.onSaved,
      this.value,
      this.textInputAction,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;

    //--set a initial value--
    if (widget.value != null) {
      _controller.value = TextEditingValue(text: widget.value!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(vertical: 8), // Changed AppPadding.p8 to 8
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label, style: Theme.of(context).textTheme.headlineSmall),
          TextFormField(
            //maxLines: widget.maxLines,
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onFieldSubmitted,
            obscureText: _obscureText,
            cursorColor:
                Colors.grey, // Changed AppColors.lowGrey to Colors.grey
            cursorWidth: 1, // Changed AppSize.s1 to 1
            controller: _controller,
            keyboardType: widget.inputType,
            readOnly: widget.readOnly,
            validator: widget.validator,
            initialValue: widget.initialValue,
            onSaved: widget.onSaved,
            decoration: InputDecoration(
              fillColor: AppColors.primaryFeildColor,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10), // Changed AppPadding.p15 and AppPadding.p10
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffixIcon: widget.iconButton,
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: Theme.of(context).textTheme.displaySmall,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1,
                    color: AppColors
                        .primaryFeildColor), // Changed AppSize.s1 and AppColors.fielBorder to default values
                borderRadius:
                    BorderRadius.circular(8), // Changed AppSize.s8 to 8
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1,
                    color: Colors
                        .grey), // Changed AppSize.s1 and AppColors.lowGrey to default values
                borderRadius:
                    BorderRadius.circular(8), // Changed AppSize.s8 to 8
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1,
                    color: Colors
                        .red), // Changed AppSize.s1 and AppColors.errorRed to default values
                borderRadius:
                    BorderRadius.circular(8), // Changed AppSize.s8 to 8
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1,
                    color: Colors
                        .red), // Changed AppSize.s1 and AppColors.errorRed to default values
                borderRadius:
                    BorderRadius.circular(8), // Changed AppSize.s8 to 8
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
