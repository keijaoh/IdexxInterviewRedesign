//
//  PractiveInfoView.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import SwiftUI
import MapKit

struct PracticeInfoView: View {
    @StateObject var practice_vm : PracticeViewModel = PracticeViewModel()
    
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            slideshow
            
            Section{
                title_section
                
                phone_numbers_section
                
                buttons_section
            }.padding(.horizontal,10)
           // Spacer()
            Divider()
            //MARK:Add a static map here of the IDEXX location in the photo
            staticMapLayer
                .frame(width: UIScreen.main.bounds.width)
            
           
        }.padding(.all,5)
    }
}

struct PractiveInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeInfoView()
    }
}

extension PracticeInfoView{
    
    private var title_section : some View{
        Section{
            Text("\(practice_vm.practiceDetail.placeName)")
                .font(.title)
                .foregroundColor(Color.primary)
                .bold()
            Text("\(practice_vm.practiceDetail.address)")
                .font(.title3)
                .foregroundColor(Color.theme.secondaryText)
            
        }
    }
    
    private var phone_numbers_section : some View{
        Section{
            Text("Numbers")
                .font(.title)
                .foregroundColor(Color.primary)
                .bold()
          
            
            ForEach(practice_vm.practiceDetail.phoneNumbers, id: \.id){phone in
                HStack(alignment: .top,spacing: 5){
                    Text("\(phone.type)")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(Color.theme.secondaryText)
                    
                    Text("\(phone.phoneNumber)")
                        .font(.subheadline)
                        .foregroundColor(Color.primary)
                }
                
            }
            
            
        }
    }
    private var buttons_section : some View{
        
        HStack(spacing: 15){
            Button {
                //call action
            } label: {
                HStack{
                    Image(systemName: "phone")
                    Text("Call").font(.subheadline)
                }.roundedButtonStyle()
            }
            
            Button {
                //email action
            } label: {
                HStack{
                    Image(systemName: "envelope")
                    Text("Email").font(.subheadline)
                }.roundedButtonStyle()
            }
            
            Button {
                //location action
            } label: {
                HStack{
                    Image(systemName: "location")
                    Text("Location").font(.subheadline)
                }.roundedButtonStyle()
            }

        }
    }
    
    
    private var slideshow : some View{
        
        VStack{
            TabView{
                
                ForEach(self.practice_vm.slide_imgs, id: \.self){ img in
                    
                    Image("\(img)")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width,height: 200,alignment: .leading)
                    
                }
                
            }.background(Color.blue)
                .cornerRadius(10)
                .frame(height: 200)
                .tabViewStyle(PageTabViewStyle())
                .padding(.leading,5)
                .padding(.trailing,5)
        }
        
    }
    
}

extension PracticeInfoView{
    
    private var staticMapLayer : some View{
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: practice_vm.practiceDetail.location.latitude, longitude:practice_vm.practiceDetail.location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [practice_vm.practiceDetail.location]) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude:location.longitude)){
                //Custom Pin here
               
                Section{
                    if location.type == "Headquaters"{
                        HeadQuartersMarker()
                      
                    }
                
                    else{
                        LocationMapAnnotationView()
                    }
                    
                }
                    .shadow(radius: 10)
                
            }
        }.allowsHitTesting(false)//disable touching and moving the map makeing it static
            //.aspectRatio(1,contentMode: .fit)
            //.cornerRadius(30)
            
        
        
        
    }
}
