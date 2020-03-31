import Foundation

func main() {
    print("SwiftQL is a codegen tool generating Swift code from GraphQL schema")
    print("Command example:")
    print("> codegen userGraphQL.json User.swift")


    if let ln = LineReader() {
        print("Type 'exit' to quit")
        
        while true {
            do {
                //Input commnand line
                let output = try ln.readLine(prompt: "> ")
                print("Entered: \(output)")

                //Input file and out file
                let splited = output.split(separator: " ")
                guard splited.count == 3 else {
                    print("Incorrect command line")
                    print("Command example:")
                    print("> codegen userGraphQL.json User.swift")

                    return
                }

                let graphQLFile = splited[1].description
                guard let data = FileHelper.read(from: graphQLFile) else {
                    return print("GraphQL schema doesn't exist at the path")
                }

                

                if output == "exit" {
                    break
                }
            } catch {
                print(error)
            }
        }
    }
}

main()
