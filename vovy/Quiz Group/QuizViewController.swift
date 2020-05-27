//
//  QuizViewController.swift
//  vovy
//
//  Created by Jeremy Jason on 21/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    
    
    @IBOutlet weak var buttonSelesai: UIButton!
    @IBOutlet weak var progresBar: UIProgressView!
    @IBOutlet weak var countDownSoal: UILabel!
    @IBOutlet weak var soalLabel: UILabel!
    @IBOutlet weak var jawabanSatu: UIButton!
    @IBOutlet weak var jawabanDua: UIButton!
    @IBOutlet weak var jawabanTiga: UIButton!
    @IBOutlet weak var jawabanEmpat: UIButton!
    @IBOutlet weak var jawabanLima: UIButton!
    
    
    let soal = ["1. Apakah anda menguasai bahasa inggris ?" ,
                   "2. Apakah anda suka berkerja dengan orang ?" ,
                   "3. Apakah anda bisa dan menguasai Matematika ?" ,
                   "4. Apakah anda menyukai diskusi ?" ,
                   "5. Apakah anda suka melakukan eksperimen ?" ,
                   "6. Apakah anda suka bekerja sendiri ?" ,
                   "7. Apakah anda suka dan menguasai hal yang berkaitan dengan mesin ?" ,
                   "8. Apakah anda suka melakukan perkerjaan yang membutuhkan ketelitian ?" ,
                   "9. Apakah anda suka melakukan pekerjaan yang terstruktur ?" ,
                   "10. Apakah anda seorang yang suka mengekspresikan diri ?"]
       
       // 2 dimension array
       let semuaJawaban = [
           ["A. tidak sama sekali " , "B. tidak terlalu " , "C. biasa " , "D. menguasai " , "E. menguasai sekali "] ,
           ["A. tidak sama sekali " , "B. tidak terlalu " , "C. biasa saja " , "D. suka" , "E. suka sekali "] ,
           ["A. tidak sama sekali " , "B. tidak terlalu " , "C. biasa " , "D. menguasai " , "E. menguasai sekali "] ,
           ["A. tidak sama sekali " , "B. tidak terlalu " , "C. biasa " , "D. menguasai " , "E. menguasai sekali "] ,
           ["A. tidak sama sekali " , "B. tidak terlalu " , "C. biasa saja " , "D. suka" , "E. suka sekali "],
           ["A. tidak sama sekali " , "B. tidak terlalu " , "C. biasa saja " , "D. suka" , "E. suka sekali "] ,
           ["A. tidak sama sekali " , "B. tidak terlalu " , "C. biasa " , "D. menguasai " , "E. menguasai sekali "] ,
           ["A. tidak sama sekali " , "B. tidak terlalu " , "C. biasa saja " , "D. suka" , "E. suka sekali "] ,
           ["A. tidak sama sekali " , "B. tidak terlalu " , "C. biasa saja " , "D. suka" , "E. suka sekali "] ,
           ["A. tidak sama sekali " , "B. tidak terlalu " , "C. biasa saja " , "D. suka" , "E. suka sekali "]
       ]
       
       var questionNumber = 0
       
       //POIN YANG DIHITUNG BERDASARKAN JAWABAN
       var a = 0 // realistic
       var b = 0 // investigate
       var c = 0 // artistic
       var d = 0 // social
       var e = 0 // entreprising
       var f = 0 // conventional
       var g = 0 // english
       //SELESAI POIN
    
    //buat dictonary
    var emptyDic: [String: Int] = [:]
    var isiAkhir = ""
    var isiAkhir2 = ""
    var isiAkhir3 = ""
    
    @IBAction func buttonLanjut(_ sender: Any) {
        //append to dictonary
        emptyDic["Realistic"] = a
        emptyDic["Investigate"] = b
        emptyDic["Artistic"] = c
        emptyDic["Social"] = d
        emptyDic["Entreprising"] = e
        emptyDic["Conventional"] = f
        emptyDic["English"] = g
        
        let baru = emptyDic.sortedKeysByValue(isOrderedBefore: >)
        isiAkhir = baru[0]
        isiAkhir2 = baru[1]
        isiAkhir3 = baru[2]
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            ResultViewController {
          destination.isiSebelah = isiAkhir
            destination.isiSebelah2 = isiAkhir2
            destination.isiSebelah3 = isiAkhir3
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

             updateUI()
           updateJawaban()
           buttonSelesai.alpha = 0
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.tag // ngambil tag berupa int -> 0 - 4
    //        print(userAnswer)
            // Ngecek nomor question terys masuk ke case yang mana untuk nambahin poin per soal
            switch questionNumber {
            case 0:
                    switch userAnswer {
                        case 0:
                            g -= 10
                        case 1:
                            g -= 10
                        case 2:
                            g -= 10
                        case 3:
                            g += 1
                        case 4:
                            g += 2
                        default:
                            print("Erorr bro, ada yang salah pasti")
                            }
                case 1:
                switch userAnswer {
                    case 0:
                        a += 2
                        b += 2
                    case 1:
                        a += 1
                        b += 1
                    case 2:
                        print("0")
                    case 3:
                        d += 1
                        e += 1
                    case 4:
                         d += 2
                         e += 2
                    default:
                        print("Erorr bro, ada yang salah pasti")
                        }
                case 2:
                switch userAnswer {
                    case 0:
                        c += 1
                        e += 1
                    case 1:
                        c += 2
                        e += 2
                    case 2:
                        print("0")
                    case 3:
                        b += 1
                        f += 1
                    case 4:
                        b += 2
                        f += 2
                    default:
                        print("Erorr bro, ada yang salah pasti")
                        }
                case 3:
                switch userAnswer {
                    case 0:
                        a += 2
                        b += 2
                    case 1:
                        a += 1
                        b += 1
                    case 2:
                        print("0")
                    case 3:
                        d += 1
                        e += 1
                    case 4:
                        d += 2
                        e += 2
                    default:
                        print("Erorr bro, ada yang salah pasti")
                        }
                case 4:
                switch userAnswer {
                    case 0:
                        d += 1
                        e += 1
                    case 1:
                        d += 2
                        e += 2
                    case 2:
                        print("0")
                    case 3:
                        b += 1
                        c += 1
                    case 4:
                        b += 2
                        c += 2
                    default:
                        print("Erorr bro, ada yang salah pasti")
                        }
                case 5:
                switch userAnswer {
                    case 0:
                        f += 4
                    case 1:
                        f += 2
                    case 2:
                        print("0")
                    case 3:
                        c += 2
                    case 4:
                        c += 4
                    default:
                        print("Erorr bro, ada yang salah pasti")
                        }
                case 6:
                switch userAnswer {
                    case 0:
                        d += 4
                    case 1:
                        d += 2
                    case 2:
                        print("0")
                    case 3:
                        a += 2
                    case 4:
                        a += 4
                    default:
                        print("Erorr bro, ada yang salah pasti")
                        }
                case 7:
                switch userAnswer {
                    case 0:
                        c += 2
                        e += 2
                    case 1:
                        c += 1
                        e += 1
                    case 2:
                        print("0")
                    case 3:
                        b += 1
                        f += 1
                    case 4:
                        b += 2
                        f += 2
                    default:
                        print("Erorr bro, ada yang salah pasti")
                        }
                case 8:
                switch userAnswer {
                    case 0:
                        b += 2
                        c += 2
                    case 1:
                        b += 1
                        c += 1
                    case 2:
                        print("0")
                    case 3:
                        e += 1
                        f += 1
                    case 4:
                        e += 2
                        f += 2
                    default:
                        print("Erorr bro, ada yang salah pasti")
                        }
                case 9:
                switch userAnswer {
                    case 0:
                        a += 2
                        f += 2
                    buttonSelesai.alpha = 1
                    case 1:
                        a += 1
                        f += 1
                    buttonSelesai.alpha = 1
                    case 2:
                        print("0")
                    buttonSelesai.alpha = 1
                    case 3:
                        c += 1
                        d += 1
                    buttonSelesai.alpha = 1
                    case 4:
                        c += 2
                        d += 2
                        print(a,b,c,d,e,f,g)
                    buttonSelesai.alpha = 1
                    default:
                        print("Erorr bro, ada yang salah pasti")
                        }
            default:
                print("Erorr bro, ada yang salah pasti")
               
            }
            
            // Selesai nambah poin
            
            // kalo soalnya udah abis kemana ?
            if questionNumber + 1 < soal.count{
                questionNumber += 1
            } else {
                buttonSelesai.alpha = 1
                // isi disni kalo udah selesai semua quiz kemana
                }
            updateUI()
            updateJawaban()
        }
    
    
    //update soal
       func updateUI() {
           soalLabel.text = soal[questionNumber]
           countDownSoal.text = "\(questionNumber+1)/10"
           progresBar.progress = getProgress() }
       
       //update jawaban
       func updateJawaban() {
           jawabanSatu.setTitle(semuaJawaban[questionNumber][0], for: .normal)
           jawabanDua.setTitle(semuaJawaban[questionNumber][1], for: .normal)
           jawabanTiga.setTitle(semuaJawaban[questionNumber][2], for: .normal)
           jawabanEmpat.setTitle(semuaJawaban[questionNumber][3], for: .normal)
           jawabanLima.setTitle(semuaJawaban[questionNumber][4], for: .normal)
       }
       
       //buat progreess bar jalan
       func getProgress() -> Float {
           return Float(questionNumber+1) / Float(soal.count)
       }


}


extension Dictionary {
func sortedKeys(isOrderedBefore:(Key,Key) -> Bool) -> [Key] {
    return Array(self.keys).sorted(by: isOrderedBefore)
}

    func sortedKeysByValue(isOrderedBefore:(Value, Value) -> Bool) -> [Key] {
          return sortedKeys {
              isOrderedBefore(self[$0]!, self[$1]!)
          }
      }}
