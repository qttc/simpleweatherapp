import SwiftUI

struct ContentView: View {
    @StateObject private var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            if let weatherData = weatherViewModel.weatherData {
                WeatherTableView(
                    weatherData: weatherData,
                    fetchWeatherData: weatherViewModel.fetchWeatherData,
                    lastUpdate: weatherViewModel.lastUpdate,
                    locationCoordinate: weatherViewModel.coordinate
                )
            } else {
                ProgressView()
            }
        }
        .onAppear {
            weatherViewModel.fetchWeatherData()
        }
    }
}
