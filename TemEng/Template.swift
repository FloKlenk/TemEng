//
//  Template.swift
//  TemEng
//
//  Created by Florian Klenk
//

import SwiftUI
import Foundation
import Charts
import SwiftUICharts
//import Operations

struct Template: View {
    @State public var stream1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @State public var stream2 = [9, 8, 7, 6, 5, 4, 3, 2, 1]
    @State public var stream3 = [1, 2, 3, 7, 8, 9, 4, 5, 6]
    @State public var data = [12.54, 53.42, 32.11, 44.99, 12.54, 153.42, 132.11, 144.99, 312.54, 353.42, 32.11, 44.99]
    @State public var matrix = [[0.1, 0.2, 0.3],
                         [0.2, 0.3, 0.4],
                         [0.3, 0.4, 0.1],
                         [0.3, 0.4, 0.2],
                         [0.3, 0.3, 0.3],
                         [0.3, 0.2, 0.4]]
    @State public var data2: [ChartDataEntry] = [
        ChartDataEntry(x: 1627812000, y: 312, icon: NSUIImage(systemName: "cart"), data: "My data"),
        ChartDataEntry(x: 1627898400, y: 189, icon: NSUIImage(systemName: "cart"), data: "My data"),
        ChartDataEntry(x: 1627984800, y: 129, icon: NSUIImage(systemName: "cart"), data: "My data"),
        ChartDataEntry(x: 1628071200, y: 89, icon: NSUIImage(systemName: "cart"), data: "My data")
    ]


//    let functionHolders: [FunctionHolder] = [
//        FunctionHolder(name: "Mittelwert", function: Operationos.greet),
//        FunctionHolder(name: "Summe", function: Operationos.sayGoodbye)
//    ]
    
        var body: some View {
            let Temps = Gespeicherte_Templates()
            
            NavigationView {
                VStack {
                    
                    List {
                        ForEach(Temps.Namen_Templates , id: \.self) { fruit in
                            NavigationLink(destination: DetailView(fruit: fruit)) {
                                Text(fruit)
                            }
                        }
                        NavigationLink(destination: ChartTest()) {
                            Text("Test-Template")
                        }
                    }
                    

                    
                    
                    NavigationLink(destination: SecondView(), label: {
                        Label("Template erstellen", systemImage: "folder")
                    })
                    
                    Spacer()

                }
            }
        }
    
    
    
    struct SecondView: View {
        @ObservedObject var dataStore = DataStore()
        let akt_Ops = AktuellesTemplate_Operationen()

        var body: some View {
            VStack {
//                Text("This is the second view")
//                    .navigationBarTitle("Neues Template")
                List {
                    ForEach(akt_Ops.aktuelleOperationen , id: \.self) { fruit in
                        NavigationLink(destination: DetailView(fruit: fruit)) {
                            Text(fruit)
                        }
                    }
                    
                }
                NavigationLink(destination: ThirdView(), label: {
                    Label("Operation hinzufügen", systemImage: "laptop")
                })
                .padding()
                NavigationLink(destination: ThirdView(), label: {
                    Label("Template speichern", systemImage: "folder")
                })
            }
            .navigationTitle("Neues Template")
        }
    }

    
//    struct ThirdView: View {
//        @State private var showSheet = false
//        @State private var showAuswahlSheet = false
//
//        var body: some View {
//
//                VStack {
//
//                            Button("Operationen hinzufügen") {
//                                self.showSheet = true
//                            }
//                            .sheet(isPresented: $showSheet) {
//                                AuswahlView(showAuswahlSheet: self.$showAuswahlSheet)
//                            }
//                }
//                .navigationTitle("Operationen")
//            }
//
//    }


    
    struct ThirdView: View {
//        let fruits = ["Apple", "Banana", "Mango", "Pineapple"]
        let ops = Operationos()

        var body: some View {
//            NavigationView {
                List {
                    ForEach(ops.operations, id: \.self) { fruit in
                        NavigationLink(destination: DatenstreamAuswahlView()) {
                            Text(fruit)
                        }
                    }
                }
                .navigationBarTitle("Operation hinzufügen")
//            }
        }
    }
}

struct DatenstreamAuswahlView: View {
//        let fruits = ["Apple", "Banana", "Mango", "Pineapple"]
    let streams = Datenstreams()
    
    var body: some View {
            List {
                ForEach(streams.datastreams, id: \.self) { fruit in
                    NavigationLink(destination: DetailView(fruit: fruit)) {
                        Text(fruit)
                    }
                }
            }
            .navigationBarTitle("Auf welchen Datenstream anwenden?")
    }
}
    

struct AuswahlView: View {
    @Binding var showAuswahlSheet: Bool

    var body: some View {
        Button("Open Auswahl Sheet") {
            self.showAuswahlSheet = true
        }
    }
}

struct DetailView: View {
    let fruit: String

    var body: some View {
        Text(fruit)
    }
}


struct ChartTest: View {
    let streams = Datenstreams()
    @State var data: [[Double]] = [
//            [1, 2, 3, 4, 5],
//            [5, 4, 3, 2, 1],
//            [1, 1, 2, 2, 3]
//        ]
    [126.0, 130.0, 134.0, 137.0, 140.0, 142.0, 144.0, 147.0, 149.0, 150.0, 150.0, 155.0, 155.0, 156.0, 158.0, 159.0, 160.0, 160.0, 160.0, 162.0, 162.0, 161.0, 160.0, 159.0, 157.0, 155.0, 153.0, 151.0, 149.0, 146.0, 145.0, 142.0, 140.0, 138.0, 136.0, 134.0, 133.0, 130.0, 128.0, 125.0, 122.0, 119.0, 118.0, 115.0, 113.0, 110.0, 107.0, 105.0, 103.0, 101.0, 100.0, 98.0, 98.0, 97.0, 97.0, 97.0, 97.0, 97.0, 96.0, 97.0, 99.0, 102.0, 103.0, 106.0, 107.0, 109.0, 112.0, 115.0, 118.0, 122.0, 127.0, 130.0, 133.0, 136.0, 138.0, 141.0, 144.0, 149.0, 151.0, 153.0, 154.0, 155.0, 158.0, 158.0, 158.0, 159.0, 159.0, 158.0, 157.0, 156.0, 154.0, 152.0, 151.0, 150.0, 148.0, 146.0, 143.0, 141.0, 139.0, 137.0, 135.0, 133.0, 131.0, 129.0, 128.0, 124.0, 121.0, 118.0, 117.0, 113.0, 111.0, 109.0, 106.0, 103.0, 102.0, 100.0, 99.0, 98.0, 96.0, 96.0, 96.0, 96.0, 95.0, 96.0, 97.0, 99.0, 102.0, 103.0, 106.0, 108.0, 113.0, 116.0, 119.0, 123.0, 128.0, 131.0, 136.0, 137.0, 141.0, 143.0, 148.0, 151.0, 152.0, 153.0, 155.0, 158.0, 158.0, 158.0, 159.0, 159.0, 158.0, 157.0, 156.0, 154.0, 152.0, 151.0, 149.0, 147.0, 145.0, 142.0, 140.0, 138.0, 136.0, 134.0, 132.0, 130.0, 127.0, 125.0, 123.0, 119.0, 117.0, 115.0, 112.0, 110.0, 108.0, 105.0, 103.0, 101.0, 100.0, 98.0, 97.0, 95.0, 96.0, 95.0, 95.0, 95.0, 95.0, 96.0, 98.0, 101.0, 102.0, 104.0, 107.0, 109.0, 113.0, 116.0, 118.0, 123.0, 128.0, 131.0, 136.0, 138.0, 141.0, 143.0, 149.0, 152.0, 153.0, 154.0, 155.0, 158.0, 158.0, 158.0, 159.0, 159.0, 158.0, 157.0, 156.0, 153.0, 152.0, 150.0, 149.0, 146.0, 144.0, 141.0, 139.0, 137.0, 135.0, 133.0, 130.0, 128.0, 127.0, 123.0, 120.0, 118.0, 115.0, 112.0, 110.0, 108.0, 104.0, 103.0, 101.0, 99.0, 98.0, 96.0, 95.0, 95.0, 95.0, 95.0, 95.0, 96.0, 98.0, 100.0, 102.0, 104.0, 107.0, 109.0, 113.0, 116.0, 119.0, 122.0, 127.0, 130.0, 134.0, 137.0, 139.0, 141.0, 144.0, 149.0, 152.0, 152.0, 153.0, 155.0, 157.0, 157.0, 157.0, 158.0, 158.0, 157.0, 156.0, 155.0, 154.0, 151.0, 150.0, 149.0, 148.0, 146.0, 143.0, 141.0, 139.0, 137.0, 135.0, 134.0, 131.0, 129.0, 128.0, 126.0, 123.0, 119.0, 118.0, 116.0, 113.0, 111.0, 109.0, 107.0, 104.0, 103.0, 101.0, 100.0, 98.0, 98.0, 96.0, 95.0, 95.0, 95.0, 95.0, 95.0, 95.0, 96.0, 98.0, 100.0, 102.0, 103.0, 105.0, 107.0, 111.0, 114.0, 116.0, 119.0, 123.0, 127.0, 130.0, 134.0, 136.0, 138.0, 141.0, 144.0, 149.0, 151.0, 152.0, 153.0, 155.0, 156.0, 157.0, 157.0, 158.0, 158.0, 158.0, 157.0, 156.0, 155.0, 154.0, 152.0, 151.0, 150.0, 149.0, 147.0, 144.0, 142.0, 140.0, 138.0, 136.0, 134.0, 133.0, 130.0, 128.0, 126.0, 122.0, 120.0, 118.0, 115.0, 112.0, 109.0, 107.0, 104.0, 102.0, 100.0, 99.0, 98.0, 99.0, 99.0, 101.0, 102.0, 103.0, 105.0, 110.0, 114.0, 119.0, 123.0, 129.0, 135.0, 141.0, 144.0, 145.0, 155.0, 156.0, 158.0, 160.0, 161.0, 161.0, 162.0, 160.0, 157.0, 153.0, 150.0, 146.0, 140.0, 137.0, 134.0, 130.0, 127.0, 122.0, 118.0, 114.0, 109.0, 104.0, 102.0, 100.0, 98.0, 97.0, 97.0, 99.0, 101.0, 105.0, 109.0, 115.0, 121.0, 128.0, 134.0, 139.0, 143.0, 151.0, 153.0, 156.0, 157.0, 159.0, 160.0, 158.0, 156.0, 153.0, 147.0, 144.0, 138.0, 134.0, 131.0, 126.0, 123.0, 116.0, 112.0, 108.0, 103.0, 100.0, 98.0, 96.0, 96.0, 96.0, 97.0, 101.0, 104.0, 108.0, 115.0, 119.0, 127.0, 134.0, 138.0, 143.0, 150.0, 153.0, 155.0, 157.0, 158.0, 158.0, 156.0, 154.0, 150.0, 146.0, 142.0, 137.0, 133.0, 129.0, 125.0, 120.0, 116.0, 111.0, 107.0, 103.0, 99.0, 98.0, 95.0, 95.0, 96.0, 97.0, 101.0, 104.0, 108.0, 115.0, 120.0, 128.0, 135.0, 140.0, 146.0, 152.0, 154.0, 157.0, 159.0, 161.0, 160.0, 157.0, 155.0, 150.0, 145.0, 141.0, 137.0, 133.0, 129.0, 125.0, 118.0, 115.0, 110.0, 105.0, 101.0, 99.0, 97.0, 95.0, 96.0, 97.0, 99.0, 103.0, 107.0, 113.0, 119.0, 125.0, 132.0, 137.0, 142.0, 150.0, 153.0, 155.0, 157.0, 159.0, 159.0, 158.0, 154.0, 151.0, 146.0, 142.0, 138.0, 133.0, 130.0, 125.0, 119.0, 116.0, 110.0, 105.0, 102.0, 99.0, 97.0, 96.0, 96.0, 97.0, 99.0, 104.0, 108.0, 114.0, 119.0, 126.0, 133.0, 138.0, 143.0, 152.0, 154.0, 157.0, 158.0, 160.0, 160.0, 157.0, 154.0, 149.0, 145.0, 140.0, 135.0, 132.0, 127.0, 123.0, 117.0, 113.0, 109.0, 103.0, 100.0, 98.0, 96.0, 95.0, 96.0, 98.0, 102.0, 105.0, 110.0, 117.0, 122.0, 130.0, 136.0, 141.0, 149.0, 153.0, 155.0, 157.0, 158.0, 159.0, 157.0, 155.0, 151.0, 147.0, 143.0, 138.0, 134.0, 131.0, 126.0, 121.0, 116.0, 112.0, 107.0, 102.0, 99.0, 98.0, 95.0, 95.0, 96.0, 98.0, 102.0, 106.0, 111.0, 117.0, 124.0, 132.0], [120.0, 120.0, 121.0, 123.0, 124.0, 126.0, 127.0, 128.0, 129.0, 130.0, 132.0, 134.0, 136.0, 139.0, 141.0, 142.0, 143.0, 146.0, 147.0, 149.0, 152.0, 152.0, 157.0, 159.0, 160.0, 162.0, 163.0, 164.0, 165.0, 167.0, 168.0, 170.0, 171.0, 172.0, 172.0, 172.0, 171.0, 170.0, 169.0, 167.0, 165.0, 164.0, 162.0, 161.0, 159.0, 157.0, 156.0, 154.0, 152.0, 150.0, 148.0, 145.0, 144.0, 142.0, 140.0, 138.0, 136.0, 134.0, 131.0, 127.0, 126.0, 125.0, 123.0, 121.0, 119.0, 117.0, 116.0, 115.0, 113.0, 112.0, 111.0, 109.0, 107.0, 106.0, 105.0, 104.0, 104.0, 104.0, 103.0, 104.0, 104.0, 104.0, 104.0, 106.0, 106.0, 108.0, 110.0, 112.0, 115.0, 117.0, 119.0, 121.0, 122.0, 125.0, 127.0, 130.0, 133.0, 136.0, 138.0, 140.0, 143.0, 145.0, 147.0, 148.0, 149.0, 155.0, 157.0, 158.0, 161.0, 162.0, 163.0, 164.0, 167.0, 168.0, 168.0, 169.0, 170.0, 169.0, 168.0, 167.0, 165.0, 164.0, 162.0, 161.0, 160.0, 158.0, 157.0, 156.0, 154.0, 152.0, 150.0, 148.0, 146.0, 145.0, 143.0, 142.0, 140.0, 139.0, 137.0, 135.0, 134.0, 132.0, 130.0, 128.0, 125.0, 124.0, 122.0, 121.0, 119.0, 117.0, 115.0, 113.0, 111.0, 110.0, 108.0, 108.0, 107.0, 106.0, 106.0, 105.0, 105.0, 105.0, 105.0, 106.0, 106.0, 106.0, 106.0, 108.0, 109.0, 110.0, 112.0, 113.0, 116.0, 117.0, 119.0, 120.0, 123.0, 125.0, 127.0, 130.0, 134.0, 137.0, 139.0, 142.0, 144.0, 146.0, 147.0, 149.0, 155.0, 156.0, 158.0, 160.0, 161.0, 163.0, 165.0, 167.0, 168.0, 168.0, 169.0, 169.0, 168.0, 167.0, 165.0, 164.0, 162.0, 160.0, 158.0, 157.0, 155.0, 153.0, 151.0, 148.0, 146.0, 145.0, 143.0, 142.0, 139.0, 138.0, 136.0, 134.0, 133.0, 131.0, 129.0, 126.0, 124.0, 122.0, 121.0, 119.0, 116.0, 113.0, 113.0, 110.0, 108.0, 108.0, 108.0, 107.0, 106.0, 106.0, 105.0, 105.0, 104.0, 105.0, 104.0, 105.0, 105.0, 106.0, 107.0, 107.0, 109.0, 112.0, 113.0, 115.0, 117.0, 119.0, 120.0, 124.0, 126.0, 129.0, 133.0, 136.0, 138.0, 141.0, 143.0, 145.0, 146.0, 148.0, 154.0, 156.0, 158.0, 160.0, 161.0, 162.0, 165.0, 167.0, 168.0, 168.0, 169.0, 169.0, 168.0, 167.0, 165.0, 163.0, 162.0, 160.0, 159.0, 157.0, 156.0, 154.0, 152.0, 149.0, 147.0, 146.0, 144.0, 142.0, 140.0, 138.0, 136.0, 134.0, 133.0, 131.0, 128.0, 125.0, 123.0, 122.0, 120.0, 118.0, 115.0, 113.0, 111.0, 109.0, 108.0, 107.0, 107.0, 106.0, 105.0, 105.0, 105.0, 105.0, 106.0, 106.0, 106.0, 107.0, 109.0, 110.0, 113.0, 115.0, 117.0, 120.0, 123.0, 126.0, 130.0, 134.0, 138.0, 140.0, 144.0, 147.0, 149.0, 154.0, 158.0, 160.0, 162.0, 165.0, 168.0, 169.0, 170.0, 169.0, 168.0, 166.0, 162.0, 159.0, 156.0, 152.0, 148.0, 146.0, 143.0, 139.0, 136.0, 134.0, 129.0, 125.0, 121.0, 119.0, 115.0, 112.0, 109.0, 108.0, 106.0, 105.0, 105.0, 106.0, 108.0, 111.0, 114.0, 117.0, 120.0, 125.0, 130.0, 137.0, 141.0, 146.0, 148.0, 158.0, 161.0, 164.0, 167.0, 169.0, 170.0, 169.0, 166.0, 162.0, 158.0, 153.0, 148.0, 143.0, 139.0, 134.0, 131.0, 125.0, 121.0, 116.0, 112.0, 108.0, 107.0, 106.0, 105.0, 106.0, 107.0, 110.0, 114.0, 118.0, 123.0, 129.0, 136.0, 142.0, 146.0, 154.0, 158.0, 161.0, 165.0, 167.0, 168.0, 166.0, 163.0, 159.0, 154.0, 149.0, 144.0, 139.0, 135.0, 132.0, 125.0, 121.0, 116.0, 112.0, 108.0, 106.0, 104.0, 105.0, 105.0, 108.0, 112.0, 117.0, 122.0, 128.0, 136.0, 141.0, 146.0, 155.0, 159.0, 162.0, 165.0, 167.0, 166.0, 164.0, 160.0, 156.0, 151.0, 146.0, 140.0, 136.0, 132.0, 125.0, 121.0, 116.0, 112.0, 108.0, 106.0, 104.0, 104.0, 105.0, 107.0, 112.0, 117.0, 123.0, 129.0, 138.0, 145.0, 148.0, 157.0, 160.0, 163.0, 167.0, 167.0, 166.0, 162.0, 158.0, 153.0, 148.0, 142.0, 137.0, 133.0, 127.0, 122.0, 118.0, 112.0, 107.0, 106.0, 104.0, 104.0, 104.0, 106.0, 111.0, 116.0, 121.0, 128.0, 137.0, 144.0, 147.0, 156.0, 160.0, 163.0, 167.0, 168.0, 166.0, 162.0, 158.0, 153.0, 147.0, 141.0, 137.0, 133.0, 126.0, 121.0, 116.0, 110.0, 107.0, 105.0, 103.0, 103.0, 102.0, 104.0, 109.0, 114.0, 120.0, 126.0, 134.0, 141.0, 146.0, 155.0, 159.0, 162.0, 166.0, 166.0, 165.0, 163.0, 159.0, 156.0, 153.0, 151.0, 148.0, 147.0, 146.0, 146.0, 145.0, 144.0, 143.0, 142.0, 141.0, 140.0, 138.0, 137.0, 135.0, 134.0, 133.0, 132.0, 130.0, 129.0, 127.0, 126.0, 124.0, 122.0, 120.0, 117.0],
        [118.0, 121.0, 121.0, 123.0, 124.0, 126.0, 128.0, 131.0, 131.0, 133.0, 135.0, 136.0, 138.0, 139.0, 139.0, 140.0, 144.0, 147.0, 147.0, 148.0, 149.0, 150.0, 150.0, 149.0, 149.0, 149.0, 149.0, 149.0, 148.0, 148.0, 148.0, 147.0, 146.0, 145.0, 144.0, 143.0, 142.0, 141.0, 140.0, 138.0, 136.0, 135.0, 134.0, 132.0, 131.0, 129.0, 127.0, 125.0, 123.0, 121.0, 120.0, 116.0, 113.0, 110.0, 109.0, 107.0, 105.0, 104.0, 102.0, 100.0, 98.0, 96.0, 95.0, 91.0, 92.0, 90.0, 88.0, 88.0, 87.0, 88.0, 88.0, 88.0, 89.0, 91.0, 93.0, 95.0, 97.0, 98.0, 100.0, 103.0, 106.0, 109.0, 113.0, 117.0, 120.0, 123.0, 127.0, 129.0, 133.0, 134.0, 136.0, 140.0, 141.0, 143.0, 145.0, 146.0, 145.0, 146.0, 147.0, 147.0, 147.0, 146.0, 146.0, 145.0, 144.0, 143.0, 142.0, 140.0, 139.0, 137.0, 135.0, 133.0, 131.0, 129.0, 126.0, 124.0, 122.0, 119.0, 118.0, 114.0, 110.0, 108.0, 106.0, 104.0, 103.0, 101.0, 98.0, 96.0, 95.0, 91.0, 90.0, 90.0, 88.0, 87.0, 86.0, 85.0, 86.0, 87.0, 88.0, 90.0, 93.0, 95.0, 96.0, 98.0, 101.0, 103.0, 107.0, 109.0, 115.0, 119.0, 122.0, 126.0, 128.0, 132.0, 134.0, 135.0, 140.0, 141.0, 142.0, 144.0, 145.0, 145.0, 144.0, 144.0, 144.0, 144.0, 143.0, 143.0, 142.0, 140.0, 139.0, 138.0, 137.0, 135.0, 133.0, 131.0, 128.0, 126.0, 125.0, 122.0, 120.0, 117.0, 113.0, 110.0, 108.0, 106.0, 104.0, 102.0, 99.0, 97.0, 95.0, 93.0, 90.0, 90.0, 89.0, 88.0, 87.0, 85.0, 86.0, 86.0, 87.0, 90.0, 92.0, 94.0, 95.0, 97.0, 101.0, 104.0, 107.0, 111.0, 116.0, 119.0, 123.0, 126.0, 130.0, 133.0, 135.0, 139.0, 141.0, 141.0, 144.0, 145.0, 145.0, 144.0, 144.0, 145.0, 144.0, 144.0, 143.0, 142.0, 141.0, 139.0, 138.0, 136.0, 134.0, 132.0, 130.0, 128.0, 126.0, 124.0, 121.0, 119.0, 116.0, 111.0, 108.0, 107.0, 104.0, 103.0, 101.0, 98.0, 96.0, 94.0, 90.0, 90.0, 89.0, 88.0, 87.0, 86.0, 86.0, 87.0, 88.0, 91.0, 93.0, 95.0, 96.0, 99.0, 103.0, 106.0, 109.0, 115.0, 118.0, 122.0, 126.0, 129.0, 133.0, 134.0, 139.0, 141.0, 142.0, 144.0, 145.0, 144.0, 145.0, 146.0, 145.0, 145.0, 145.0, 143.0, 141.0, 141.0, 140.0, 138.0, 136.0, 133.0, 131.0, 129.0, 127.0, 124.0, 122.0, 119.0, 117.0, 113.0, 110.0, 107.0, 105.0, 103.0, 101.0, 99.0, 96.0, 94.0, 91.0, 90.0, 89.0, 89.0, 89.0, 89.0, 89.0, 90.0, 93.0, 96.0, 96.0, 100.0, 105.0, 110.0, 115.0, 121.0, 125.0, 129.0, 134.0, 137.0, 141.0, 143.0, 145.0, 148.0, 147.0, 147.0, 147.0, 145.0, 144.0, 143.0, 140.0, 138.0, 135.0, 132.0, 127.0, 124.0, 121.0, 114.0, 110.0, 105.0, 102.0, 98.0, 94.0, 91.0, 90.0, 89.0, 90.0, 91.0, 94.0, 96.0, 101.0, 107.0, 115.0, 123.0, 128.0, 133.0, 138.0, 142.0, 145.0, 147.0, 148.0, 147.0, 146.0, 143.0, 141.0, 138.0, 134.0, 129.0, 124.0, 120.0, 114.0, 108.0, 103.0, 99.0, 95.0, 91.0, 88.0, 87.0, 88.0, 90.0, 93.0, 95.0, 102.0, 111.0, 121.0, 127.0, 133.0, 139.0, 142.0, 146.0, 146.0, 147.0, 146.0, 144.0, 141.0, 139.0, 134.0, 129.0, 124.0, 119.0, 114.0, 107.0, 102.0, 99.0, 94.0, 90.0, 88.0, 86.0, 88.0, 90.0, 93.0, 97.0, 105.0, 114.0, 122.0, 128.0, 134.0, 141.0, 143.0, 145.0, 145.0, 146.0, 145.0, 142.0, 140.0, 136.0, 131.0, 127.0, 122.0, 118.0, 110.0, 105.0, 101.0, 97.0, 91.0, 89.0, 87.0, 86.0, 87.0, 90.0, 93.0, 98.0, 107.0, 117.0, 124.0, 131.0, 135.0, 142.0, 145.0, 145.0, 147.0, 146.0, 145.0, 142.0, 140.0, 135.0, 130.0, 126.0, 121.0, 116.0, 109.0, 104.0, 101.0, 96.0, 90.0, 88.0, 86.0, 87.0, 88.0, 91.0, 95.0, 101.0, 110.0, 121.0, 128.0, 133.0, 139.0, 143.0, 146.0, 146.0, 147.0, 146.0, 143.0, 141.0, 137.0, 132.0, 127.0, 122.0, 117.0, 109.0, 104.0, 101.0, 96.0, 91.0, 88.0, 86.0, 85.0, 87.0, 90.0, 94.0, 100.0, 107.0, 117.0, 124.0, 130.0, 137.0, 142.0, 146.0, 146.0, 147.0, 145.0, 143.0, 140.0, 137.0, 133.0, 128.0, 123.0, 118.0, 110.0, 106.0, 101.0, 96.0, 91.0, 88.0, 85.0, 84.0, 85.0, 89.0, 93.0, 98.0, 106.0, 115.0, 122.0, 128.0, 135.0, 141.0, 144.0, 146.0, 146.0, 145.0, 144.0, 140.0, 138.0, 133.0, 129.0, 124.0, 118.0, 113.0, 106.0, 101.0, 96.0, 91.0, 88.0, 84.0, 83.0, 84.0, 87.0, 90.0, 95.0, 103.0, 113.0, 120.0, 127.0, 132.0, 140.0, 142.0, 145.0, 145.0, 145.0, 143.0, 141.0, 138.0, 135.0, 130.0, 124.0, 120.0, 115.0, 107.0, 103.0, 98.0, 93.0, 89.0, 86.0, 84.0, 84.0, 85.0, 89.0]]
    var body: some View {
        
//        MultiLineChartView(data: [([8,32,11,23,40,28], GradientColors.green), ([90,99,78,111,70,60,77], GradientColors.purple), ([34,56,72,38,43,100,50], GradientColors.orngPink)], title: "Title")
        
        
//        ScrollView{
//            VStack(alignment: .center){
//                LineView(data: streams.datenstream1, title: "Line Graph Example", legend: "Stream 1").scaledToFit()
//
//
//                LineView (data: streams.datenstream2, title: "Line Graph Example", legend: "Stream 2").scaledToFit()
//
//                LineView(data: streams.datenstream3, title: "Line Graph Example", legend: "Stream 3").scaledToFit()
//
//        }
//        }
        
        ScrollView {
            
            LineView(data: self.data[2], title: "Summe").scaledToFit()
            
            Text("Der Hochpunkt liegt bei x m/s").scaledToFit()
            
                    ForEach(0..<data.count, id: \.self) { index in
                        LineView(data: self.data[index], title: "Graph \(index+1)").scaledToFit()
                    }
            
//            LineView(data: self.data[2], title: "Resultierende").scaledToFit()
            
            MultiLineChartView(data: [(streams.datenstream3, GradientColors.green), ([34.7], GradientColors.orngPink)], title: "Line Graph Example", legend: "Stream 3").scaledToFit()
                }
    }
}





struct Template_Previews: PreviewProvider {
    static var previews: some View {
        Template()
    }
}


struct FunctionHolder {
    let name: String
    let function: () -> Void
}

//MARK: Opertionen
struct Operationos{
    public func calculateAverage(numbers: [Double]) -> Double {
        let sum = numbers.reduce(0, +)
        let average = Double(sum) / Double(numbers.count)
        return average
         
    }

    public func calculateSum(numbers: [Double]) -> Double {
        let sum = numbers.reduce(0, +)
        return sum
    }

    public func findLargestNumber(numbers: [Double]) -> Double {
        return numbers.max()!
    }
    
    public func drawChart(numbers: [Double]) -> [Double] {
        return numbers
    }

    public func findSmallestNumber(numbers: [Double]) -> Double {
        return numbers.min()!
    }
    
    public func additionMatrices(numbers: [Double], numbers2: [Double]) -> [Double] {
        return numbers + numbers2
    }
    
    public func greet() {
        print("Hello, World!")
    }

    public func sayGoodbye() {
        print("Goodbye, World!")
    }

    let fruits = ["Apple", "Banana", "Mango", "Pineapple"]
    let operations = ["Mittelwert", "Summe", "Hochpunkt", "Tiefpunkt", "Graph anzeigen"]
//    let operations = [Operations.calculateAverage, Operations.calculateSum, Operations.findLargestNumber, Operations.findSmallestNumber]
    
}


struct Gespeicherte_Templates{
    @State private var data3: [ChartDataEntry] = [
        ChartDataEntry(x: 1627812000, y: 312, icon: NSUIImage(systemName: "cart"), data: "My data"),
        ChartDataEntry(x: 1627898400, y: 189, icon: NSUIImage(systemName: "cart"), data: "My data"),
        ChartDataEntry(x: 1627984800, y: 129, icon: NSUIImage(systemName: "cart"), data: "My data"),
        ChartDataEntry(x: 1628071200, y: 89, icon: NSUIImage(systemName: "cart"), data: "My data")
    ]
    public func ErsterTemplateTest() {
        print("Goodbye, World!")
    }
    
    let Namen_Templates = ["Template 1", "Template 2", "Template 3"]
//    let operations = [Operations.calculateAverage, Operations.calculateSum, Operations.findLargestNumber, Operations.findSmallestNumber]
    
}

struct AktuellesTemplate_Operationen{
    let aktuelleOperationen = ["Graph anzeigen - Daten1", "Resultierende berechnen - Daten1, Daten2, Daten3", "Summe - Daten1, Daten2"]
}




//MARK: Matrix um Templates erstellen

//Nur Int zu Int:
class Matrix {
    let function: ([Int]) -> Int
    let numbers: [Int]

    init(function: @escaping ([Int]) -> Int, numbers: [Int]) {
        self.function = function
        self.numbers = numbers
    }
}

//Kann Int zu alles:
//class Matrix {
//    let function: ([Int]) -> Any
//    let type: String
//    init(function: @escaping ([Int]) -> Any, type: String) {
//        self.function = function
//        self.type = type
//    }
//}

////Initialisieren der Matrix:
//let matrix = [Matrix(function: highestNumber, numbers: [1,5,2,4,3]),
//              Matrix(function: lowestNumber, numbers: [6,3,9,1,8])]

////Aufrufen der Matrix:
//for row in matrix {
//    let result = row.function(row.numbers)
//    print(result)
//}

var matrix: [Matrix] = []

func addMatrix(function: @escaping ([Int]) -> Int, numbers: [Int]) {
    matrix.append(Matrix(function: function, numbers: numbers))
}

//addMatrix(function: highestNumber, numbers: [1,5,2,4,3])
//addMatrix(function: lowestNumber, numbers: [6,3,9,1,8])

//Neue Ausgabe
//Für Any->Any
//let matrix: [(Any) -> Any] = [function1, function2, function3]
//for function in matrix {
//    if let intFunction = function as? ([Int]) -> Int {
//        let result = intFunction([1, 2, 3])
//        print("Result: \(result)")
//    } else if let stringFunction = function as? ([Int]) -> String {
//        let result = stringFunction([1, 2, 3])
//        print("Result: \(result)")
//    }
//}


//enum MyFuncs {
//    case Arity0 ( ([Double]) -> Double )
//    case Arity1 ( ([Double]) -> Double )
////    case Arity2 ( (Int, String) -> Void)
////    case Arity3 ( (Int, String) -> Void)
////    case Arity4 ( ([Double]) -> Double )
////    case Arity5 ( (Int, String) -> Void)
//}
//
//let functions = Operationos()
//var funcs = Array<MyFuncs>()
//
//funcs.append(MyFuncs.Arity0(functions.calculateSum))
////funcs.append(MyFuncs.Arity2(someFunc))
//
//for f in funcs {
//    switch f {
//    case let .Arity0(f):
//        f()  // call the function with no arguments
//    case let .Arity2(f):
//        f(2,"fred") // call the function with two args
//    }
//}

class DataStore: ObservableObject {
    @Published var functionName: String = ""
}

//MARK: Datenstreams
struct Datenstreams{
    let datenstream1 = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]
    let datenstream2 = [9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0]
    let datenstream3 = [12.54, 53.42, 32.11, 44.99, 12.54, 153.42, 132.11, 144.99, 312.54, 353.42, 32.11, 44.99]
    
    let datastreams = ["Daten 1", "Daten 2", "Daten 3"]
}
