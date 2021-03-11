# RxOpenWeatherMap
Basic Open Weather Map API handling response data to observable decodable objects with RxSwift and Swift 5.3

## Installation
Simply add RxOpenWeatherMap into your Podfile
```
pod 'RxOpenWeatherMap'
```

## Usage
Declare a OpenWeatherClient with your api key, the specific temperature unit (.celsius, .fahrenheit, .kelvin), and the optional specific language code. Then message the client to request an API call. Currently OpenWeatherClient supports two API calls - one call to get weather data and direct geocoding to get location info. Each API call returns RxSwift.Observable<Decodable>, which you can subscribe.
  
```
import RxSwift
import RxCocoa
import RxOpenWeatherMap

let disposeBag = DisposeBag()
let weather = PublishSubject<OneCallResponse>()

do {
  try OpenWeatherClient(apiKey: "PUT_YOUR_API_KEY_HERE",
                        temperatureUnit: .celsius,
                        language: Locale.current.languageCode)
    .oneCall(latitude: 25.234, longitude: -123.432)
    .subscribe(onNext: { [weak self] (oneCallResponse) in 
      self?.weather.onNext(oneCallResponse)
    })
    .disposed(by: disposeBag)
  } catch {
    print(error.localizedDescription)
  }
```
