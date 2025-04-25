//
//  ContentView.swift
//  Weather
//
//  Created by User on 25/04/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
           
            
            BackgroundView(isNight: $isNight)
            
            VStack{
                CityView(cityName: "London")
                CurrentWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 78)
                
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 55)
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind.snow", temperature: 55)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 55)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 89)
                }
                Spacer()
                
                Button{
                    print("tapped")
                    isNight.toggle()
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(10.0)
                    
                }
                Spacer()
            }
        }
      
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek).font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)").font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
            
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight : Bool
    
   
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue,
                                isNight ? .gray : Color("lightBlue")],
                       startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityView: View {
    
    var cityName : String
    var body: some View {
        Text(cityName).font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white)
            .padding()
    }
}

struct CurrentWeatherView: View {
    
    var imageName : String
    var temperature : Int
    
    var body: some View {
        VStack(spacing: 10){
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)").font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}
