//
//  QuickLinksView.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import SwiftUI

struct QuickLinksView: View {
    
    @Binding var patientDetail : PatientInfoModel
    @State var gridThreeColumnLayout : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        LazyVGrid(columns: gridThreeColumnLayout,alignment: .leading,spacing: 4) {
            check_in_out_section
            
            appointments_section
            
            medical_notes_section
            
            laboratory_section
            
            prescription_section
            
            problems_section
        }
        
    }
}

struct QuickLinksView_Previews: PreviewProvider {
    static var previews: some View {
       
        QuickLinksView(patientDetail: .constant(dev.patientDetail))
      
    }
}


extension QuickLinksView{
    
    private var check_in_out_section : some View{
        
        NavigationLink(destination: CheckInOutView(patientDetail: $patientDetail)) {
            VStack(spacing: 5){
                Image(systemName: "checkmark.square")
                  
                Text("Check In/Outs")
                    .font(.subheadline)
                    .bold()
            }.foregroundColor(.white)
        }
        .frame(width: 120,height: 70)
        .background(Color.blue)
        .cornerRadius(10)
    }
    
    private var appointments_section : some View{
        
        NavigationLink(destination: AppointmentView(patientData: $patientDetail)) {
            VStack(spacing: 5){
                Image(systemName: "calendar")
                  
                Text("Appointments")
                    .font(.subheadline)
                    .bold()
            }.foregroundColor(.white)
        }
        .frame(width: 120,height: 70)
        .background(Color.orange)
        .cornerRadius(10)
    }
    
    private var medical_notes_section : some View{
        
        NavigationLink(destination: MedicalNotesView()) {
            VStack(spacing: 5){
                Image(systemName: "note.text")
                  
                Text("Medical Notes")
                    .font(.subheadline)
                    .bold()
            }.foregroundColor(.white)
        }
        .frame(width: 120,height: 70)
        .background(Color.green)
        .cornerRadius(10)
    }
    
    
    private var laboratory_section : some View{
        
        NavigationLink(destination: LaboratoryView()) {
            VStack(spacing: 5){
                Image(systemName: "eyedropper.halffull")
                  
                Text("Laboratory")
                    .font(.subheadline)
                    .bold()
            }.foregroundColor(.white)
        }
        .frame(width: 120,height: 70)
        .background(Color.teal)
        .cornerRadius(10)
    }
    
    
    private var prescription_section : some View{
        
        NavigationLink(destination: LaboratoryView()) {
            VStack(spacing: 5){
                Image(systemName: "pills")
                  
                Text("Prescription")
                    .font(.subheadline)
                    .bold()
            }.foregroundColor(.white)
        }
        .frame(width: 120,height: 70)
        .background(Color.purple)
        .cornerRadius(10)
    }
    
    private var problems_section : some View{
        
        NavigationLink(destination: LaboratoryView()) {
            VStack(spacing: 5){
                Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
                  
                Text("Problems")
                    .font(.subheadline)
                    .bold()
            }.foregroundColor(.white)
        }
        .frame(width: 120,height: 70)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
        .background(Color.black)
        .cornerRadius(10)
    }
    
}
