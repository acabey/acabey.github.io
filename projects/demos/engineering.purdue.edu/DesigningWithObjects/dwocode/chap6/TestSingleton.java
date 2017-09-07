public class TestSingleton {
    public static void main( String[] args ) {
        MinisterForMagic minister_1 =  
             MinisterForMagic.makeInstanceOfMinisterForMagic(
                                            "Cornelius Fudge", 1990);

        MinisterForMagic minister_2 =  
             MinisterForMagic.makeInstanceOfMinisterForMagic(
                                            "Pius Thicknesse", 1996);

        if ( minister_1 == minister_2 )
            System.out.println( "The two ministers are the same" );
        
        System.out.println("The name of the Minster: " 
                              + minister_1.whoIsMinisterForMagic() );
        System.out.println("The name of the Minster: " 
                              + minister_2.whoIsMinisterForMagic() );

        MinisterForMagic.retireInstanceOfMinisterForMagic();        

        minister_2 =  MinisterForMagic.makeInstanceOfMinisterForMagic(
                                             "Pius Thicknesse", 1996);
        System.out.println("The name of the Minster: " 
                              + minister_2.whoIsMinisterForMagic() );
    }
}
