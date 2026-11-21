# manalo_mobprogAY2627

Mobile Programming laboratory activities, AY 2026–2027.
Gwyneth S. Manalo — INF 246

| Folder | Description |
|---|---|
| `manalo_mobprog/` | Flutter application (Empty Application template) |

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

## Lab Activity 0B: Discussion

**Creating and running the app.** I reused the `manalo_mobprog` project inside `manalo_mobprogAY2627`. It was created with VS Code's *Flutter: New Project → Empty Application* template, and it follows the naming convention the lab requires. `lib/main.dart` is the template code: `main()` calls `runApp(const MainApp())`, and `MainApp` returns a `MaterialApp` whose `Scaffold` centers a `Text('Hello World!')` widget. Before running it, I ran `flutter pub get` to fetch dependencies and `flutter analyze`, which reported "No issues found!"

**Device selection.** `flutter devices` listed two targets: **macOS (desktop)** and **Chrome (web)**. No Android emulator or phone appeared, because the Android SDK is still not installed. The macOS target is listed, but `flutter doctor` still reports "Xcode installation is incomplete" and "CocoaPods not installed," so macOS and iOS builds aren't reliable yet. I chose **Chrome** as my device, both in the VS Code status bar and with `flutter run -d chrome`.

**Errors and troubleshooting.**
- `flutter doctor` still flags the Android toolchain (✗ "Unable to locate Android SDK") and Xcode (!). Neither blocks the web target, so I worked around them by choosing Chrome. Fixing them means installing Android Studio, running `flutter doctor --android-licenses`, and creating an emulator. On the Xcode side, it means running `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer` and `sudo xcodebuild -runFirstLaunch`, then installing CocoaPods.
- `flutter pub get` warned that "4 packages have newer versions incompatible with dependency constraints." This is only informational: the locked versions work, and `flutter pub outdated` shows the details.
- When I ran the app with the `web-server` device, the page stayed blank until a debugger attached. That's expected in debug mode. Running on the Chrome device, or serving the release build (`flutter build web`), showed the app right away.

**How I verified it works.** `flutter analyze` passed with no issues, `flutter build web` finished with "✓ Built build/web", and `flutter run` reported "lib/main.dart is being served." The browser then showed the "Hello World!" text centered on the screen, which matches the template's expected output.

**What I learned.** `flutter run` compiles the Dart code for whichever device you pick, launches it, and keeps a session open for hot reload (`r`) and hot restart (`R`). One codebase can run on web, desktop, or mobile, but each target needs its own platform toolchain. `flutter doctor` and `flutter devices` tell you what's actually available before you hit an error.

**Best practices for future activities.**
- Run `flutter doctor` and `flutter devices` before starting each lab.
- Run `flutter pub get` and `flutter analyze` before `flutter run`, so errors are caught early.
- Use hot reload while editing UI, and hot restart after changing app state or `main()`.
- Finish setting up an Android emulator before labs that need mobile-specific features.
- Keep `build/` out of Git (it's in `.gitignore`), and commit after each working milestone.
