//
//  PatientChartDetailView.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import SwiftUI

struct PatientChartDetailView: View {
    
    @Binding var patientData : PatientInfoModel
    
    @State var gridThreeColumnLayout : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            client_section
            
            patient_section
            
            quick_links_section
            
            Spacer()
        }.padding(.all,10)
    }
}

struct PatientChartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PatientChartDetailView(patientData: .constant(dev.patientDetail))
        }
    }
}


extension PatientChartDetailView{
    //client section
    private var client_section : some View{
        
        VStack(alignment: .leading){
            Text("Client Information")
                .underline()
                .font(.title)
                .foregroundColor(Color.primary)
                .bold()
            
            
            HStack{
                Text("\(patientData.client.firstName)").bold()
                Text("\(patientData.client.lastName)").bold()
            }
            .font(.title2)
           
            
            client_detail_section
        }
        
    }
    
    private var client_detail_section : some View{
        
        LazyVGrid(columns: gridThreeColumnLayout,alignment: .leading, spacing: 10){
            LabelImageControl(systemImageName: .constant("phone"), label: $patientData.client.phoneNumber)
            
            LabelImageControl(systemImageName: .constant("envelope"), label: $patientData.client.emailAddress)
            
            LabelImageControl(systemImageName: .constant("location"), label: $patientData.client.clientAddress)
            
            
        }
    }
    
    //patient section
    private var patient_section : some View{
        
        VStack(alignment: .leading){
            Text("Patient Information (Id: \(firstFiveDigits(text: patientData.patient.id)))")
                .underline()
                .font(.title3)
                .foregroundColor(Color.primary)
                .bold()
            
            
            HStack{
                Text("\(patientData.patient.name)").font(.title2).bold()

            }
            
            patient_detail_section
        }
        
    }
    
    
    private var patient_detail_section : some View{
        LazyVGrid(columns: gridThreeColumnLayout,alignment: .leading, spacing: 10){
            
            LabelTextControl(value: $patientData.patient.breedType, label:  .constant("breed"))
            
            LabelTextControl(value: $patientData.patient.color, label:  .constant("color"))
            
            LabelTextControl(value: .constant(String(patientData.patient.weight)), label:  .constant("weight"))
            
            LabelTextControl(value: $patientData.patient.weightUnit, label:  .constant("weight unit"))
            
            LabelTextControl(value: $patientData.patient.birthdate, label:  .constant("birthday"))
            
            LabelTextControl(value: .constant(patientData.patient.altered ? "Yes" : "No"), label:  .constant("Altered"))
            
            LabelTextControl(value: $patientData.patient.sex, label:  .constant("sex"))
            
            LabelTextControl(value: $patientData.patient.species, label:  .constant("species"))
        }
    }
    
    
    func firstFiveDigits(text : UUID) -> String
    {
        return String(patientData.patient.id.uuidString.prefix(5))
    }
    
    private var quick_links_section : some View{
        VStack(alignment: .leading, spacing: 10){
            Text("Quick Links")
                .underline()
                .font(.title)
                .foregroundColor(Color.primary)
                .bold()
            
            QuickLinksView(patientDetail: $patientData)
            
        }
    }
    
    
}


struct LabelImageControl : View{
    @Binding var systemImageName : String
    @Binding var label : String
    
    var body: some View{
        HStack{
            Image(systemName: systemImageName)
            Text("\(label)")
        }
        .font(.subheadline)
        .foregroundColor(Color.primary)
    }
}


struct LabelTextControl : View{
    @Binding var value : String
    @Binding var label : String
    
    @State var align : HorizontalAlignment = .leading
    
    var body: some View{
        VStack(alignment: align){
            Text("\(label.capitalized)")
                .font(.subheadline)
                
            Text("\(value)")
                .font(.title3)
        }
        .foregroundColor(Color.primary)
    }
}
