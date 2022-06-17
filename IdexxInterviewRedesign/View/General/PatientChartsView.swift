//
//  PatientChartsView.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import SwiftUI

struct PatientChartsView: View {
    
    @StateObject var patient_vm : PatientInfoViewModel = PatientInfoViewModel()
    @State var showChartView : Bool = false
    @State private var searchText : String = ""
    
    @State var targetPatient : PatientInfoModel = PatientInfoModel()
    
    var searchResults : [PatientInfoModel]{
        
        if !patient_vm.patientsDetail.isEmpty{
            if searchText.isEmpty{
                return patient_vm.patientsDetail
            }
            else{
                return patient_vm.patientsDetail.filter{ $0.patient.name.contains(searchText) ||
                    $0.client.firstName.contains(searchText) ||
                    $0.client.lastName.contains(searchText) ||
                    $0.patient.breedType.contains(searchText)
                    
                }
            }
        }
        else{
            return [PatientInfoModel]()
        }
    }
    
    
    var body: some View {
        NavigationView {
            
            
            ZStack{
                VStack(alignment: .leading,spacing: 10){
                    
                    patient_list_section
                    
                }
            }.background(
                //PatientChartDetailView
                NavigationLink(destination: PatientChartDetailView(patientData: $targetPatient),isActive: $showChartView, label: {
                    EmptyView()
                })
            )
            
            .navigationTitle("Patient Charts")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PatientChartsView_Previews: PreviewProvider {
    static var previews: some View {
        PatientChartsView()
    }
}


extension PatientChartsView{
    
    private var patient_list_section : some View{
        Section{
            VStack{
                List{
                    ForEach(searchResults, id: \.id){ profile in
                        
                        PatientCard(profile: .constant(profile))
                            .padding(.all,9)
                            .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                            .listRowBackground(Color.theme.background)
                            .onTapGesture {
                                
                                self.targetPatient = profile
                                
                                self.showChartView.toggle()
                            }
                          
                    }
                }.listStyle(.plain)
                
            }.searchable(text: $searchText){
                ForEach(searchResults, id: \.id){ result in
                    
                    Text("Are you looking for \(result.patient.name)?")
                        .searchCompletion(result.patient.name)
                    
                }
            }
            .refreshable {
                //refresh or reload method called
            }
            
           
        }
    }
}


struct PatientCard : View{
    
    @Binding var profile : PatientInfoModel
    
    var body: some View{
        VStack(alignment: .leading,spacing: 10){
            HStack(spacing: 10){
                patient_section
                
            }
            client_section
        }
        
    }
    
    
    
    
}


extension PatientCard{
    
    
    private var patient_section : some View{
        
        Section{
            VStack(alignment: .leading){
                Text("\(profile.patient.name)")
                    .font(.title2)
                    .foregroundColor(Color.primary)
                    .bold()
                
                Text("\(profile.patient.breedType)")
                    .font(.subheadline)
                    .foregroundColor(Color.secondary)
            }
            Spacer()
            Text(profile.patient.color)
                .font(.callout)
                .bold()
            
        }
    }
    
    
    private var client_section : some View{
        Section{
            VStack(alignment: .leading,spacing: 10){
                Text("Client")
                    .font(.subheadline)
                    .foregroundColor(Color.secondary)
                    .bold()
                    .underline()
                HStack{
                    Text("\(profile.client.firstName)")
                        .font(.title3)
                        .foregroundColor(Color.secondary)
                        .bold()
                    Text("\(profile.client.lastName)")
                        .font(.title3)
                        .foregroundColor(Color.secondary)
                        .bold()
                    
                    HStack{
                        Spacer()
                        VStack(alignment: .trailing){
                            HStack{
                                Image(systemName: "clock")
                                Text("Updated at")
                                    .font(.subheadline)
                            }
                            Text("\(profile.recordedDateTime)")
                                .font(.subheadline)
                                .foregroundColor(Color.primary)
                                .bold()
                        }
                    }
                }
                
              
            }
        }
    }
}
