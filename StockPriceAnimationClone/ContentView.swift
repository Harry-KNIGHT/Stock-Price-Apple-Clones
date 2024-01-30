//
//  ContentView.swift
//  StockPriceAnimationClone
//
//  Created by Elliot Knight on 29/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()

    @State private var offset: CGFloat = 0.0
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Stock.sample) { stock in
                    StockView(stock: stock)
                }
            }
            .offset(x: offset)
            .onReceive(timer) { _ in
                withAnimation(.linear(duration: 3)) {
                    offset -= CGFloat(50)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct Stock: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let price: Double
    let percentage: Double
}

extension Stock {
    static let sample: [Self] = [
        .init(name: "AAPL", price: 178.33, percentage: -1.23),
        .init(name: "BA", price: 205.1, percentage: -56.23),
        .init(name: "NKE", price: 102.76, percentage: 3.4),
        .init(name: "TSLA", price: 188.45, percentage: 5.36),
        .init(name: "S&P 500", price: 4_896.57, percentage: 133.23),
        .init(name: "GOOGL", price: 2700.0, percentage: 12.5),
        .init(name: "AMZN", price: 3450.0, percentage: -8.9),
        .init(name: "MSFT", price: 340.0, percentage: 20.0),
        .init(name: "FB", price: 300.0, percentage: 7.8),
        .init(name: "NFLX", price: 550.0, percentage: -2.5),
        .init(name: "V", price: 220.0, percentage: 15.0),
        .init(name: "MA", price: 360.0, percentage: 9.2),
        .init(name: "INTC", price: 50.0, percentage: -4.3),
        .init(name: "CSCO", price: 55.0, percentage: 3.7),
        .init(name: "GS", price: 400.0, percentage: -6.8),
        .init(name: "IBM", price: 120.0, percentage: 2.0),
        .init(name: "JPM", price: 150.0, percentage: 18.0),
        .init(name: "DIS", price: 170.0, percentage: -1.0),
        .init(name: "WMT", price: 140.0, percentage: 5.5),
        .init(name: "KO", price: 60.0, percentage: 1.2),
        .init(name: "PEP", price: 160.0, percentage: 8.3),
    ]
}

struct StockView: View {
    let stock: Stock
    var body: some View {
        VStack(alignment: .leading) {
            Text(stock.name)
                .fontWeight(.bold)
            Text(String(stock.price))
                .fontWeight(.bold)
            Text("\(String(format: "%.2f", stock.percentage))%")
                .foregroundStyle(stock.percentage > 0 ? .green : .red)
                .fontWeight(.medium)
        }
        .padding(5)
    }
}
