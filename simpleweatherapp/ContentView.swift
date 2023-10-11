import SwiftUI

struct ContentView: View {
    @StateObject private var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            if let weatherData = weatherViewModel.weatherData {
                WeatherTableView(
                    weatherData: weatherData,
                    fetchWeatherData: weatherViewModel.fetchWeatherData,
<<<<<<< HEAD
                    lastUpdate: weatherViewModel.lastUpdate,
                    locationCoordinate: weatherViewModel.coordinate
                )
=======
                    lastUpdate: weatherViewModel.lastUpdate) // Pass the lastUpdate property from WeatherViewModel
>>>>>>> origin/main
            } else {
                ProgressView()
            }
        }
        .onAppear {
            weatherViewModel.fetchWeatherData()
        }
    }
}
