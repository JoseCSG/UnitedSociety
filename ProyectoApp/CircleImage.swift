import SwiftUI


struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 200, height: 200)
                .overlay(Circle().stroke(Color(red: 55/255, green: 94/255, blue: 152/255), lineWidth: 4))
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .clipped()
                .mask(Circle())
                
        }
    }
}


struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image(systemName: "a"))
    }
}
