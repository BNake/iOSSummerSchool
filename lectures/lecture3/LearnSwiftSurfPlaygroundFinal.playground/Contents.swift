/*:
 
 ![Title](lecture3_post.png)

*/


/*:
 
 ## Основные компоненты
 
 */


//: объявите константу `city` и присвойте ей значение `Воронеж`

let city = "Воронеж"

//: объявите константу `страна` и присвойте ей значение `Россия`

let country = "Россия"

//: объявите переменную `zipcode` и присвойте ей значение `192168` в качестве строки, а не числа

var zipCode: String = "192168"

//: объявите константу `firstName` и в качестве значения используйте свое имя

let firstName = "Григорий"

//: объявите константу `lastName` и в качестве значения используйте свою фамилию

let lastName = "Бернгардт"

//: объявите константу `fullName`, которая будет содержать полное имя на основе ранее созданных констант `firstName` и `lastName`

let fullName = firstName + " " + lastName

//: объявите константу `temperature` содержищию числовое значение температуры воздуха

let temperature: Int = 16

/*:

 Используя строковой литерал выведете в консоль сообщение о сегодняшней погоде
 
 > Пример: `Температура в городе Санкт-Петербург составит 10°`
 
 Используйте объявленные ранее переменные `city` и `temperature`

*/

print("Температура в городе \(city) составит \(temperature)°")

//: создайте массив `cities` и наполните его городами Воронеж, Москва, Новосибирск, Тверь, Владивосток

var cities: [String] = ["Воронеж", "Москва", "Новосибирск", "Тверь", "Владивосток"]

//: измените "Тверь" на "Киров"

cities[3] = "Киров"

//: выведите в консоль названия всех городов

print(cities)

//: создайте словарь `temperatures`, в котором ключом будет город, а значением температура

var temperatures = ["Воронеж": 16, "Москва": 20, "Новосибирск": 10, "Тверь": 11, "Владивосток": 19, "Киров": 12]

//: получите значение прогноза погоды в городе Киров

temperatures["Киров"]

//: проитерируйте массив городов `cities` и выведите в консоль сообщение о погоде в каждом из городов

for cityName in cities {
    let cityTemperature = temperatures[cityName] ?? 0
    print("Температура в городе \(cityName) составит \(cityTemperature)°")
}

//: сделайте тоже самое, только не используя массив `cities`

for (cityName, cityTemperature) in temperatures {
    print("Температура в городе \(cityName) составит \(cityTemperature)°")
}

/*:

 мы хотим хранить не только температуру, но и состояние погоды
 создайте словарь `modernTemperatures`, чтобы хранить он содержал не только погоду, но и состояние (`ясно`, `облачно`, `дождь`, `гроза` и `снег`)
 в качестве значения использовать кортеж (tuple)

*/

let modernTemperatures = [
    "Воронеж": (16, "ясно"),
    "Москва": (20, "ясно"),
    "Новосибирск": (10, "дождь"),
    "Тверь": (11, "гроза"),
    "Владивосток": (19, "облачно"),
    "Киров": (12, "дождь")
]

/*:

 теперь отобразим более детальный прогноз погоды для каждого города

 > Пример: `Температура в городе Санкт-Петербург составит 10° (дождь)`

*/

for (cityName, weather) in modernTemperatures {
    print("Температура в городе \(cityName) составит \(weather.0)° (\(weather.1))")
}

//: создайте функцию `greet`, которая приветствует вас

func greet() {
    print("👋 Приветствую тебя!")
}

//: вызовите эту функцию

greet()

//: добавьте функцию `sum`, которая принимает два аргумента типа `Int` и возвращает их сумму

func sum(_ a: Int, and b: Int) -> Int {
    return a + b
}

//: с помощью данной функции вычислите сумму 5 и 9

sum(5, and: 9)

/*:

 добавьте функцию `div`, которая принимает два аргумента типа `Int` и возвращает их частное
 если делитель равен 0, то возвращаем 0
 
*/

func div(_ a: Int, and b: Int) -> Int {
    guard b != 0 else {
        return 0
    }
    return a / b
}

/*:

 с помощью данной функции вычислите:
    1) 10 / 5
    2) 5 / 9
    3) 123 / 0

*/

div(10, and: 5)
div(5, and: 9)
div(123, and: 0)

/*:
 
 ## Типы данных, структуры и дополнительные возможности
 
 */

//: создайте структуру `SimpleCity`, которая будет описывать погоду и содержать свойства `temperature` типа `Int` и `condition` типа `String`

struct SimpleWeather {
    let temperature: Int
    let condition: String
}

//: попробуйте создайте экземпляр структуры

SimpleWeather(temperature: 15, condition: "Солнечно")

//: создайте класс `SimpleCity` для хранение информации о города, пока только с названием (постоянное свойство `name`) и погодой (переменное свойство `weather`)

class SimpleCity {
    let name: String
    
    var weather: SimpleWeather?
    
    init(_ name: String) {
        self.name = name
    }
}

//: попробуйте создать экземаляр нашего класса

SimpleCity("Воронеж")

//: неудобно описывать состояние погоды в виде строки, поэтому создадим перечисление `WeatherCondition` и занесем туда значения: ясно, облачно, дождь, гроза и снег

enum WeatherCondition: String {
    case clear = "ясно"
    case cloudy = "облачно"
    case rain = "дождь"
    case thunderstorm = "гроза"
    case snow = "снег"
}

//: теперь, чтобы адаптировать ранее созданные класс и структуру под тип `WeatherCondition` нам нужно создать новые типы, давайте создадим структуру `Weather` и `City`, но уже с использованием для храненения состояния

struct Weather {
    let temperature: Int
    let condition: WeatherCondition
}

class City {
    let name: String
    
    var weather: Weather?
    
    init(_ name: String) {
        self.name = name
    }
}

/*:
 
 создайте массив городов `newCities`
 заполнять его явно не очень удачная затея, поэтому используйте для этого, словарь `modernTemperatures`, который мы использовали ранее
 если состояние не указано явно, то по-умолчанию используем `WeatherCondition.clear`
 
*/
 
var newCities = [City]()

for (cityName, weather) in modernTemperatures {
    let city = City(cityName)
    let condition = WeatherCondition(rawValue: weather.1) ?? WeatherCondition.clear
    let weather = Weather(temperature: weather.0, condition: condition)
    city.weather = weather
    newCities.append(city)
}

/*:
 
 выведите прогноз погоды в уже знакомом нам формате, но с использованием `newCities`.
 Если отсутствует `weather`, то используем 0 или WeatherCondition.clear в зависимости от типа данных
 > Пример: Температура в городе Санкт-Петербург составит 10° (дождь)
 
 */

for city in newCities {
    print("Температура в городе \(city.name) составит \(city.weather?.temperature ?? 0)° (\(city.weather?.condition ?? WeatherCondition.clear))")
}
/*:
 
 согласитесь, что неправильно в случае отсутствия информации о погоде выводить какие-то значения по-умолчанию
 перепишите код выше, с использованием `guard` и в случае отсутствия информации о погоде выводите сообщение `"Для города <город> погода неизвестна"`
 
*/
 
for city in newCities {
    guard let weather = city.weather else {
        print("Для города \(city.name) погода неизвестна")
        continue
    }
    print("Температура в городе \(city.name) составит \(weather.temperature)° (\(weather.condition))")
}

//: создайте расширение `WeatherCondition` для отображения состояния в виде emoji

extension WeatherCondition {
    
    var emoji: String {
        switch self {
        case .clear:
            return "☀️"
        case .cloudy:
            return "☁️"
        case .rain:
            return "☔️"
        case .snow:
            return "❄️"
        case .thunderstorm:
            return "⚡️"
        }
    }
    
}

//: выведите в консоль сводку с использованием emoji для описания состояния

for city in newCities {
    guard let weather = city.weather else {
        print("Для города \(city.name) погода неизвестна")
        continue
    }
    print("Температура в городе \(city.name) составит \(weather.temperature)° \(weather.condition.emoji)")
}
