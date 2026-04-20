import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walkthrough/walkthrough_widget.dart';

// Focus widget keys for this walkthrough
final row4bg4jghg = GlobalKey();
final rowVcgrh1hi = GlobalKey();
final container3xgsmbh7 = GlobalKey();
final containerQ20ls7ge = GlobalKey();
final column5idsvq21 = GlobalKey();

/// Home
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: row4bg4jghg,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkthroughWidget(
              title:
                  'See plant recommendations tailored to your local climate.',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: rowVcgrh1hi,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkthroughWidget(
              title:
                  'Track real-time weather to understand how today’s conditions affect your plants',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: container3xgsmbh7,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkthroughWidget(
              title:
                  'Just type a name and instantly discover care tips and identification.',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: containerQ20ls7ge,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkthroughWidget(
              title:
                  'Unlock premium tools and advanced plant insights for faster.',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: column5idsvq21,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkthroughWidget(
              title:
                  'Access all essential plant-care tools in one place — identify plants, detect diseases, check light and water levels, and more.',
            ),
          ),
        ],
      ),
    ];
