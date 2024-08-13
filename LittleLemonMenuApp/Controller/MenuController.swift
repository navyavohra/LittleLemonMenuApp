//
//  MenuController.swift
//  LittleLemonMenuApp
//
//  Created by Navya Vohra on 2024-08-14.
//

import Foundation
import CoreData

class MenuController: ObservableObject {
    @Published var menuItems: [MenuItem] = []
    
    func fetchMenu() {
        guard let url = URL(string: "https://example.com/api/menu") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode([MenuItem].self, from: data)
                DispatchQueue.main.async {
                    self.menuItems = decodedData
                    self.saveToCoreData(menuItems: decodedData)
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }

    func saveToCoreData(menuItems: [MenuItem]) {
        let context = PersistenceController.shared.container.viewContext
        
        for item in menuItems {
            let menuItemEntity = MenuItemEntity(context: context)
            menuItemEntity.id = item.id
            menuItemEntity.name = item.name
            menuItemEntity.price = item.price
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to save to Core Data: \(error.localizedDescription)")
        }
    }
}
