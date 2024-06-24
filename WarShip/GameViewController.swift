import UIKit

class GameViewController: UIViewController {
    var setupGameData: [String: Any]?
    var bateaux: [String] = [] // Les positions des bateaux (format ["C2", "B3"])
    var gridSize: Int = 6 // Taille de la grille par défaut
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        guard let gridSize = setupGameData?["gridSize"] as? Int,
              let ships = setupGameData?["ships"] as? [String] else {
            return
        }
        
        self.gridSize = gridSize
        self.bateaux = ships
        
        // Ajouter l'étiquette de statut à la vue
        view.addSubview(statusLabel)
        NSLayoutConstraint.activate([
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        // Créer la grille de jeu centrée
        createCenteredGameGrid(gridSize: gridSize)
    }
    
    func createCenteredGameGrid(gridSize: Int) {
        let screenWidth = view.bounds.width
        let buttonSize: CGFloat = 40
        let padding: CGFloat = 10
        let totalButtonSize = CGFloat(gridSize) * buttonSize + CGFloat(gridSize - 1) * padding
        
        let startX = (screenWidth - totalButtonSize) / 2
        let startY: CGFloat = 150 // Position verticale de départ
        
        for row in 0..<gridSize {
            for col in 0..<gridSize {
                let button = UIButton(type: .system)
                button.frame = CGRect(
                    x: startX + CGFloat(col) * (buttonSize + padding),
                    y: startY + CGFloat(row) * (buttonSize + padding),
                    width: buttonSize,
                    height: buttonSize
                )
                let buttonName = "\(Character(UnicodeScalar(col + 65)!))\(row)" // Convertir en format "C2"
                button.setTitle(buttonName, for: .normal)
                button.backgroundColor = .systemBlue
                button.setTitleColor(.white, for: .normal)
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                
                self.view.addSubview(button)
            }
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        let coordinates = title // Peut être utilisé pour l'IA pour tirer
        
        // Vérifier si les coordonnées touchent un bateau
        if bateaux.contains(coordinates) {
            sender.backgroundColor = .red // Couleur pour touché
            statusLabel.text = "Touché !"
            
            // Retirer la position touchée de la liste
            if let index = bateaux.firstIndex(of: coordinates) {
                bateaux.remove(at: index)
            }
            
            // Vérifier si tous les bateaux ont été touchés
            if bateaux.isEmpty {
                statusLabel.text = "Victoire !"
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
        } else {
            sender.backgroundColor = .blue // Couleur pour manqué
            statusLabel.text = "Manqué."
        }
    }
}

