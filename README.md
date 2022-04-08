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

  * (인증 관련)

* Status

  * user_id (belongs to User)

  * temperature (°C)

  * humidity (%)

  * pm1p0 (μg/m^3)

  * pm2p5 (μg/m^3)

  * pm10 (μg/m^3)

  * gas (ppm)

  * brightness

## API Specification

