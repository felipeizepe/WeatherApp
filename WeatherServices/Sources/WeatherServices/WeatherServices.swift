struct WeatherServices {
    public init() {
        
    }
}

public class WeatherServiceFactory {

    public static var shared: WeatherServiceFactory = WeatherServiceFactory()

    public var findWeatherService: FindWeatherServiceProtocol { FindWeatherDAO() }

    private init() { }

}
