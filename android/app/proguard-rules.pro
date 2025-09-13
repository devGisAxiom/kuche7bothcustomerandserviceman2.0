# Keep classes used by just_audio
-keep class com.ryanheise.just_audio.** { *; }
-keep class com.ryanheise.just_audio_background.** { *; }

# Keep ExoPlayer
-keep class com.google.android.exoplayer2.** { *; }
-dontwarn com.google.android.exoplayer2.**
