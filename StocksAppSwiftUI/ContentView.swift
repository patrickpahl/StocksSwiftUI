import SwiftUI

struct ContentView: View {

    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        stockListVM.load()
    }
    
    var body: some View {
        
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter { $0.symbol.starts(with: self.stockListVM.searchTerm ) }
        
        return NavigationView {
            
            ZStack(alignment: .leading) {
                Color.black
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -330)
                StockListView(stocks: filteredStocks)
                    .offset(y: 50)
                
            }
            
            
            .navigationBarTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
