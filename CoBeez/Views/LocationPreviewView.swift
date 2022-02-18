//
//  LocationPreviewView.swift
//  Beezy
//
//  Created by Francesco on 18/02/22.
//

import SwiftUI

struct LocationPreviewView: View {
    let location: Location
    @EnvironmentObject private var vm: LocationsViewModel
    let yellowAppColor = Color("yellowapp")
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0){
            VStack (alignment: .leading,spacing: 16){
            imageSection
            titleSection

          }
            
            VStack(spacing: 8){
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background{
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:65)
        }
        .cornerRadius(10)
    }
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                

            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
        
    }
    
    private var titleSection: some View {
        
        VStack(alignment: .leading, spacing: 4){
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125, height: 35)
                .padding(7)
                .background(yellowAppColor)
                .cornerRadius(10)
                .foregroundColor(.black)
        }
    }
    


    private var nextButton: some View {
    Button {
        vm.nextButtonPressed()
    } label: {
        Text("Next")
            .font(.headline)
            .frame(width: 125, height: 35)
            .foregroundColor(yellowAppColor)
            .padding(7)
            .background(.white)
            .cornerRadius(10)
            .foregroundColor(.black)
    }
}
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreviewView(location: LocationsDataServices.locations.first!)
    }
}
