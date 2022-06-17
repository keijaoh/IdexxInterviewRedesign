//
//  ContentView.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
        TabView{
            PracticeInfoView()
                .navigationViewStyle(.stack)
                .tabItem {
                    VStack{
                        Image(systemName: "building")
                        Text("Practice")
                    }
                }.tag(0)
            
            PatientChartsView()
                .navigationViewStyle(.stack)
                .tabItem {
                    VStack{
                        Image(systemName: "chart.bar")
                        Text("Charts")
                    }
                }.tag(1)
            
           /* PatientChartDetailView(patientData: .constant(PatientInfoModel()))
                .navigationViewStyle(.stack)
                .tabItem {
                    VStack{
                        Image(systemName: "chart.bar.doc.horizontal")
                        Text("Chart Detail")
                    }
                }.tag(0)*/
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
