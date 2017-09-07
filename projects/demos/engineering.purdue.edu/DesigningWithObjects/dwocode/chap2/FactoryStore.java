import java.util.*;

public class FactoryStore {

    private static FactoryStore theStore;

    private String forWhichSchool;
    private static final int N = 2;
    private int broomsticksDeliveredFromNewStock;
    private int magicWandsDeliveredFromNewStock;
    private int owlsDeliveredFromNewStock;
	
    private ArrayList<Broomstick> broomsticksInStock = new ArrayList<Broomstick>();
    private ArrayList<MagicWand> magicWandsInStock = new ArrayList<MagicWand>();
    private ArrayList<Owl>  owlsInStock = new ArrayList<Owl>();

    private FactoryStore( String forWhichSchool ) {
        this.forWhichSchool = forWhichSchool;
        broomsticksDeliveredFromNewStock = magicWandsDeliveredFromNewStock 
                                         = owlsDeliveredFromNewStock = 0;
        for ( int i = 0; i < N; i++ ) {
            broomsticksInStock.add( new Broomstick( forWhichSchool ));
            magicWandsInStock.add( new MagicWand( forWhichSchool ));
            owlsInStock.add( new Owl( forWhichSchool ));
        }
    }

    public static FactoryStore makeFactoryStore(String forWhichSchool) {
        if (theStore == null) {
            theStore = new FactoryStore(forWhichSchool);
        }
        return theStore;
    }        

    public int batchSize() { return N; }
    public String forWhichSchool() { return forWhichSchool; }
    public void acquireMoreBroomsticksFromFactory(ArrayList<Broomstick> freshStock) {
        broomsticksInStock = freshStock;
    }
    public void initializeBroomstickStock() { 
        broomsticksDeliveredFromNewStock = 0; 
    }
    public void acquireMoreMagicWandsFromFactory(ArrayList<MagicWand> freshStock) {
        magicWandsInStock = freshStock;
    }
    public void initializeMagicWandStock() { 
        magicWandsDeliveredFromNewStock = 0; 
    }
    public void acquireMoreOwlsFromEmporium(ArrayList<Owl> freshStock) {
        owlsInStock = freshStock;
    }
    public void initializeOwlStock() { 
        owlsDeliveredFromNewStock = 0; 
    }
    public boolean checkBroomstickStockIsEmpty() {
        return broomsticksDeliveredFromNewStock == N ? true : false;
    }
    public boolean checkMagicWandStockIsEmpty() {
        return magicWandsDeliveredFromNewStock == N ? true : false;
    }
    public boolean checkOwlStockIsEmpty() {
        return owlsDeliveredFromNewStock == N ? true : false;
    }
    public Broomstick deliverOneBroomstickToClient() {
        return broomsticksInStock.get(broomsticksDeliveredFromNewStock++);
    }
    public MagicWand deliverOneMagicWandToClient() {
        return magicWandsInStock.get(magicWandsDeliveredFromNewStock++);
    }
    public Owl deliverOneOwlToClient() {
        return owlsInStock.get(owlsDeliveredFromNewStock++);
    }
}
