run-docker-test:
	COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose up --build --abort-on-container-exit --exit-code-from=flutter-app

run-test:
	sleep 10
	adb connect android-emulator:5555
	adb wait-for-device
	bash waiting-for-boot.sh
	flutter pub get
	flutter drive --target test_driver/app.dart