public class DragonAficionado {
	
    public static void main( String[] args ) {
		
        PrototypeManagerAndDuplicator ptm = 
                                    new PrototypeManagerAndDuplicator();
		
        try {
            Dragon d1 = ptm.conjure( "Chinese Fireball" );
            System.out.println("A dragon of type " + d1 + " conjured.");
            System.out.println( d1.getAttributes() + "." );
		
            Dragon d2 = ptm.conjure( "Hungarian Horntail" );
            System.out.println("A dragon of type " + d2 + " conjured.");
            System.out.println( d2.getAttributes() + "." );
		    
            Dragon d3 = ptm.conjure( "Chinese Fireball" );
            System.out.println( "A new dragon of type " 
                                                  + d3 + " conjured." );
            d3.addThingsToEat(  "monkeys" );
            System.out.println( d3.getAttributes() + "." );
		    
            System.out.println( "Attributes of the first Chinese "
                                               + "Fireball dragon: " );
            System.out.println( d1.getAttributes() + "." );
        } catch ( UnknownDragonException e ) {
            e.printStackTrace();
        }
    }
}
