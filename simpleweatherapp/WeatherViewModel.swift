import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherData?
    @Published var lastUpdate: Date? // Добавляем свойство для хранения времени последнего обновления
    
    func fetchWeatherData() {
        let apiKey = Keys.weatherAPIKey // Замените на свой API-ключ от OpenWeatherMap
        
        let latitude = 53.9045 // Широта Минска
        let longitude = 27.5615 // Долгота Минска
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    if let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data) {
                        DispatchQueue.main.async {
                            self.weatherData = weatherData
                            self.lastUpdate = Date() // Устанавливаем значение lastUpdate на текущую дату
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
}
