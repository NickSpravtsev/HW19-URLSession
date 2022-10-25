import Foundation

func getData(request: String) {
    let urlRequest = URL(string: request)
    guard let url = urlRequest else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error: \(error))")
        } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            guard let data = data else { return }
            let dataAsString = String(data: data, encoding: .utf8) ?? ""
            print("Response status code: \(response.statusCode)\n")
            print("Data: \(dataAsString)")
        } else {
            if let response = response {
                print("Response: \(response)")
            }
        }
        print("--------------------")
    }.resume()
}

let apiRequest = "https://api.open-meteo.com/v1/forecast?latitude=55.7558&longitude=37.6176&hourly=temperature_2m"
getData(request: apiRequest)

let apiRequestWithError = "https://api.open-1meteo.com/v1/forecast?latitude=55.7558&longitude=37.6176&hourly=temperature_2m"
getData(request: apiRequestWithError)

let apiRequestWithWrongResponse = "https://api.open-meteo.com/v1/forecast?latitude=55.7558&longitude=37.6176&hourly=temperature_2"
getData(request: apiRequestWithWrongResponse)
