# HomeAPI

OO대학교 전자공학과 전자공학설계(캡스톤)과목에서 사용하기 위한 어플리케이션입니다.

이 어플리케이션은 스마트폰 어플리케이션과 아두이노 디바이스를 서로 연동하기 위한 API 서버에 해당합니다.

```plaintext
+-----+   +-------------+   +---------+
| App +---+ Rails(this) +---+ Arduino |
+-----+   +-------------+   +---------+
```

* 스마트폰 어플리케이션은 [HomeAPP](https://github.com/Ch1keen/homeapp)에서 확인해주시기 바랍니다.

## Feature

* 온도

* 습도

* 미세먼지 농도

  * PM 1.0

  * PM 2.5

  * PM 10.0

* 가스

* 조도

* (영상)

## 모델

* Home

  * has_many: status

  * serial_number (String)

* Status

  * user_id (belongs to User)

  * temperature (°C; float)

  * humidity (%; float)

  * pm1p0 (μg/m^3; float)

  * pm2p5 (μg/m^3; float)

  * pm10 (μg/m^3; float)

  * gas (ppm; float)

  * brightness (on/off; boolean)

  * fan (역방향/off/정방향; int)

  * window (on/off; boolean)

## API Specification

* `POST /api/homes`

  [HomeApp](https://github.com/Ch1keen/homeapp)에서 회원가입 후, 새 기기를 등록할 때 시리얼 넘버를 제공한다.

  ```javascript
  {'serial_number': 'abc'}
  ```

* `POST /api/statuses`

  집에 대한 온습도 등 상태(Status)를 새로 등록한다. 집에서 센서가 발생한 데이터를 서버에 등록할 때 사용한다.

  아래는 그 예시이다. 시리얼 넘버가 abc인 기기에 대한 새 Status를 등록한다.

  ```javascript
  {
    'status': {
      'temperature': 15.0,
      'serial_number': 'abc',
      'humidity', 22.0
    }
  }
  ```

## Use Case

1. 집에 센서 기기들을 설치하고, 휴대폰에 [어플리케이션](https://github.com/Ch1keen/homeapp)을 설치한다.

1. 어플리케이션에서 로그인을 진행하고, 시리얼 넘버를 이용하여 새 기기를 서비스에 등록한다.
    `POST /api/homes`

1. 스마트홈 기기는 센서로부터 발생한 정보를 새로 등록한다.
    `POST /api/statuses`

1. 스마트 폰에서 집에 대한 정보를 가져온다.
    `GET /api/homes?serial_number=abc`
