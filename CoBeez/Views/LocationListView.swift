//
//  LocationListView.swift
//  Beezy
//
//  Created by Francesco on 17/02/22.
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject private var vm:LocationsViewModel
    
    init() { UITableView.appearance().backgroundColor = .clear }
    
    var body: some View {
        List{
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                    
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
                
            }
            .listStyle(PlainListStyle())
            .foregroundColor(.primary)
        }
    }
}

extension LocationListView {

    private func listRowView(location: Location) -> some View{
        HStack{
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
            .environmentObject(LocationsViewModel())
    }
}
