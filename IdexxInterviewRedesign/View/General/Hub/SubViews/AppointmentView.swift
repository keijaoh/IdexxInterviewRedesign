//
//  AppointmentView.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import SwiftUI

struct AppointmentView: View {
    @Binding var patientData : PatientInfoModel
    
    @State private var searchText : String = ""
    
    var searchResults : [AppointmentModel]{
        
        if !patientData.appointments.isEmpty{
            if searchText.isEmpty{
                return patientData.appointments
            }
            else{
                return patientData.appointments.filter{ $0.description.contains(searchText) ||
                    $0.appDate.asShortDateString().contains(searchText)
                    
                }
            }
        }
        else{
            return [AppointmentModel]()
        }
    }
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            List{
                ForEach(patientData.appointments,id: \.id){ appointment in
                    
                    AppointmentCardView(appointment: .constant(appointment))
                    
                }
            }.listStyle(.plain)
            
                .navigationTitle("Appointments")
                .navigationBarTitleDisplayMode(.inline)
        }.searchable(text: $searchText){
            ForEach(searchResults, id: \.id){ result in
                
                Text("Are you looking for \(result.description)?")
                    .searchCompletion(result.description)
                
            }
        }
        .refreshable {
            //refresh or reload method called
        }
        
    }
}

struct AppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppointmentView(patientData: .constant(dev.patientDetail))
        }
    }
}





struct AppointmentCardView : View{
    @Binding var appointment : AppointmentModel
    
    var body: some View{
        appoint_section
    }
}

extension AppointmentCardView{
    
   
    
    private var appoint_section : some View{
        
        Section{
            VStack(alignment: .leading){
                Text("\("\(appointment.description)")")
                    .font(.body)
                    .foregroundColor(Color.primary)
                    .bold()
                Spacer().frame(height: 25)
                HStack{
                    Spacer()
                    
                    LabelTextImageControl(value: .constant(appointment.appDate.asShortDateString()), label: .constant("date"), systemImageName: .constant("clock"), align: .trailing)
                }
              
            }
         
            
        }
    }
}


struct LabelTextImageControl : View{
    @Binding var value : String
    @Binding var label : String
    @Binding var systemImageName : String
    
    @State var align : HorizontalAlignment = .leading
    
    var body: some View{
        VStack(alignment: align){
            Text("\(label.capitalized)")
                .font(.subheadline)
                
            HStack{
                
                Image(systemName: systemImageName)
                    .font(.subheadline)
                    .foregroundColor(Color.primary)
                Text("\(value)")
                    .font(.title3)
            }
        }
        .foregroundColor(Color.primary)
    }
}
