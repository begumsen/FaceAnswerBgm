//
//  CategoryMenuViewController.swift
//  FaceAnswerBgm
//
//  Created by Begum Sen on 4.08.2023.
//

import UIKit

class CategoryMenuViewController: UIViewController {
    
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    lazy var presenter = CategoryMenuPresenter(with:self)
    
    let layout: UICollectionViewFlowLayout = {
      let layout = UICollectionViewFlowLayout()
      let insetLeft: CGFloat = 5.0
      let insetRight: CGFloat = 5.0
      layout.sectionInset = UIEdgeInsets(top: 10,
                                         left: insetLeft,
                                         bottom: 5.0,
                                         right: insetRight)
      let itemWidth = UIScreen.main.bounds.width / 2 - (insetLeft + insetRight)
      let itemHeight = Double(itemWidth * 1.34)
      layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
      return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.setCollectionViewLayout(layout, animated: false)
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CategoryMenuViewController: CategoryView{
    
    func showGameScreen(category: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let gameViewController = storyBoard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameViewController.selectedCategory = category
        let navigationController = UINavigationController(rootViewController: gameViewController)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)

    }
}

extension CategoryMenuViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        cell.categoryLabel.text = presenter.categories[indexPath.row]
        let backgroundImage = UIImage(named: presenter.categories[indexPath.row])
        cell.imageView.image = backgroundImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.categorySelected(index: indexPath.row)
    }
    
    
}
