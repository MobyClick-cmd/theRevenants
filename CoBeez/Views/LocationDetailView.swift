//
//  LocationDetailView.swift
//  CoBeez
//
//  Created by Francesco on 21/02/22.
//

import SwiftUI

struct LocationDetailView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    let yellowAppColor = Color("yellowapp")
    
    let location: Location
    
    var body: some View {
        VStack {
        ScrollView{
            VStack{
                imageSection
                
                VStack(alignment: .leading, spacing: 16){
                    titleSection
                    Divider()
                    descriptionSection
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.thickMaterial)
                .cornerRadius(20)
                .offset(y: -20)
                

            }
        }
        .ignoresSafeArea()

            timeAndButton
                .padding()
        }
        .background(.thickMaterial)
        .overlay(backButton, alignment: .topTrailing)
    }
}

extension LocationDetailView {
    
    private var imageSection: some View {
        
        TabView{
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 400)
        .tabViewStyle(PageTabViewStyle())
        
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            HStack {
                Image("Pin")
                Text("\(location.street), \(location.cityName)")
                    .font(.system(size: 15) .weight(.semibold))
                    .foregroundColor(.secondary)
            }
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            //            if let url = URL(string: location.link){
            //                Link("Go on the site", destination: url)
            //                    .font(.headline)
            //                    .tint(yellowAppColor)
            //            }
        }
    }
    
    private var timeAndButton: some View {
        HStack {
            HStack {
                Image("Clock")
                Text(location.time)
                    .font(.system(size: 12) .weight(.medium))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            Button("Go!") {
                //                comando per portare a mappe
                let url = URL(string: "maps://?daddr=\(location.coordinates.latitude),\(location.coordinates.longitude)")
                if UIApplication.shared.canOpenURL(url!) {
                    UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                }
                
                
            }
            .frame(width: 80)
            .padding()
            .foregroundColor(.white)
            .background(yellowAppColor)
            .clipShape(Capsule())
        }
    }
    
    private var backButton: some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
            //                .padding(16)
                .frame(width: 50, height: 50)
                .foregroundColor(yellowAppColor)
                .background(.thickMaterial)
                .cornerRadius(20)
                .shadow(radius: 4)
                .padding()
        }
    }
    
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataServices.locations.first!)
    }
}
