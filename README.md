# manalo_mobprogAY2627

Mobile Programming laboratory activities, AY 2026–2027.
Gwyneth S. Manalo — INF 246

| Folder | Description |
|---|---|
| `manalo_mobprog/` | Flutter application (Empty Application template). Lab 1A code is on the `lab_act1` branch. |

## Lab Activity 0A: Flutter Installation and Project Setup

### Discussion

**Setup and challenges.** Flutter was already installed on my MacBook (Flutter 3.47.9, stable channel, in `~/flutter`), so I mostly had to check that the toolchain was configured correctly. Git was already installed too. The main challenge was that my machine was only partly set up for mobile development. The Flutter SDK worked, but the platform tools for Android and iOS were missing.

**Errors from `flutter doctor`.** Running `flutter doctor` reported issues in two categories:

- **Android toolchain ✗** – "Unable to locate Android SDK." Android Studio and the Android SDK are not installed, so I can't build for an Android emulator or phone yet.
- **Xcode !** – "Xcode installation is incomplete," and CocoaPods is not installed. This blocks iOS and macOS builds.
- Chrome, connected devices, and network resources all passed. I also noticed the VS Code `code` command was not on my PATH, and Flutter showed a notice that a newer version is available.

**How I resolved them.** The lab allows Chrome for testing when the Android tools aren't configured yet, so I chose **Chrome (web)** as my target device. I created the project with the Empty Application template (`flutter create --empty manalo_mobprog`), checked that it compiled with `flutter build web`, and ran it with `flutter run -d chrome`. It showed the "Hello World!" screen. To develop for Android later, I need to install Android Studio, let it download the SDK, run `flutter doctor --android-licenses`, and create an emulator. For iOS, I need the full Xcode from the App Store, `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer`, and CocoaPods.

**What I learned.** Flutter is more than one SDK. It depends on a separate toolchain for each target platform, and `flutter doctor` is the quickest way to see which targets are ready. A ✗ in one category doesn't stop you from working, as long as at least one target (here, Chrome) is ready. Reading the full doctor output, which links to a fix for each issue, is faster than guessing.

**Practices for the future.**
- Run `flutter doctor` before each new project, and after any OS or Flutter update.
- Install Android Studio and set up an emulator early, before a lab that needs one.
- Keep Flutter on the stable channel and update it regularly (`flutter upgrade`).
- Keep the SDK in a fixed location that's on my PATH, and add the `code` command to my shell PATH.
- Commit to Git often, and keep build output out of the repo with `.gitignore`.

## Lab Activity 1A: File Structuring | Design Pattern

### Discussion

**How the image is added to `newsfeed_card.dart`.** I added an optional `String? imagePath` field next to the existing `bool hasImage` field in `NewsFeedCard`. In the card's `Column`, the image area uses a collection-if: `if (hasImage) _PostImage(imagePath: imagePath)`. This builds the image only when the post has one. A text-only post has no empty `SizedBox` or blank space where the image would go.

**Making it dynamic.** `_PostImage` is a small private widget in the same file. It decides what to show:
- If `imagePath` is given, it shows `Image.asset(imagePath!)` with `fit: BoxFit.cover` and `width: double.infinity`, so any image fills the card width and gets cropped to the same height. `ClipRRect` rounds the corners.
- If `hasImage` is true but no path is given, it shows Flutter's `Placeholder()` widget (Enhancement 1).
- `errorBuilder` also falls back to the `Placeholder`, so a wrong file name shows a placeholder instead of the red error box.

The images live in `assets/images/`, and that folder is listed under `flutter: assets:` in `pubspec.yaml`. Without that entry, `Image.asset` can't find the file at runtime. `newsfeed_screen.dart` now has four posts that cover all three cases: a text-only post, two posts with an image, and a post with `hasImage: true` but no file. The avatars and post photos are free stock photos from Unsplash, credited in `assets/images/CREDITS.md`.

**Avatar (Enhancement 2).** I made a `UserAvatar` widget (`widgets/user_avatar.dart`) that wraps `CircleAvatar`. It shows the user's photo through `foregroundImage: AssetImage(...)` when an `avatarPath` is passed. Otherwise it shows the user's initials, which works the same way as the optional post image.

**Widget-based buttons (Enhancement 3).** The three `TextButton.icon` blocks were nearly identical, so I moved them into one reusable `PostActionButton` widget (icon, label, onPressed, isActive). `LikeButton` is a `StatefulWidget` built on top of it. Tapping it toggles the liked state, switches between the outlined and filled thumbs-up icons, and adds 1 to the like count.

**Fixes to the given snippet.** The imports in `main.dart` started with `/` (`'/screens/home_screen.dart'`), which doesn't resolve, so I changed them to relative paths. The screens imported `custom_font.dart` and used `CustomFont`, but the file in the folder structure is `custom_text.dart` with class `CustomText`, so I used `CustomText` everywhere. I skipped the Klavika and Frutiger font files because they are optional and licensed, so Flutter falls back to its default font.

**What I learned.** Splitting the app into `screens/`, `widgets/`, and `constants.dart` makes each file small and easy to find. A change to the card only touches `newsfeed_card.dart`. Making fields nullable (`String?`) and checking them in `build()` lets one widget handle posts with or without an image or photo, instead of needing separate widgets.
