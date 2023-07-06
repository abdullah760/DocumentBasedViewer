//
//  ContentView.swift
//  Document-based-app
//
//  Created by Abdullah on 04/07/2023.
//

import SwiftUI
import UniformTypeIdentifiers


struct imageFile: FileDocument {
    // tell the system we support only plain text
    static var readableContentTypes = [ UTType.png]
    
    // by default our document is empty
    var image = ""
    
    // a simple initializer that creates new, empty documents
    init(initialImage: String = "" ) {
        image = initialImage
    }
    // this initializer loads data that has been saved previously
    init(configuration: ReadConfiguration) throws {
        if let imageData = configuration.file.regularFileContents {
            image = String(decoding: imageData , as : UTF8.self)
        } else {
            throw CocoaError(.fileReadCorruptFile)
        }
        
    }
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let imageData = Data(image.utf8)
        
        return FileWrapper(regularFileWithContents: imageData)
    }
}
    
    
    struct pdfFile: FileDocument {
        // tell the system we support only plain text
        static var readableContentTypes = [UTType.pdf]
        
        // by default our document is empty
        var pdf = ""
        
        
        // a simple initializer that creates new, empty documents
        init(initialPdf: String = "image-based-pdf-sample.pdf" ) {
            pdf = initialPdf
            
        }
        
        // this initializer loads data that has been saved previously
        init(configuration: ReadConfiguration) throws {
            if let Data = configuration.file.regularFileContents {
                pdf = String(decoding: Data , as : UTF8.self)
            } else {
                throw CocoaError(.fileReadCorruptFile)
            }
            
        }
        
        // this will be called when the system wants to write our data to disk
        func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
            let data = Data(pdf.utf8)
            
            return FileWrapper(regularFileWithContents: data)
        }
    }
    struct ContentView: View {
//        @Binding var document : pdfFile
        @Binding var documentImage : imageFile
        var body: some View {
//            TextEditor(text : $document.pdf)
            
            TextEditor(text: $documentImage.image)
            
           
            
            
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(documentImage: .constant(imageFile()))
        }
    }
    

