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

* `POST /api/statuses`

  ```json
  {'status': 
    {'temperature': 15.0,
     'serial_number': 'abc',
     'humidity', 22.0}
  }
  ```
