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
