# NGA SDK — third-party notices

The NGA SDK is licensed under the NGA SDK License (`LICENSE`). It includes no third-party code: the Android libraries, the iOS frameworks and the Unity packages carry only NGA's own. The components below are what they depend on. Each is fetched separately, from its own publisher, and is licensed under its own terms; nothing in the NGA SDK License limits your rights under them.

## Android: `network.nga:nga-sdk` and `network.nga:nga-sdk-render`

Runtime dependencies named in each library's POM, with what they bring in turn. Versions are those the libraries declare; your build may resolve newer ones.

| Component | Version | License | Copyright |
|---|---|---|---|
| Kotlin standard library, `org.jetbrains.kotlin:kotlin-stdlib` | 1.9.24 | Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0 | Copyright 2010-2024 JetBrains s.r.o. and Kotlin Programming Language contributors |
| JetBrains annotations, `org.jetbrains:annotations` (brought by the Kotlin standard library) | 13.0 | Apache License 2.0 | Copyright 2000-2016 JetBrains s.r.o. |
| Play Install Referrer library, `com.android.installreferrer:installreferrer` (`nga-sdk` only) | 2.2 | Android Software Development Kit License, https://developer.android.com/studio/terms.html | Copyright Google LLC |
| Google Play services App Set, `com.google.android.gms:play-services-appset` (`nga-sdk` only) | 16.1.0 | Android Software Development Kit License | Copyright Google LLC |
| Google Play services `play-services-base`, `play-services-basement`, `play-services-tasks` (brought by App Set) | 18.5.0, 18.4.0, 18.2.0 | Android Software Development Kit License | Copyright Google LLC |
| AndroidX `activity`, `annotation`, `arch.core:core-common`, `arch.core:core-runtime`, `collection`, `core`, `customview`, `fragment`, `lifecycle-common`, `lifecycle-livedata`, `lifecycle-livedata-core`, `lifecycle-runtime`, `lifecycle-viewmodel`, `loader`, `savedstate`, `versionedparcelable`, `viewpager` (brought by Google Play services) | as Google Play services requires | Apache License 2.0 | Copyright The Android Open Source Project |

`nga-sdk-render` depends on `nga-sdk` and the Kotlin standard library.

## iOS: `NGASDK` and `NGASDKRender`

No third-party dependencies. The frameworks link only Apple's system frameworks.

## Unity: `network.nga.sdk` and `network.nga.sdk-render`

The packages carry the Android libraries and iOS frameworks above, and the Android dependencies above are fetched into your Gradle build by:

| Component | License | Copyright |
|---|---|---|
| External Dependency Manager for Unity, `com.google.external-dependency-manager` (required, installed by you; not included) | Apache License 2.0 | Copyright Google LLC |
