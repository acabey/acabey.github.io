public class TestStoryGenerator {

    public static void main(String[] args) {
		
        EndOfSummerStories forYear1 = new EndOfSummerYear1();
        String story = forYear1.endOfSummerHolidays();
        System.out.println( story );
        story = forYear1.travelToHogwarts();
        System.out.println( story );
        story = forYear1.welcomeCeremonyAtHogwarts();
        System.out.println( story );
		
        EndOfSummerStories   forYear2 = new EndOfSummerYear2();
        story = forYear2.endOfSummerHolidays();
        System.out.println( story );
        story = forYear2.travelToHogwarts();
        System.out.println( story );
        story = forYear2.welcomeCeremonyAtHogwarts();
        System.out.println( story );
    }
}
