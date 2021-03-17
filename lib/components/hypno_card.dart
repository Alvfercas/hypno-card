import 'package:flutter/material.dart';

class HypnoCard extends StatefulWidget {
  ///`Null safety` Widget [height].
  ///
  /// If null, it expands with [child].
  final double? height;

  /// `Null safety` Extra padding outside [child].
  final EdgeInsetsGeometry? padding;

  /// `Null safety` Background color for entire widget.
  final Color? color;

  /// `Null safety` Border radius for the widget.
  final BorderRadiusGeometry? borderRadius;

  /// `Null safety`.
  final DecorationImage? decorationImage;

  /// `Null safety` [blurRadius] for shadow outside widget.
  ///
  /// Default value is `15`.
  final double? blurRadiusShadow;

  /// `Null safety` Color for shadow.
  ///
  /// Default value is [Theme.of(context).primaryColor.withOpacity(.5)].
  final Color? colorShadow;

  /// `Null safety` Intensity of movement the widget and widget shadow will take when touching.
  ///
  /// Default value is `1`.
  final double? force;

  /// `Null safety` [onTap] function the widget will take.
  final Function()? onTap;

  /// `Null safety` The widget below this widget in the tree.
  final Widget? child;

  const HypnoCard({
    Key? key,
    this.height,
    this.padding,
    this.color,
    this.borderRadius,
    this.decorationImage,
    this.blurRadiusShadow,
    this.colorShadow,
    this.force,
    this.onTap,
    this.child,
  }) : super(key: key);

  @override
  _HypnoCardState createState() => _HypnoCardState();
}

class _HypnoCardState extends State<HypnoCard> {
  /// Position where the "force" is positioned in the widget axis from the center.
  ///
  /// Used to update [rotateX()] and [rotateY()] from [Matrix4].
  Offset _forcePoints = Offset.zero;

  /// Takes the object rendered as [RenderBox] to get the center point. This is used with touch
  /// details from [onLongPressStart], [onLongPressMoveUpdate], [onPanStart] and [onPanUpdate] to
  /// update `_forcePoints`.
  void _updatePerspective(_touchDetails) {
    RenderBox? _object = context.findRenderObject() as RenderBox;

    Offset? _localTouchOffset = _object.globalToLocal(_touchDetails.globalPosition);
    Offset _centerPoint = Offset(_object.size.width / 2, _object.size.height / 2);

    double _forcePointX = _localTouchOffset.dx - _centerPoint.dx;
    double _forcePointY = _localTouchOffset.dy - _centerPoint.dy;

    setState(() => _forcePoints = Offset(_forcePointX, _forcePointY));
  }

  /// Resets `_forcePoints` to the center
  void _resetPerspective() {
    setState(() => _forcePoints = Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    // Check for values or use default
    final double _force = widget.force ?? 1;

    return Container(
      padding: widget.padding,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(.01 * _forcePoints.dy / (25 / _force))
          ..rotateY(-.01 * _forcePoints.dx / (25 / _force)),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onLongPressStart: _updatePerspective,
          onLongPressMoveUpdate: _updatePerspective,
          onLongPressUp: _resetPerspective,
          onPanStart: _updatePerspective,
          onPanUpdate: _updatePerspective,
          onPanEnd: (DragEndDetails _) => _resetPerspective(),
          onTap: widget.onTap ?? null,
          child: Container(
            height: widget.height ?? null,
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.color ?? Theme.of(context).primaryColor,
              borderRadius: widget.borderRadius,
              image: widget.decorationImage ?? null,
              boxShadow: [
                BoxShadow(
                  color: widget.colorShadow ?? Theme.of(context).shadowColor.withOpacity(.5),
                  spreadRadius: -1,
                  blurRadius: widget.blurRadiusShadow ?? 15,
                  offset: Offset(
                    -.5 * _forcePoints.dx / (12 / _force),
                    -.5 * _forcePoints.dy / (12 / _force),
                  ),
                ),
              ],
            ),
            child: widget.child ?? null,
          ),
        ),
      ),
    );
  }
}
