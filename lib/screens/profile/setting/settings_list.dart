
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_template/utils/colors_const.dart';


const Color mediumGrayColor = Color(0xFFC7C7CC);
const Color itemPressedColor = Color(0xFFD9D9D9);
const Color borderColor = Color(0xFFBCBBC1);
const Color borderLightColor = Color.fromRGBO(49, 44, 51, 1);
const Color backgroundGray = Color(0xFFEFEFF4);
const Color groupSubtitle = Color(0xFF777777);
const Color iosTileDarkColor = Color.fromRGBO(28, 28, 30, 1);
const Color iosPressedTileColorDark = Color.fromRGBO(44, 44, 46, 1);
const Color iosPressedTileColorLight = Color.fromRGBO(230, 229, 235, 1);
// ignore: must_be_immutable
abstract class AbstractSection extends StatelessWidget {
  bool showBottomDivider = false;
  final String? title;
  final Widget? titleWidget;
  final EdgeInsetsGeometry? titlePadding;

  AbstractSection({
    Key? key,
    this.title,
    this.titleWidget,
    this.titlePadding,
  }) : super(key: key);
}

enum SettingsItemType {
  toggle,
  modal,
}

const defaultTitlePadding = EdgeInsets.only(
  left: 15.0,
  right: 15.0,
  bottom: 6.0,
);

const defaultCupertinoForwardIcon = Icon(
  CupertinoIcons.forward,
  size: 21.0,
  color: mediumGrayColor,
);

const defaultCupertinoForwardPadding = EdgeInsetsDirectional.only(
  start: 2.25,
);

typedef PressOperationCallback = void Function();

class CupertinoSettingsItem extends StatefulWidget {
   const CupertinoSettingsItem({Key? key,
    required this.type,
    this.label,
    this.labelWidget,
    this.labelMaxLines,
    this.subtitle,
    this.subtitleWidget,
    this.subtitleMaxLines,
    this.leading,
    this.trailing,
    this.iosChevron = defaultCupertinoForwardIcon,
    this.iosChevronPadding = defaultCupertinoForwardPadding,
    this.value,
    this.valueWidget,
    this.hasDetails = false,
    this.enabled = true,
    this.onPress,
    this.switchValue = false,
    this.onToggle,
    this.labelTextStyle,
    this.subtitleTextStyle,
    this.valueTextStyle,
    this.switchActiveColor,
  })  : assert(labelMaxLines == null || labelMaxLines > 0),
        assert(subtitleMaxLines == null || subtitleMaxLines > 0), super(key: key);

  final String? label;
  final Widget? labelWidget;
  final int? labelMaxLines;
  final String? subtitle;
  final Widget? subtitleWidget;
  final int? subtitleMaxLines;
  final Widget? leading;
  final Widget? trailing;
  final Icon? iosChevron;
  final EdgeInsetsGeometry? iosChevronPadding;
  final SettingsItemType type;
  final String? value;
  final Widget? valueWidget;
  final bool hasDetails;
  final bool enabled;
  final PressOperationCallback? onPress;
  final bool? switchValue;
  final Function(bool value)? onToggle;
  final TextStyle? labelTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? valueTextStyle;
  final Color? switchActiveColor;

  @override
  State<StatefulWidget> createState() => CupertinoSettingsItemState();
}

class CupertinoSettingsItemState extends State<CupertinoSettingsItem> {
  bool pressed = false;
  bool? _checked;

  @override
  Widget build(BuildContext context) {
    _checked = widget.switchValue;

    /// The width of iPad. This is used to make circular borders on iPad and web
    final isLargeScreen = MediaQuery.of(context).size.width >= 768;

    final ThemeData theme = Theme.of(context);
    final ListTileTheme tileTheme = ListTileTheme.of(context) as ListTileTheme;

    final iconThemeData = IconThemeData(
      color: widget.enabled
          ? _iconColor(theme, tileTheme)
          : CupertinoColors.inactiveGray,
    );

    Widget? leadingIcon;
    if (widget.leading != null) {
      leadingIcon = IconTheme.merge(
        data: iconThemeData,
        child: widget.leading!,
      );
    }

    List<Widget> rowChildren = [];
    if (leadingIcon != null) {
      rowChildren.add(
        Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 15.0,
          ),
          child: leadingIcon,
        ),
      );
    }

    final Widget titleSection;
    if (widget.subtitle == null) {
      titleSection = widget.labelWidget ??
          Text(
            widget.label ?? '',
            overflow: TextOverflow.ellipsis,
            style: widget.labelTextStyle ??
                TextStyle(
                  fontSize: 16,
                  color: widget.enabled ? null : CupertinoColors.inactiveGray,
                ),
          );
    } else {
      titleSection = Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.labelWidget ??
              Text(
                widget.label ?? '',
                overflow: TextOverflow.ellipsis,
                style: widget.labelTextStyle,
              ),
          const SizedBox(height: 2.5),
          widget.subtitleWidget ??
              Text(
                widget.subtitle!,
                maxLines: widget.subtitleMaxLines,
                overflow: TextOverflow.ellipsis,
                style: widget.subtitleTextStyle ??
                    const TextStyle(
                      fontSize: 12.0,
                      letterSpacing: -0.2,
                    ),
              ),
        ],
      );
    }

    rowChildren.add(Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 15.0,
          end: 15.0,
        ),
        child: titleSection,
      ),
    ));

    switch (widget.type) {
      case SettingsItemType.toggle:
        rowChildren
          .add(
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 11.0),
              child: CupertinoSwitch(
                value: widget.switchValue!,
                activeColor: widget.enabled
                    ? (widget.switchActiveColor ??
                    ColorsConstants.appColor)
                    : CupertinoColors.inactiveGray,
                onChanged: !widget.enabled
                    ? null
                    : (bool value) {
                  widget.onToggle!(value);
                },
              ),
            ),
          );
        break;

      case SettingsItemType.modal:
        if (widget.value != null) {
          rowChildren.add(
            widget.valueWidget ??
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 1.5,
                      end: 2.25,
                    ),
                    child: Text(
                      widget.value!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: widget.valueTextStyle ??
                          const TextStyle(
                            color: CupertinoColors.inactiveGray,
                            fontSize: 16,
                          ),
                    ),
                  ),
                ),
          );
        }

        final List<Widget> endRowChildren = [];
        if (widget.trailing != null) {
          endRowChildren.add(
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 0.5,
                start: 2.25,
              ),
              child: widget.trailing,
            ),
          );
        }

        final iosChevron = widget.iosChevron;
        if (widget.trailing == null && iosChevron != null) {
          endRowChildren.add(
            widget.iosChevronPadding == null
                ? iosChevron
                : Padding(
              padding: widget.iosChevronPadding!,
              child: iosChevron,
            ),
          );
        }

        endRowChildren.add(const SizedBox(width: 8.5));

        rowChildren.add(
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: endRowChildren,
          ),
        );
        break;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if ((widget.onPress != null || widget.onToggle != null) &&
            widget.enabled) {
          if (mounted) {
            setState(() {
              pressed = true;
            });
          }

          if (widget.onPress != null) {
            widget.onPress!();
          }

          Future.delayed(const Duration(milliseconds: 100), () {
            if (mounted) {
              setState(() {
                pressed = false;
              });
            }
          });
        }

        if (widget.type == SettingsItemType.toggle && widget.enabled) {
          if (mounted) {
            setState(() {
              _checked = !_checked!;
              widget.onPress?.call();
            });
          }
        }
      },
      onTapUp: (_) {
        if (widget.enabled && mounted) {
          setState(() {
            pressed = false;
          });
        }
      },
      onTapDown: (_) {
        if (widget.enabled && mounted) {
          setState(() {
            pressed = true;
          });
        }
      },
      onTapCancel: () {
        if (widget.enabled && mounted) {
          setState(() {
            pressed = false;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
          isLargeScreen ? const BorderRadius.all(Radius.circular(20)) : null,
          color: calculateBackgroundColor(context),
        ),
        height: widget.subtitle == null && widget.subtitleWidget == null
            ? 44.0
            : 57.0,
        child: Row(
          children: rowChildren,
        ),
      ),
    );
  }

  Color calculateBackgroundColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? pressed
          ? iosPressedTileColorLight
          : Colors.white
          : pressed
          ? iosPressedTileColorDark
          : iosTileDarkColor;

  Color? _iconColor(ThemeData theme, ListTileTheme tileTheme) {
    if (tileTheme.selectedColor != null) {
      return tileTheme.selectedColor;
    }

    if (tileTheme.iconColor != null) {
      return tileTheme.iconColor;
    }

    switch (theme.brightness) {
      case Brightness.light:
        return Colors.black45;
      case Brightness.dark:
        return null; // null - use current icon theme color
    }
  }
}

class CupertinoSettingsSection extends StatelessWidget {
   const CupertinoSettingsSection(
      this.items, {Key? key,
        this.header,
        this.headerPadding = defaultTitlePadding,
        this.footer,
      }) : super(key: key);

  final List<Widget> items;

  final Widget? header;
  final EdgeInsetsGeometry headerPadding;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final List<Widget> columnChildren = [];
    if (header != null) {
      columnChildren.add(DefaultTextStyle(
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w400,
          fontSize: 13.5,
          letterSpacing: -0.5,
        ),
        child: Padding(
          padding: headerPadding,
          child: header,
        ),
      ));
    }

    List<Widget> itemsWithDividers = [];
    for (int i = 0; i < items.length; i++) {
      if (i < items.length - 1) {
        var leftPadding = 0.0;
        if (items[i] is SettingsTile &&
            (i < items.length - 1 && (items[i + 1] is SettingsTile))) {
          leftPadding =
          (items[i] as SettingsTile).leading == null ? 15.0 : 54.0;
        }

        itemsWithDividers.add(items[i]);
        itemsWithDividers.add(Divider(
          height: 0.3,
          color: Colors.grey.shade400,
          indent: leftPadding,
        ));
      } else {
        itemsWithDividers.add(items[i]);
      }
    }

    bool largeScreen = MediaQuery.of(context).size.width >= 768 ? true : false;

    columnChildren.add(largeScreen
        ? Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Theme.of(context).brightness == Brightness.light
            ? CupertinoColors.white
            : iosTileDarkColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: itemsWithDividers,
      ),
    )
        : Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? CupertinoColors.white
            : iosTileDarkColor,
        border: const Border(
          top: BorderSide(
            color: borderColor,
            width: 0.3,
          ),
          bottom: BorderSide(
            color: borderColor,
            width: 0.3,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: itemsWithDividers,
      ),
    ));

    if (footer != null) {
      columnChildren.add(DefaultTextStyle(
        style: const TextStyle(
          color: groupSubtitle,
          fontSize: 13.0,
          letterSpacing: -0.08,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 7.5,
          ),
          child: footer,
        ),
      ));
    }

    return Padding(
      padding: largeScreen
          ? EdgeInsets.only(
          top: header == null ? 35.0 : 22.0, left: 22, right: 22)
          : EdgeInsets.only(
        top: header == null ? 35.0 : 22.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnChildren,
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomSection extends AbstractSection {
  final Widget child;

  CustomSection({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class SettingsList extends StatelessWidget {
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final List<AbstractSection>? sections;
  final Color? backgroundColor;
  final Color? lightBackgroundColor;
  final Color? darkBackgroundColor;
  final EdgeInsetsGeometry? contentPadding;

  const SettingsList({
    Key? key,
    this.sections,
    this.backgroundColor,
    this.physics,
    this.shrinkWrap = false,
    this.lightBackgroundColor,
    this.darkBackgroundColor,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        color: Theme.of(context).brightness == Brightness.light
            ? backgroundColor ?? lightBackgroundColor ?? backgroundGray
            : backgroundColor ?? darkBackgroundColor ?? Colors.black,
        child: ListView.builder(
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: contentPadding,
          itemCount: sections!.length,
          itemBuilder: (context, index) {
            AbstractSection current = sections![index];
            AbstractSection? futureOne;
            if (index + 1 != sections!.length) {
              futureOne = sections![index + 1];
            }

            // Add divider if title is null
            if (futureOne != null && futureOne.title != null) {
              current.showBottomDivider = false;
              return current;
            } else {
              current.showBottomDivider = true;
              return current;
            }
          },
        ),
      ),
    );
  }
}
// ignore: must_be_immutable
class SettingsSection extends AbstractSection {
  final List<AbstractTile>? tiles;
  final TextStyle? titleTextStyle;
  final int? maxLines;
  final Widget? subtitle;
  final EdgeInsetsGeometry subtitlePadding;
  final TargetPlatform? platform;

  SettingsSection({
    Key? key,
    String? title,
    Widget? titleWidget,
    EdgeInsetsGeometry titlePadding = defaultTitlePadding,
    this.maxLines,
    this.subtitle,
    this.subtitlePadding = defaultTitlePadding,
    this.tiles,
    this.titleTextStyle,
    this.platform,
  })  : assert(maxLines == null || maxLines > 0),
        super(
        key: key,
        title: title,
        titleWidget: titleWidget,
        titlePadding: titlePadding,
      );

  @override
  Widget build(BuildContext context) {
    final platform = this.platform ?? Theme.of(context).platform;

    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return iosSection();

      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return androidSection(context);

      default:
        return iosSection();
    }
  }

  Widget iosSection() {
    return CupertinoSettingsSection(
      tiles!,
      header: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null || titleWidget != null)
            titleWidget ??
                Text(
                  title!,
                  style: titleTextStyle,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                ),
          if (subtitle != null)
            Padding(
              padding: subtitlePadding,
              child: subtitle,
            ),
        ],
      ),
      headerPadding: titlePadding!,
    );
  }

  Widget androidSection(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (title != null)
        Padding(
          padding: titlePadding!,
          child: Text(
            title!,
            style: titleTextStyle ??
                TextStyle(
                  color: ColorsConstants.appColor,
                  fontWeight: FontWeight.bold,
                ),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      if (subtitle != null)
        Padding(
          padding: subtitlePadding,
          child: subtitle,
        ),
      ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: tiles!.length,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1),
        itemBuilder: (BuildContext context, int index) {
          return tiles![index];
        },
      ),
      if (showBottomDivider) const Divider(height: 1)
    ]);
  }
}

enum _SettingsTileType { simple, switchTile }

abstract class AbstractTile extends StatelessWidget {
  const AbstractTile({Key? key}) : super(key: key);
}

class SettingsTile extends AbstractTile {
  final String? title;
  final Widget? titleWidget;
  final int? titleMaxLines;
  final String? subtitle;
  final Widget? subtitleWidget;
  final int? subtitleMaxLines;
  final Widget? leading;
  final Widget? trailing;
  final Icon? iosChevron;
  final EdgeInsetsGeometry? iosChevronPadding;
  final VoidCallback? onTap;
  final Function(BuildContext context)? onPressed;
  final Function(bool value)? onToggle;
  final bool? switchValue;
  final bool enabled;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final Color? switchActiveColor;
  final _SettingsTileType _tileType;
  final TargetPlatform? platform;

  const SettingsTile({
    Key? key,
    this.title,
    this.titleWidget,
    this.titleMaxLines,
    this.subtitle,
    this.subtitleMaxLines,
    this.leading,
    this.trailing,
    this.subtitleWidget,
    this.iosChevron = defaultCupertinoForwardIcon,
    this.iosChevronPadding = defaultCupertinoForwardPadding,
    @Deprecated('Use onPressed instead') this.onTap,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.enabled = true,
    this.onPressed,
    this.switchActiveColor,
    this.platform,
  })  : _tileType = _SettingsTileType.simple,
        onToggle = null,
        switchValue = null,
        assert(titleMaxLines == null || titleMaxLines > 0),
        assert(subtitleMaxLines == null || subtitleMaxLines > 0),
        super(key: key);

  const SettingsTile.switchTile({
    Key? key,
    this.title,
    this.titleWidget,
    this.titleMaxLines,
    this.subtitle,
    this.subtitleMaxLines,
    this.leading,
    this.enabled = true,
    this.trailing,
    this.subtitleWidget,
    required this.onToggle,
    required this.switchValue,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.switchActiveColor,
    this.platform,
  })  : _tileType = _SettingsTileType.switchTile,
        onTap = null,
        onPressed = null,
        iosChevron = null,
        iosChevronPadding = null,
        assert(titleMaxLines == null || titleMaxLines > 0),
        assert(subtitleMaxLines == null || subtitleMaxLines > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final platform = this.platform ?? Theme.of(context).platform;

    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return iosTile(context);

      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return androidTile(context);

      default:
        return iosTile(context);
    }
  }

  Widget iosTile(BuildContext context) {
    if (_tileType == _SettingsTileType.switchTile) {
      return CupertinoSettingsItem(
        enabled: enabled,
        type: SettingsItemType.toggle,
        label: title ?? '',
        labelWidget: titleWidget,
        subtitleWidget: subtitleWidget,
        labelMaxLines: titleMaxLines,
        leading: leading,
        subtitle: subtitle,
        subtitleMaxLines: subtitleMaxLines,
        switchValue: switchValue,
        onToggle: onToggle,
        labelTextStyle: titleTextStyle,
        switchActiveColor: switchActiveColor,
        subtitleTextStyle: subtitleTextStyle,
        valueTextStyle: subtitleTextStyle,
        trailing: trailing,
      );
    } else {
      return CupertinoSettingsItem(
        enabled: enabled,
        type: SettingsItemType.modal,
        labelWidget: titleWidget,
        subtitleWidget: subtitleWidget,
        label: title ?? '',
        labelMaxLines: titleMaxLines,
        value: subtitle,
        valueWidget: subtitleWidget,
        trailing: trailing,
        iosChevron: iosChevron,
        iosChevronPadding: iosChevronPadding,
        hasDetails: false,
        leading: leading,
        onPress: onTapFunction(context) as void Function()?,
        labelTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        valueTextStyle: subtitleTextStyle,
      );
    }
  }

  Widget androidTile(BuildContext context) {
    if (_tileType == _SettingsTileType.switchTile) {
      return SwitchListTile(
        secondary: leading,
        value: switchValue!,
        activeColor: switchActiveColor,
        onChanged: enabled ? onToggle : null,
        title: titleWidget ??
            Text(
              title ?? '',
              style: titleTextStyle,
              maxLines: titleMaxLines,
              overflow: TextOverflow.ellipsis,
            ),
        subtitle: subtitleWidget ??
            (subtitle != null
                ? Text(
              subtitle!,
              style: subtitleTextStyle,
              maxLines: subtitleMaxLines,
              overflow: TextOverflow.ellipsis,
            )
                : null),
      );
    } else {
      return ListTile(
        title: titleWidget ?? Text(title ?? '', style: titleTextStyle),
        subtitle: subtitleWidget ??
            (subtitle != null
                ? Text(
              subtitle!,
              style: subtitleTextStyle,
              maxLines: subtitleMaxLines,
              overflow: TextOverflow.ellipsis,
            )
                : null),
        leading: leading,
        enabled: enabled,
        trailing: trailing,
        onTap: onTapFunction(context) as void Function()?,
      );
    }
  }

  Function? onTapFunction(BuildContext context) =>
      onTap != null || onPressed != null
          ? () {
        if (onPressed != null) {
          onPressed!.call(context);
        } else {
          onTap!.call();
        }
      }
          : null;
}

class CustomTile extends AbstractTile {
  final Widget child;

   const CustomTile({Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return child;
  }
}