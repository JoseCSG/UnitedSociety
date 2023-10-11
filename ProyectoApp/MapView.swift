import SwiftUI
import MapKit

struct MapView: View {
    @State var latitud: Double
    @State var longitud: Double
    
    @State private var region: MKCoordinateRegion

    init(latitud: Double, longitud: Double) {
        self._latitud = State(initialValue: latitud)
        self._longitud = State(initialValue: longitud)
        self._region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitud, longitude: longitud),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    }

    var body: some View {
        Map(coordinateRegion: $region)
    }
}
