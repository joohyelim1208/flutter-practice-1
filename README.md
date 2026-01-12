
# Freezed 사용법

 1. 패키지 추가
```sh
flutter pub add \
  dev:build_runner \
  freezed_annotation \
  dev:freezed
# if using freezed to generate fromJson/toJson, also add:
flutter pub add json_annotation dev:json_serializable
```

2. 클래스 작성 (freezed 문법대로)

3. 코드생성
```sh
dart run build_runner watch -d
```

4. `.gitignore`에 생성된 파일 안 올라가게 추가하기!
제일 하단에
```
*.freezed.dart
*.g.dart
```s
코드 같이 안 올라가게 해주기! 너무 길다
이 파일들은 git에 올리지 않는다.
`*`s