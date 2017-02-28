public class MagicWand extends Enchanted {
	
    public static int nextMagicWandNum = 1; 

    public MagicWand( String forWhichSchool ) {
        super( forWhichSchool, "MagicWand" );
        idNum = nextMagicWandNum++;
    }
}
