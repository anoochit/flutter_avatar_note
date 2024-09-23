import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarNote extends StatefulWidget {
  const AvatarNote({
    super.key,
    required this.radius,
    required this.imageUrl,
    required this.note,
  });

  final double radius;
  final String imageUrl;
  final String note;

  @override
  State<AvatarNote> createState() => _AvatarNoteState();
}

class _AvatarNoteState extends State<AvatarNote> {
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
                width: (widget.note.length < 12)
                    ? ((widget.radius * 2) - 64)
                    : ((widget.radius * 2) - 16),
                padding: EdgeInsets.symmetric(
                  vertical: (widget.note.length <= 12) ? 24 : 14,
                  horizontal: (widget.note.length < 12) ? 12 : 24,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Center(
                  child: Text(
                    widget.note,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
