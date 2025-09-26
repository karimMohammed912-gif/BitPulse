import 'package:flutter/material.dart';

enum AnimationType {
  fadeIn,
  slideUp,
  slideLeft,
  slideRight,
  scale,
  slideUpFade,
  slideLeftFade,
  bounceIn,
  rotateIn,
}

extension ItemAnimation on Widget {
  /// Animates the widget with fade in effect
  Widget animateOnPageLoad({
    required int index,
    Duration delay = const Duration(milliseconds: 100),
    Duration duration = const Duration(milliseconds: 600),
    AnimationType type = AnimationType.fadeIn,
    Curve curve = Curves.easeOutCubic,
  }) {
    return _AnimatedItem(
      index: index,
      delay: delay,
      duration: duration,
      type: type,
      curve: curve,
      child: this,
    );
  }

  /// Quick fade in animation
  Widget fadeInAnimation(int index, {Duration? delay}) {
    return animateOnPageLoad(
      index: index,
      type: AnimationType.fadeIn,
      delay: delay ?? const Duration(milliseconds: 20),
    );
  }

  /// Quick slide up animation
  Widget slideUpAnimation(int index, {Duration? delay}) {
    return animateOnPageLoad(
      index: index,
      type: AnimationType.slideUp,
      delay: delay ?? const Duration(milliseconds: 100),
    );
  }

  /// Quick slide and fade animation
  Widget slideUpFadeAnimation(int index, {Duration? delay}) {
    return animateOnPageLoad(
      index: index,
      type: AnimationType.slideUpFade,
      delay: delay ?? const Duration(milliseconds: 5),
    );
  }

  /// Quick scale animation
  Widget scaleAnimation(int index, {Duration? delay}) {
    return animateOnPageLoad(
      index: index,
      type: AnimationType.scale,
      delay: delay ?? const Duration(milliseconds: 100),
    );
  }

  /// Quick bounce animation
  Widget bounceAnimation(int index, {Duration? delay}) {
    return animateOnPageLoad(
      index: index,
      type: AnimationType.bounceIn,
      delay: delay ?? const Duration(milliseconds: 100),
      curve: Curves.elasticOut,
    );
  }
}

class _AnimatedItem extends StatefulWidget {
  final Widget child;
  final int index;
  final Duration delay;
  final Duration duration;
  final AnimationType type;
  final Curve curve;

  const _AnimatedItem({
    required this.child,
    required this.index,
    required this.delay,
    required this.duration,
    required this.type,
    required this.curve,
  });

  @override
  State<_AnimatedItem> createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<_AnimatedItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // Initialize animations based on type
    _initializeAnimations();

    // Start animation with delay
    Future.delayed(
      Duration(milliseconds: widget.index * widget.delay.inMilliseconds),
      () {
        if (mounted) {
          _animationController.forward();
        }
      },
    );
  }

  void _initializeAnimations() {
    switch (widget.type) {
      case AnimationType.fadeIn:
        _fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curve,
        ));
        break;

      case AnimationType.slideUp:
        _slideAnimation = Tween<Offset>(
          begin: const Offset(0, 0.5),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curve,
        ));
        break;

      case AnimationType.slideLeft:
        _slideAnimation = Tween<Offset>(
          begin: const Offset(-0.5, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curve,
        ));
        break;

      case AnimationType.slideRight:
        _slideAnimation = Tween<Offset>(
          begin: const Offset(0.5, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curve,
        ));
        break;

      case AnimationType.scale:
        _scaleAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curve,
        ));
        break;

      case AnimationType.slideUpFade:
        _slideAnimation = Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curve,
        ));
        _fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curve,
        ));
        break;

      case AnimationType.slideLeftFade:
        _slideAnimation = Tween<Offset>(
          begin: const Offset(-0.3, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curve,
        ));
        _fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curve,
        ));
        break;

      case AnimationType.bounceIn:
        _scaleAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curve,
        ));
        break;

      case AnimationType.rotateIn:
        _rotateAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curve,
        ));
        _fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curve,
        ));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return _buildAnimatedWidget();
      },
    );
  }

  Widget _buildAnimatedWidget() {
    switch (widget.type) {
      case AnimationType.fadeIn:
        return FadeTransition(
          opacity: _fadeAnimation,
          child: widget.child,
        );

      case AnimationType.slideUp:
      case AnimationType.slideLeft:
      case AnimationType.slideRight:
        return SlideTransition(
          position: _slideAnimation,
          child: widget.child,
        );

      case AnimationType.scale:
      case AnimationType.bounceIn:
        return ScaleTransition(
          scale: _scaleAnimation,
          child: widget.child,
        );

      case AnimationType.slideUpFade:
      case AnimationType.slideLeftFade:
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: widget.child,
          ),
        );

      case AnimationType.rotateIn:
        return FadeTransition(
          opacity: _fadeAnimation,
          child: RotationTransition(
            turns: _rotateAnimation,
            child: widget.child,
          ),
        );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

// Additional helper class for staggered animations
class StaggeredAnimations {
  /// Creates staggered animation for a list of widgets
  static List<Widget> createStaggeredList(
    List<Widget> children, {
    Duration delay = const Duration(milliseconds: 100),
    Duration duration = const Duration(milliseconds: 600),
    AnimationType type = AnimationType.slideUpFade,
    Curve curve = Curves.easeOutCubic,
  }) {
    return children.asMap().entries.map((entry) {
      final index = entry.key;
      final child = entry.value;
      
      return child.animateOnPageLoad(
        index: index,
        delay: delay,
        duration: duration,
        type: type,
        curve: curve,
      );
    }).toList();
  }

  /// Quick method for crypto list animations
  static Widget animatedCryptoItem(Widget child, int index) {
    return child.slideUpFadeAnimation(index);
  }

  /// Quick method for grid animations
  static Widget animatedGridItem(Widget child, int index) {
    return child.scaleAnimation(index, delay: const Duration(milliseconds: 80));
  }
}