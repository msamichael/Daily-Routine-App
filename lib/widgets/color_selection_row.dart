import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class ColorSelectionRow extends StatelessWidget {
  
  final Function()? blueButtonPressed;
  final Function()? greenButtonPressed;
  final Function()? greyButtonPressed;
  final Function()? purpleButtonPressed;
  final Function()? redButtonPressed;

  const ColorSelectionRow({super.key, 
    
    this.blueButtonPressed,
    this.greenButtonPressed,
    this.greyButtonPressed,
    this.purpleButtonPressed,
    this.redButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    const double colorIndicatorHeight = 30;
    const double colorIndicatorWidth = 30;
    const double colorIndicatorBorderRadius = 20;

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ColorIndicator(
        color: Colors.grey.shade700,
        onSelect: greyButtonPressed,
        height: colorIndicatorHeight,
        width: colorIndicatorWidth,
        borderRadius: colorIndicatorBorderRadius,
      ),
      ColorIndicator(
        color: Colors.blue.shade700,
        onSelect: blueButtonPressed,
        height: colorIndicatorHeight,
        width: colorIndicatorWidth,
        borderRadius: colorIndicatorBorderRadius,
      ),
      ColorIndicator(
        color: Colors.green.shade700,
        onSelect: greenButtonPressed,
        height: colorIndicatorHeight,
        width: colorIndicatorWidth,
        borderRadius: colorIndicatorBorderRadius,
      ),
      
      ColorIndicator(
        color: Colors.purple,
        onSelect: purpleButtonPressed,
        height: colorIndicatorHeight,
        width: colorIndicatorWidth,
        borderRadius: colorIndicatorBorderRadius,
      ),
      ColorIndicator(
        color: Colors.red,
        onSelect: redButtonPressed,
        height: colorIndicatorHeight,
        width: colorIndicatorWidth,
        borderRadius: colorIndicatorBorderRadius,
      ),
    ]);
  }
}
