import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarNoteInputField extends StatefulWidget {
  const AvatarNoteInputField({
    super.key,
    required this.radius,
    required this.imageUrl,
    this.onNoteChanged,
    required this.onNoteSubmited,
  });

  final double radius;
  final String imageUrl;
  final ValueChanged<String>? onNoteChanged;
  final ValueChanged<String> onNoteSubmited;

  @override
  State<AvatarNoteInputField> createState() => _AvatarNoteInputFieldState();
}

class _AvatarNoteInputFieldState extends State<AvatarNoteInputField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // avatar
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(widget.radius),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                    color: Colors.grey.shade200,
                  )
                ]),
            child: CircleAvatar(
              radius: widget.radius,
              backgroundImage: CachedNetworkImageProvider(widget.imageUrl),
            ),
          ),
        ),

        // balloon
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                width: ((widget.radius * 2) - 16),
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Note...',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (widget.onNoteChanged != null) {
                        widget.onNoteChanged!.call(value);
                      }
                    },
                    onFieldSubmitted: (value) {
                      widget.onNoteSubmited.call(value);
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0 - 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: const SizedBox(
                  width: 22,
                  height: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 64.0 - 6),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: const SizedBox(
                  width: 12,
                  height: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
