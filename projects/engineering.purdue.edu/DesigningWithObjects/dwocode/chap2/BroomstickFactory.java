import java.util.*;

public class BroomstickFactory extends Factory {

    public BroomstickFactory( String schoolName ) { super(schoolName); }

    public Broomstick deliverItem() {
        return deliverBroomstick();
    }
    private Broomstick deliverBroomstick() {
        if ( store.checkBroomstickStockIsEmpty() ) 
            replenishBroomstickStock();
        return store.deliverOneBroomstickToClient();
    }	
    private void replenishBroomstickStock() {
        System.out.println( "Replenishing stock with " 
                          + store.batchSize() + " broomsticks" );
        ArrayList<Broomstick> freshStock = new ArrayList<Broomstick>();
        for ( int i = 0; i < store.batchSize(); i++ ) {
            freshStock.add(new Broomstick( store.forWhichSchool() ));
        }
        store.acquireMoreBroomsticksFromFactory(freshStock);
        store.initializeBroomstickStock();
    }
}
