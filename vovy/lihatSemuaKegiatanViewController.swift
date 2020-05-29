//
//  lihatSemuaKegiatanViewController.swift
//  vovy
//
//  Created by Alfon on 25/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class lihatSemuaKegiatanViewController: UIViewController {
    
    @IBOutlet weak var semuaKegiatan: UICollectionView!
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var emptyVolunteer: UILabel!
    var query: String?
    var url = "https://mc2-be.herokuapp.com/activities"
    var urljson: URL?
    var res: readJson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        url = url + "/" + query!.uppercased()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        //semuaKegiatan.register(lihatSemuaKegiatanCell.nib(), forCellWithReuseIdentifier: lihatSemuaKegiatanCell.identifier)
        if query!.isEmpty {
            self.title = "Semua Kegiatan"
        } else {
            self.title = query
        }
        loadingImage.loadGif(name: "loading")
        urljson = URL(string: url)
//        semuaKegiatan.dataSource = self
//        semuaKegiatan.delegate = self
        fetchJson()
    }
    
    func fetchJson() {
        DispatchQueue.global().async {
            let dataTask = URLSession.shared.dataTask(with: self.urljson!) { data,_,_ in
                    let jsonData = data
                    
                    do {
                        self.res = try JSONDecoder().decode(readJson.self, from: jsonData!)
                        DispatchQueue.main.async {
                            self.loadingImage.isHidden = true
                            if (self.res?.data.isEmpty)! {
                                self.emptyVolunteer.isHidden = false
                            } else {
                                self.semuaKegiatan.isHidden = false
                            }
                        }
                        if !(self.res?.data.isEmpty)! {
                            self.reloadAfterDataCollected()
                        }
                    } catch let error {
                        print(error)
                    }
            }
            dataTask.resume()
        }
    }
    
    func reloadAfterDataCollected() {
        DispatchQueue.main.async {
            self.semuaKegiatan.register(lihatSemuaKegiatanCell.nib(), forCellWithReuseIdentifier: lihatSemuaKegiatanCell.identifier)
            
            self.semuaKegiatan.dataSource = self
            self.semuaKegiatan.delegate = self
            
            self.semuaKegiatan.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let destination = segue.destination as? detialKegiatanViewController{
            destination.volunteerData = sender as? dataStructure
        }
    }
    
}

extension lihatSemuaKegiatanViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "toDetailKegiatan", sender: res!.data[indexPath.row])
    }
}

extension lihatSemuaKegiatanViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        res!.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->  UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: lihatSemuaKegiatanCell.identifier , for: indexPath) as!lihatSemuaKegiatanCell
        
        let url = URL(string: res!.data[indexPath.row].image)
        var image: UIImage?
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                image = UIImage(data: data!)
                cell.configure(with: image! , namaKegiatan: self.res!.data[indexPath.row].title, organisasi: self.res!.data[indexPath.row].source)
            }
        }
        
        return cell
    }
}

extension lihatSemuaKegiatanViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 170, height: 220)
    }
}
