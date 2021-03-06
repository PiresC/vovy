//
//  QuizCategoryConversion.swift
//  vovy
//
//  Created by Peter Andrew on 28/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import Foundation
import UIKit

class QuizCategoryConversion {
    private let quizResultArray:Array<String>!
    private var category1:String? = nil
    private var category2:String? = nil
    private var category3:String? = nil
    private let quizArray = ["Realistic", "Investigate", "Artistic", "Social", "Entreprising", "Conventional", "English"]
    private let categoryArray = ["Teknologi", "Riset", "Desain", "Sosialisasi", "Translator", "Penulis", "Administrasi",  "Manajemen", "Pelatihan"]
    
    init(_ quizResultArray:Array<String>) {
        self.quizResultArray = quizResultArray
        convertQuizToCategory()
    }
    
    func getCategoryArray() -> Array<String> {
        if category1 != nil && category2 != nil && category3 != nil{
            return [category1!, category2!, category3!]
        }
        return []
    }
    
    func getFirstCategory() -> String {
        if let category = category1 {
            return category
        }
        return ""
    }
    
    func getSecondCategory() -> String {
        if let category = category2 {
            return category
        }
        return ""
    }
    
    func getThirdCategory() -> String {
        if let category = category3 {
            return category
        }
        return ""
    }
    
    private func convertQuizToCategory() {
        if quizResultArray.count > 2 {
         switch quizResultArray[0] {
                   
       //1
               case quizArray[0]:
                   category1 = "Teknologi"
                   switch quizResultArray[1] {
                   case quizArray[1]:
                       category2 = categoryArray[1]
                       
                       switch quizResultArray[2] {
                       case quizArray[2]:
                           category3 = categoryArray[2]
                       case quizArray[3]:
                           category3 = categoryArray[3]
                       case quizArray[4]:
                           category3 = categoryArray[8]
                       case quizArray[5] :
                           category3 = categoryArray[6]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[2]:
                       category2 = categoryArray[5]
                       
                       switch quizResultArray[2]{
                       case quizArray[1]:
                           category3 = categoryArray[1]
                       case quizArray[3]:
                           category3 = categoryArray[3]
                       case quizArray[4]:
                           category3 = categoryArray[7]
                       case quizArray[5] :
                           category3 = categoryArray[7]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[3]:
                       category2 = categoryArray[3]
                       
                       switch quizResultArray[2] {
                       case quizArray[1]:
                           category3 = categoryArray[1]
                       case quizArray[2]:
                           category3 = categoryArray[5]
                       case quizArray[4]:
                           category3 = categoryArray[7]
                       case quizArray[5] :
                           category3 = categoryArray[6]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[4]:
                       category2 = categoryArray[7]
                       
                       switch quizResultArray[2] {
                       case quizArray[1]:
                           category3 = categoryArray[1]
                       case quizArray[2]:
                           category3 = categoryArray[4]
                       case quizArray[3]:
                           category3 = categoryArray[3]
                       case quizArray[5] :
                           category3 = categoryArray[6]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[5] :
                       category2 = categoryArray[6]
                       
                       switch quizResultArray[2] {
                       case quizArray[1]:
                           category3 = categoryArray[1]
                       case quizArray[2]:
                           category3 = categoryArray[2]
                       case quizArray[3]:
                           category3 = categoryArray[8]
                       case quizArray[4]:
                           category3 = categoryArray[7]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                   default:
                       print("Erorr bro, ada yang salah pasti")
                   }
                   
                   
       //2
               case quizArray[1]:
                   category1 = "Riset"
                   switch quizResultArray[1] {
                   case quizArray[0]:
                       category2 = categoryArray[0] //realistic
                       
                       switch quizResultArray[2] {
                       case quizArray[2]:
                           category3 = categoryArray[5]
                       case quizArray[3]:
                           category3 = categoryArray[8]
                       case quizArray[4]:
                           category3 = categoryArray[7]
                       case quizArray[5] :
                           category3 = categoryArray[6]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[2]:
                       category2 = categoryArray[4]
                       
                       switch quizResultArray[2]{
                       case quizArray[0]:
                           category3 = categoryArray[0]
                       case quizArray[3]:
                           category3 = categoryArray[3]
                       case quizArray[4]:
                           category3 = categoryArray[7]
                       case quizArray[5] :
                           category3 = categoryArray[6]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[3]:
                       category2 = categoryArray[3]
                       
                       switch quizResultArray[2] {
                       case quizArray[0]:
                           category3 = categoryArray[0]
                       case quizArray[2]:
                           category3 = categoryArray[5]
                       case quizArray[4]:
                           category3 = categoryArray[7]
                       case quizArray[5] :
                           category3 = categoryArray[6]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[4]:
                       category2 = categoryArray[7]
                       
                       switch quizResultArray[2] {
                       case quizArray[0]:
                           category3 = categoryArray[0]
                       case quizArray[2]:
                           category3 = categoryArray[2]
                       case quizArray[3]:
                           category3 = categoryArray[3]
                       case quizArray[5] :
                           category3 = categoryArray[6]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[5] :
                       category2 = categoryArray[6]
                       
                       switch quizResultArray[2] {
                       case quizArray[0]:
                           category3 = categoryArray[0]
                       case quizArray[2]:
                           category3 = categoryArray[2]
                       case quizArray[3]:
                           category3 = categoryArray[8]
                       case quizArray[4]:
                           category3 = categoryArray[7]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   default:
                       print("Erorr bro, ada yang salah pasti")
                   }
                   
       //3
               case quizArray[2]:
                   category1 =  categoryArray[5]
                   category2 = categoryArray[2] // desain
                   category3 = categoryArray[4] // Translator
                   
       //4
               case quizArray[3]: //Social media , Pengajaran / Pelatihan
                   category1 = categoryArray[3]
                   category2 = categoryArray[8] // Pengajaran
                   
                   switch quizResultArray[1] {
                   case quizArray[0]:
                       category3 = categoryArray[0]
                   case quizArray[2]:
                       category3 = categoryArray[2]
                   case quizArray[5]:
                       category3 = categoryArray[6]
                   case quizArray[4]:
                       category3 = categoryArray[7]
                   case quizArray[1]:
                       category3 = categoryArray[1]
                   default:
                       print("Erorr bro, ada yang salah pasti")
                   }
                   
       //5
               case quizArray[4]:
                   category1 = categoryArray[7]
                   switch quizResultArray[1] {
                   case quizArray[0]:
                       category2 = categoryArray[0] //realistic
                       
                       switch quizResultArray[2] {
                       case quizArray[2]:
                           category3 = categoryArray[5]
                       case quizArray[3]:
                           category3 = categoryArray[3]
                       case quizArray[1]:
                           category3 = categoryArray[1]
                       case quizArray[5] :
                           category3 = categoryArray[6]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[2]:
                       category2 = categoryArray[5]
                       
                       switch quizResultArray[2]{
                       case quizArray[0]:
                           category3 = categoryArray[0]
                       case quizArray[3]:
                           category3 = categoryArray[3]
                       case quizArray[1]:
                           category3 = categoryArray[1]
                       case quizArray[5] :
                           category3 = categoryArray[6]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[3]:
                       category2 = categoryArray[8]
                       
                       switch quizResultArray[2] {
                       case quizArray[0]:
                           category3 = categoryArray[0]
                       case quizArray[2]:
                           category3 = categoryArray[2]
                       case quizArray[1]:
                           category3 = categoryArray[1]
                       case quizArray[5] :
                           category3 = categoryArray[6]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[1]:
                       category2 = categoryArray[1]
                       
                       switch quizResultArray[2] {
                       case quizArray[0]:
                           category3 = categoryArray[0]
                       case quizArray[2]:
                           category3 = categoryArray[5]
                       case quizArray[3]:
                           category3 = categoryArray[3]
                       case quizArray[5] :
                           category3 = categoryArray[6]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[5] :
                       category2 = categoryArray[6]
                       
                       switch quizResultArray[2] {
                       case quizArray[0]:
                           category3 = categoryArray[0]
                       case quizArray[2]:
                           category3 = categoryArray[2]
                       case quizArray[3]:
                           category3 = categoryArray[3]
                       case quizArray[1]:
                           category3 = categoryArray[1]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   default:
                       print("Erorr bro, ada yang salah pasti")
                   }
                   
                   
                   
       //6
               case quizArray[5] :
                   category1 = categoryArray[6]
                   switch quizResultArray[1] {
                   case quizArray[0]:
                       category2 = categoryArray[0] //realistic
                       
                       switch quizResultArray[2] {
                       case quizArray[2]:
                           category3 = categoryArray[5]
                       case quizArray[3]:
                           category3 = categoryArray[3]
                       case quizArray[1]:
                           category3 = categoryArray[1]
                       case quizArray[4] :
                           category3 = categoryArray[7]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[2]:
                       category2 = categoryArray[5]
                       
                       switch quizResultArray[2]{
                       case quizArray[0]:
                           category3 = categoryArray[0]
                       case quizArray[3]:
                           category3 = categoryArray[3]
                       case quizArray[1]:
                           category3 = categoryArray[1]
                       case quizArray[4] :
                           category3 = categoryArray[7]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[3]:
                       category2 = categoryArray[8]
                       
                       switch quizResultArray[2] {
                       case quizArray[0]:
                           category3 = categoryArray[0]
                       case quizArray[2]:
                           category3 = categoryArray[2]
                       case quizArray[1]:
                           category3 = categoryArray[1]
                       case quizArray[4] :
                           category3 = categoryArray[7]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[1]:
                       category2 = categoryArray[1]
                       
                       switch quizResultArray[2] {
                       case quizArray[0]:
                           category3 = categoryArray[7]
                       case quizArray[2]:
                           category3 = categoryArray[2]
                       case quizArray[3]:
                           category3 = categoryArray[3]
                       case quizArray[4] :
                           category3 = categoryArray[7]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   case quizArray[4] :
                       category2 = categoryArray[7]
                       
                       switch quizResultArray[2] {
                       case quizArray[0]:
                           category3 = categoryArray[0]
                       case quizArray[2]:
                           category3 = categoryArray[5]
                       case quizArray[3]:
                           category3 = categoryArray[8]
                       case quizArray[1]:
                           category3 = categoryArray[1]
                       default:
                           print("Erorr bro, ada yang salah pasti")
                       }
                       
                   default:
                       print("Erorr bro, ada yang salah pasti")
                   }
                   
                   
               default:
                   print("Erorr bro, ada yang salah pasti")
               }
        }
    }
    
    static func getBEFormatCategory(_ categories:Array<String>) -> Array<String> {
        return categories.map({ category in
            return categoryToBEcategoryConversion(category)
        })
    }
    
    
    static func categoryToBEcategoryConversion(_ category:String) -> String {
        let categories = ["Teknologi", "Riset", "Desain", "Sosialisasi", "Translator", "Penulis", "Administrasi",  "Manajemen", "Pelatihan"]
           switch category {
           case categories[3]: return "SOCIALISASI"
           case categories[4]: return "TRANSLATOR"
           case categories[0]: return "TEKNOLOGI"
           case categories[5]: return "PENULIS"
           case categories[6]: return "ADMINISTRASI"
           case categories[2]: return "DESAIN"
           case categories[1]: return "RISET"
           case categories[7]: return "MANAJEMEN"
           case categories[8]: return "PELATIHAN"
           default:
               return "undefined"
           }
       }
    
    static func isBEFormat(_ categories:Array<String>) -> Bool {
        let BEFormat = [ "SOCIALISASI","TRANSLATOR", "TEKNOLOGI", "PENULIS", "ADMINISTRASI", "DESAIN", "RISET","MANAJEMEN", "PELATIHAN"]
        for category in categories {
            for format in BEFormat {
                if category == format {
                    break;
                } else if format == "PELATIHAN" {
                    return false
                }
            }
        }
        return true
    }
    
}
