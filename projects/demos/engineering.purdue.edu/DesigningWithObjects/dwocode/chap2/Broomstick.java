public class Broomstick extends Enchanted {

    public static int nextBroomstickNum = 1; 
	
    public Broomstick( String forWhichSchool ) {
        super( forWhichSchool, "Broomstick" );
        idNum = nextBroomstickNum++;
    }
}
