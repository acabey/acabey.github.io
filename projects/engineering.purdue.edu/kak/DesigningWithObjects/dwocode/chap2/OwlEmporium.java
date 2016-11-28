import java.util.*;

public class OwlEmporium extends Factory {

    public OwlEmporium( String schoolName ) { super(schoolName); }
    
    Owl deliverItem() {
        return deliverOwl();
    }
    private Owl deliverOwl() {
        if ( store.checkOwlStockIsEmpty() ) replenishOwlStock();
        return store.deliverOneOwlToClient();
    }
    private void replenishOwlStock() {
        System.out.println( "Replenishing stock with " 
                           + store.batchSize() + " owls" );
        ArrayList<Owl> freshStock = new ArrayList<Owl>();
        for ( int i = 0; i < store.batchSize(); i++ ) {
            freshStock.add( new Owl( store.forWhichSchool() ));
        }
        store.acquireMoreOwlsFromEmporium(freshStock);
        store.initializeOwlStock();
    }
}
