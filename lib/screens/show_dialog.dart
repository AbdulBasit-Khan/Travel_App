import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final Widget icon;
  final Widget title;
  final Widget content;
  final DialogAction action;
  final Radius borderRadius = const Radius.circular(5);

  const ResultDialog({Key? key,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
    required this.title,
    required   this.content,
    required this.action
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: buildTitle(context),
      titlePadding: EdgeInsets.zero,

      contentPadding: EdgeInsets.zero,
      content: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: borderRadius,
                  bottomRight: borderRadius
              )
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildContend(context),
                buildActions(context)
              ]
          )
      ),
      backgroundColor: Colors.transparent,
    );

  }

  buildTitle(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: borderRadius,
              topRight: borderRadius
          )
      ),
      //color: color,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: (icon is Icon
                  ? IconTheme.merge(
                  data: IconThemeData(size: 70, color: textColor),
                  child: icon)
                  : icon
              )
          ),
          AnimatedDefaultTextStyle(
              style: (title as Text).style ?? Theme.of(context).textTheme.headline6!.copyWith(color: textColor),
              textAlign: (title as Text).textAlign ?? TextAlign.center,
              duration: kThemeChangeDuration,
              child: title)


        ],
      ),
    );
  }

  buildContend(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      child: (content is Text
          ? AnimatedDefaultTextStyle(
          duration: kThemeChangeDuration,
          textAlign: (content as Text).textAlign ?? TextAlign.center,
          style: const TextStyle(),
          child: content)
          : content
      ),
    );
  }

  buildActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: action.title
              ),
              style: ElevatedButton.styleFrom(
                  primary: backgroundColor,
                  onPrimary: textColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  )
              ),
              onPressed: () => action.performClick(context)
          )
        ],
      ),
    );
  }
}

class DialogAction<T> {

  /// Icon to be listed in the button action.
  final Widget title;

  /// Function that must be executed when the button is clicked, the function
  /// should return the value expected by the dialog.
  final T Function(BuildContext context) action;

  /// Standard constructor of the [DialogAction] class
  DialogAction({
    required this.title,
    required this.action, value
  });

  /// Execute the action of the button click.
  ///
  /// First, the action function will be executed to obtain the return value,
  /// and after the dialog will be closed, returning the obtained value.
  performClick(BuildContext context) async {



    T ?result = ( action(context));
    if (result != null) {
      Navigator.of(context).pop(result);
    }

  }




}