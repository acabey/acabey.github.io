public class Client {
    public static void main( String[] args ) {
        ArtifactMaker maker1 = new MagicWandMaker();
        try {
            MagicWand mw = (MagicWand) maker1.makeArtifact( "Harry" );
            System.out.println( mw );			
        } catch( ArtifactCannotBeCreated u ) {}

        ArtifactMaker maker2 = new RemembrallMaker();
        try {
            Remembrall rem = 
                        (Remembrall) maker2.makeArtifact( "Neville" );
            System.out.println( rem );	
        } catch( ArtifactCannotBeCreated u ) {}
    }                                         
}
