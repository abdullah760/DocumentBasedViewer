//
//  pdfView.swift
//  Document-based-app
//
//  Created by Abdullah on 05/07/2023.
//

import SwiftUI
import PDFKit
struct PDFKitView: UIViewRepresentable {
    let url: URL // new variable to get the URL of the document
    
    func makeUIView(context: UIViewRepresentableContext<PDFKitView>) -> PDFView {
        // Creating a new PDFVIew and adding a document to it
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: self.url)
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: UIViewRepresentableContext<PDFKitView>) {
        // we will leave this empty as we don't need to update the PDF
    }
}
struct pdfView: View {
    let pdfUrl = Bundle.main.url(forResource: "image-based-pdf-sample", withExtension: "pdf")!
        
        var body: some View {
            VStack {
                Image(systemName: "doc.viewfinder")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("PDF Viewer")
                    .foregroundColor(.accentColor)
                // Using the PDFKitView and passing the previously created pdfURL
                PDFKitView(url: pdfUrl)
                    .scaledToFill()
                
            }
            .padding()
        }

}

struct pdfView_Previews: PreviewProvider {
    static var previews: some View {
        pdfView()
    }
}
