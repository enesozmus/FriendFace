//
//  ContentView.swift
//  FriendFace
//
//  Created by enesozmus on 23.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink {
                    DetailView(user: user)
                } label: {
                    Text(user.name)
                }
            }
            .navigationTitle("FriendFace")
            /*
                .task
                
                    -> A unit of asynchronous work.
                    -> In Swift, a task refers to a unit of work that can be executed concurrently or asynchronously.
                    -> When you create an instance of Task, you provide a closure that contains the work for that task to perform.
             */
            .task {
                //→ The Task the closure is marked with the async keyword, and the await the keyword is used to wait for the result of the asynchronous operation.
                if let retrievedUsers = await getUsers() {
                    users = retrievedUsers
                }
            }
        }
    }
    
    // → create a function that does the networking and returns an array of users[]
    // → then assign the result to the @state variable called “users”.
    func getUsers() async -> [User]? {
        // → getUsers() function is marked “async” because retrieving data might take some time and it is called in the .task {} modifier on the List itself
        
        /*
            -> URL -> A uniform resource locator (URL) is the address of a specific webpage or file (such as video, image, GIF, etc.) on the internet.
            -> A value that identifies the location of a resource, such as an item on a remote server or the path to a local file.
            -> You can construct URLs and access their parts.
            -> the URL is force unwrapped because the app would not work anyway if it isn’t 100% correct so we make sure it is since it’s hard-coded
         */
        
        // → Creating the URL we want to read.
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        /*
            -> URLRequest -> A URL load request that is independent of protocol or URL scheme.
            -> URLRequest encapsulates two essential properties of a load request: the URL to load and the policies used to load it.
            -> In addition, for HTTP and HTTPS requests, URLRequest includes the HTTP method (GET, POST, and so on) and the HTTP headers.
            -> URLRequest only represents information about the request.
         ! Use other classes, such as URLSession, to send the request to a server.
         */
        var request = URLRequest(url: url)
        
        // → httpMethod is “GET” because we are retrieving data from the internet
        request.httpMethod = "GET"
        
        /*
            .addValue()
                Adds a value to the header field.
                    value → The value for the header field.
                    field → The name of the header field. In keeping with the HTTP RFC, HTTP header field names are case insensitive.
         */
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // → An object that decodes instances of a data type from JSON objects.
        let decoder = JSONDecoder()
        
        // → dateDecodingStrategy is set to .iso8601 because that is the format in the JSON and also Paul actually says to use it in the challenge tips
        decoder.dateDecodingStrategy = .iso8601
        
        
        // → Fetching the data for that URL.
        // → Run that request and process the response.
        do {
            /*
                URLSession
             
                    -> An object that coordinates a group of related, network data transfer tasks.
                    -> The URLSession class and related classes provide an API for downloading data from and uploading data to endpoints indicated by URLs.
             
                    -> Our work is being done by the data(from:) method, which takes a URL and returns the Data object at that URL.
                    -> This method belongs to the URLSession class.
                    -> The return value from data(from:) is a tuple containing the data at the URL and some metadata describing how the request went.
                    -> We don’t use the metadata, but we do want the URL’s data, hence the underscore(_)
             */
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // → Decoding the result of that data into a Response struct.
            // → Handle the result
            let decodedData = try decoder.decode([User].self, from: data)
            
            return decodedData
        } catch {
            // → So, if our download succeeds our data constant will be set to whatever data was sent back from the URL,
            // → but if it fails for any reason our code prints “Invalid data” and does nothing else.
            print("Invalid data")
            print("Check out failed: \(error.localizedDescription)")
        }
        return nil
    }
}

#Preview {
    ContentView()
}
