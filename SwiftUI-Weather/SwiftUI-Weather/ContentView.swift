//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Rogerio Cardoso Filho on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    let weather = [Weather(dayOfWeak: "TUE", imageName: "cloud.sun.fill", temperature: 74),
                   Weather(dayOfWeak: "WED", imageName: "sun.max.fill", temperature: 88),
                   Weather(dayOfWeak: "THU", imageName: "wind.snow", temperature: 55),
                   Weather(dayOfWeak: "FRI", imageName: "sunset.fill", temperature: 60),
                   Weather(dayOfWeak: "SAT", imageName: "snow", temperature: 25)]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                HeaderTitleLabelView(title: "Rio das Ostras, RJ")
                mainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill" , temperature: 76)
                
                HStack(spacing: 20) {
                    ForEach(weather, id: \.self) { weather in
                        WeatherDayView(dayOfWeak: weather.dayOfWeak, imageName: weather.imageName, temperature: weather.temperature)
                    }
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct HeaderTitleLabelView: View {
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(.white)
                .padding()
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct WeatherDayView: View {
    
    var dayOfWeak: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeak)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct mainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("\(temperature)")
                .font(.system(size: 100, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
    
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}
