public class MinistryOfMagic {
    public static void main( String[] args ) {

        // House Elves:
        HouseElf elf1 = new HouseElf( "Dobby",  15 );
        elf1.registerWithMinistryOfMagic();
        elf1.printName();
        HouseElf elf2 = new HouseElf( "Hokey",  15 );
        elf2.registerWithMinistryOfMagic();
        elf2.printName();
        int n = elf2.howManyRegistered();
        System.out.println( "Number of elves registered: " + n );
        HouseElf elf3 = new HouseElf( "Kreacher",  8 );
        elf3.registerWithMinistryOfMagic();
        elf3.printName();
        n = elf2.howManyRegistered();
        System.out.println( "Number of elves registered: " + n );
        elf2.unRegisterWithMinistryOfMagic();
        n = elf2.howManyRegistered();
        System.out.println( "Number of elves registered: " + n );
        System.out.println( "Appearance of an house elf: " 
                                        + elf2.getAppearance() );
        System.out.println( "Behavior of an house elf: " 
                                          + elf2.getBehavior() );
		
        //Goblins:
        Goblin gob1 = new Goblin( "Griphook", 23 );
        gob1.registerWithMinistryOfMagic();
        gob1.printName();
        System.out.println( "Number of goblins registered: " 
                                    + gob1.howManyRegistered() );
		
        //Dementors:
        Dementor dem1 = new Dementor( "Azkaban Guard" );
        dem1.registerWithMinistryOfMagic();
        dem1.printServingAs();
        System.out.println( "Number of dementors registered: " 
                                    + dem1.howManyRegistered() );
    }
}
