public class ClientClass {
    public static void main( String[] args ) {
        DarkLord youKnowWho = 
                         DarkLord.makeInstanceOfDarkLord("Voldemort");
        DarkWizard proxy = new DarkWizard("Quirrell");
        proxy.setCanCastUnforgivableCurses(true);
        youKnowWho.goal("steal the Philosopher's Stone",  proxy );
    }
}
