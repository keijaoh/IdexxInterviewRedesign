//
//  CheckInOutView.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import SwiftUI

struct CheckInOutView: View {
    
    @Binding var patientDetail : PatientInfoModel
    
    var body: some View {
        VStack(alignment: .leading){
            
         
            HStack{
                LabelTextControl(value: $patientDetail.checkInOutDetail.locationName, label: .constant("location"))
                Spacer()
                VStack(alignment: .leading){
                    LabelTextControl(value: .constant(patientDetail.checkInOutDetail.dateIn.asShortDateString()), label: .constant("date in"),align: .trailing)
                    
                    LabelTextControl(value: .constant(patientDetail.checkInOutDetail.dateIn.asShortDateString()), label: .constant("date out"),align: .trailing)
                    
                   
                }
            }
            LabelTextControl(value: $patientDetail.checkInOutDetail.description, label: .constant("description"))
            
            
            
            Spacer()
            
                .navigationTitle("Check-In/Outs")
                .navigationBarTitleDisplayMode(.inline)
        }.padding(.all,10)
    }
}

struct CheckInOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInOutView(patientDetail: .constant(dev.patientDetail))
    }
}


extension Date{
    
    init(dateStr : String){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let date = formatter.date(from: dateStr) ?? Date()
        self.init(timeInterval: 0, since: date)
        
    }
    
    private var shortDateFormat : DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        return formatter
    }
    
    func asShortDateString() -> String{
        return shortDateFormat.string(from: self)
    }
    
}
