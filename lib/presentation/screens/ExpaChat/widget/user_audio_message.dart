import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioMessage extends StatelessWidget {
  final VoidCallback? onPlayAudio;
  final String audioDuration;
  final bool isPlaying;

  const AudioMessage({
    super.key,
    this.onPlayAudio,
    required this.audioDuration,
    this.isPlaying = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Play / Pause Button
        GestureDetector(
          onTap: onPlayAudio,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.black,
              size: 28,
            ),
          ),
        ),

        const SizedBox(width: 10),

        // Waveform and duration
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ✅ Limit width of waveform so it won’t overflow
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Row(
                    children: List.generate(
                      30, // fewer bars for better fit
                          (index) => Container(
                        width: 2,
                        height: (index % 4 + 1) * 5.0,
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Duration text
              Text(
                audioDuration,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
