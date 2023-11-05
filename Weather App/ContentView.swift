//
//  ContentView.swift
//  Weather App
//
//  Created by Denis Fajar Sidik on 05/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                VStack (spacing: 10) {
                    Image(systemName: isNight ? "moon.stars.fill" :  "cloud.sun.fill")
                        .symbolRenderingMode(.multicolor)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("50°")
                        .font(.system(size: 70, weight: .medium ))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                HStack (spacing: 20) {
                    DailyWeatherInfoCard(dayOfWeek: "Sun", 
                                         imageName: "cloud.sun.fill",
                                         temperature: 50)
                     
                    DailyWeatherInfoCard(dayOfWeek: "Mon",
                                         imageName: "cloud.sun.rain.fill",
                                         temperature: 22)
                    
                    DailyWeatherInfoCard(dayOfWeek: "Tue", 
                                         imageName: "cloud.sun.bolt.fill",
                                         temperature: 21)
                    
                    DailyWeatherInfoCard(dayOfWeek: "Wen", 
                                         imageName: "cloud.rain.fill", 
                                         temperature: 22)
                    
                    DailyWeatherInfoCard(dayOfWeek: "Thu", 
                                         imageName: "cloud.bolt.rain.fill",
                                         temperature: 23)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                    print("button clicked")
                } label: {
                    WeatherButton(label: "Change Day Time", 
                                  labelColor: Color.blue,
                                  backgroundColor: Color.white)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct DailyWeatherInfoCard: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack (spacing: 8) {
            Text(dayOfWeek)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    let nightColors: [Color] = [Color.black, Color.gray]
    let dayColors: [Color] = [Color.blue, Color.lightBlue]
    
    var body: some View {
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .bold, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherButton: View {
    var label: String
    var labelColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(label)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .font(.system(size: 20, weight: .medium, design: .default))
            .foregroundColor(labelColor)
            .cornerRadius(10)
    }
}
