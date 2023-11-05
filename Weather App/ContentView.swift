//
//  ContentView.swift
//  Weather App
//
//  Created by Denis Fajar Sidik on 05/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, 
                endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack (spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("50°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                Spacer()
                
                HStack (spacing: 20) {
                    DailyWeatherInfoCard(dayOfWeek: "Sun", imageName: "cloud.sun.fill", temperature: 50)
                    
                    DailyWeatherInfoCard(dayOfWeek: "Mon", imageName: "cloud.sun.rain.fill", temperature: 22)
                    
                    DailyWeatherInfoCard(dayOfWeek: "Tue", imageName: "cloud.sun.bolt.fill", temperature: 21)
                    
                    DailyWeatherInfoCard(dayOfWeek: "Wen", imageName: "cloud.rain.fill", temperature: 22)
                    
                    DailyWeatherInfoCard(dayOfWeek: "Thu", imageName: "cloud.bolt.rain.fill", temperature: 23)
                    
                }
                
                Spacer()
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
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
        }
    }
}
