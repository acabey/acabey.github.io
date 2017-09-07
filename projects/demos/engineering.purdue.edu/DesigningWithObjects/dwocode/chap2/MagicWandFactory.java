import java.util.*;

public class MagicWandFactory extends Factory {
	
    public MagicWandFactory( String schoolName ) { super(schoolName); }

    MagicWand deliverItem() {
        return deliverMagicWand();
    }
    private MagicWand deliverMagicWand() {
        if ( store.checkMagicWandStockIsEmpty() ) 
            replenishMagicWandStock();
        return store.deliverOneMagicWandToClient();
    }
    private void replenishMagicWandStock() {
        System.out.println( "Replenishing stock with " 
                           + store.batchSize() + " magic wands" );
        ArrayList<MagicWand> freshStock = new ArrayList<MagicWand>();
        for ( int i = 0; i < store.batchSize(); i++ ) {
            freshStock.add(new MagicWand( store.forWhichSchool() ));
        }
        store.acquireMoreMagicWandsFromFactory(freshStock);
        store.initializeMagicWandStock();
    }
}
