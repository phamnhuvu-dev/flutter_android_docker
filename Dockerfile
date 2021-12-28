FROM cirrusci/flutter:2.8.1

RUN sdkmanager "build-tools;29.0.2"

RUN flutter precache --android --no-web --no-ios --no-universal

COPY pubspec.* .

RUN --mount=type=cache,sharing=locked,target=/flutter flutter pub get

WORKDIR /project

COPY . .