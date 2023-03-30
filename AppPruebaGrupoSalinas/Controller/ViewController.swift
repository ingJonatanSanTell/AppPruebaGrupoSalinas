//
//  ViewController.swift
//  AppPruebaGrupoSalinas
//
//  Created by MacBookMBA4 on 29/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var SegmentedOpciones: UISegmentedControl!
    
    @IBOutlet weak var LadoUnoField: UITextField!
    @IBOutlet weak var LadoDosField: UITextField!
    @IBOutlet weak var LongitudArregloField: UITextField!
    
    @IBOutlet weak var TituloArreglo: UILabel!

    @IBOutlet weak var ArregloLabel: UITextView!
    @IBOutlet weak var ProcesoLabel: UITextView!
    @IBOutlet weak var TituloAction: UILabel!
    
    @IBOutlet weak var ButtonGuardar: UIButton!
    @IBOutlet weak var ButtonReIntentar: UIButton!
    
    
    
    var session : Int? = 0
    var area : Double? = 0

    
    private var arreglo : [String] = []
    private var arregloProceso : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ButtonReIntentar.isHidden = true
        
        ButtonGuardar.layer.cornerRadius = 20
        ButtonGuardar.layer.borderColor = UIColor.black.cgColor
        ButtonGuardar.layer.borderWidth = 2.0
        
        ButtonReIntentar.layer.cornerRadius = 20
        ButtonReIntentar.layer.borderColor = UIColor.black.cgColor
        ButtonReIntentar.layer.borderWidth = 2.0
        
        LadoUnoField.layer.cornerRadius = 10
        LadoUnoField.layer.borderColor = UIColor.black.cgColor
        LadoUnoField.layer.borderWidth = 2.0
        
        LadoDosField.layer.cornerRadius = 10
        LadoDosField.layer.borderColor = UIColor.black.cgColor
        LadoDosField.layer.borderWidth = 2.0
        
        LongitudArregloField.layer.cornerRadius = 10
        LongitudArregloField.layer.borderColor = UIColor.black.cgColor
        LongitudArregloField.layer.borderWidth = 2.0
        
        SegmentedOpciones.layer.cornerRadius = 10
        SegmentedOpciones.layer.borderColor = UIColor.black.cgColor
        SegmentedOpciones.layer.borderWidth = 2.0
        
        LongitudArregloField.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    //segmented
    @IBAction func SegmentedAction(_ sender: UISegmentedControl) {
        
        if SegmentedOpciones.selectedSegmentIndex == 0 {
            
            session = 0
            
            
            LongitudArregloField.isHidden = true
            LadoDosField.isHidden = false
            LadoUnoField.isHidden = false
            
        }else if SegmentedOpciones.selectedSegmentIndex == 1 {
            
            session = 1
            
            LongitudArregloField.isHidden = false
            LadoDosField.isHidden = true
            LadoUnoField.isHidden = true
                
            }
        
        else{
            
        }
    }
    
    //opcion 1 area
    func calcularAreaRectangulo(ancho: Double, largo: Double) -> Double {
        let areaRectangulo = ancho * largo
        
        return areaRectangulo
    }
    
    func salir(){
        
        //alert salir
        
        self.LadoUnoField.text = ""
        self.LadoDosField.text = ""
        self.LongitudArregloField.text = ""
        
        //ya no poder escribir
        self.LadoUnoField.isEnabled = false
        self.LadoDosField.isEnabled = false
        self.LongitudArregloField.isEnabled = false

        //opcion salir arreglo
        self.arreglo.append("3")
        
        //opcion salir proceso
        self.arregloProceso.append("3")
        
        self.TituloAction.text = "[Termino el programa]"
        
        //imprimir arreglo
        self.TituloArreglo.text = "El arreglo generado es:"
        self.ArregloLabel.text = self.arreglo.description
        
        
        //imprimir ejecucion
        let texto = self.arregloProceso.joined(separator: "\n")
        self.ProcesoLabel.text = texto
        
        self.ButtonReIntentar.isHidden = false
        self.ButtonGuardar.isHidden = true
    }
    
    func irProceso(){
        
        //alert ir proceso

        self.LadoUnoField.text = ""
        self.LadoDosField.text = ""
        self.LongitudArregloField.text = ""
        
        
        self.TituloAction.text = "EL PROCESO QUEDO ASI:"
        
        //imprimir arreglo
        self.TituloArreglo.text = "El arreglo generado es:"
        self.ArregloLabel.text = self.arreglo.description
        
        //imprimir ejecucion
        let texto = self.arregloProceso.joined(separator: "\n")
        self.ProcesoLabel.text = texto
    }
    
    
    @IBAction func ButtonReIntentar(_ sender: UIButton) {
        
        self.arreglo = []
        self.arregloProceso = []
        
        //poder escribir
        self.LadoUnoField.isEnabled = true
        self.LadoDosField.isEnabled = true
        self.LongitudArregloField.isEnabled = true
        
        self.ButtonReIntentar.isHidden = true
        self.ButtonGuardar.isHidden = false
        
        self.ProcesoLabel.text = ""
        self.ArregloLabel.text = ""
        self.TituloAction.text = ""
        self.TituloArreglo.text = ""
    }
    
    
    //button guardar
    @IBAction func ButtonGuardar(_ sender: UIButton) {
        
        let placeholderColor = UIColor.red // Cambia el color a tu preferencia
        let attributes = [NSAttributedString.Key.foregroundColor: placeholderColor]
        
        if session == 0 {
            
            guard let lado1 = LadoUnoField.text, lado1 != "" else{
                LadoUnoField.attributedPlaceholder = NSAttributedString(string: "Coloca un Valor", attributes: attributes)
                
                
                return
            }
            
            
            guard let lado2 = LadoDosField.text, lado2 != "" else{
                LadoDosField.attributedPlaceholder = NSAttributedString(string: "Coloca un Valor", attributes: attributes)
                return
                
            }
            
            //arreglo
            arreglo.append("1")
            arreglo.append(lado1)
            arreglo.append(lado2)
            
            //proceso
            arregloProceso.append("1")
            arregloProceso.append(lado1)
            arregloProceso.append(lado2)
            
            if let ancho = Double(lado1), let largo = Double(lado2) {
                self.area = calcularAreaRectangulo(ancho: ancho, largo: largo)
                //ProcesoLabel.text = "El area del rectangulo es: \(String(area!))"
            }
            
            //proceso
            arregloProceso.append("El area del rectangulo es: \(String(area!))")
            
            
        }
        else if session == 1 {
            
            guard let longitud = LongitudArregloField.text, longitud != "" else{
                LongitudArregloField.attributedPlaceholder = NSAttributedString(string: "Coloca una Longitud", attributes: attributes)
                return
            }
            
            //validar valores negativos o 0
            guard let textFieldText = LongitudArregloField.text, let number = Int(textFieldText), number > 0 else {
              //alert
                let alert  = UIAlertController(title: "ERROR", message: "VALORES NO ACEPTADOS", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default)
                
                alert.addAction(ok)
                
                self.present(alert, animated: false)
                
                
              return
            }
            
            //arreglo
            arreglo.append("2")
            arreglo.append(longitud)
            
            //proceso
            arregloProceso.append("2")
            arregloProceso.append(longitud)
            
            self.arregloProceso.append("arreglo de \(longitud) posicion creado")
            //validar que no sea cero o negativo
            
            var numeros = [Int]()

            // Llenar el arreglo con los números de n a 1
            for i in stride(from: Int(longitud)!, through: 1, by: -1).reversed() {
                numeros.append(i)
            }

            // Mostrar los números de la mitad de n a n
            let mitad = Int(longitud)! / 2
            for i in mitad..<Int(longitud)! {
                self.arregloProceso.append(String(numeros[i]))
            }
            
        }
        
        
        //alert
        let alertController  = UIAlertController(title: "Se guardo correctamente", message: "¿Que quieres realizar?", preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "Seguir con la ejeccion", style: .default))
        self.present(alertController, animated: true, completion: nil)

        let proceso = UIAlertAction(title: "Ir al proceso", style: .default) { (action) in
            
            self.irProceso()
            self.salir()
            
        }
        
        alertController.addAction(proceso)
        
        self.LadoUnoField.text = ""
        self.LadoDosField.text = ""
        self.LongitudArregloField.text = ""
        
        self.LadoUnoField.placeholder = "Coloca un lado del rectangulo"
        self.LadoDosField.placeholder = "Coloca el otro lado del rectangulo"
        self.LongitudArregloField.placeholder = "Coloca la longitud del arreglo"
    }
    
}

