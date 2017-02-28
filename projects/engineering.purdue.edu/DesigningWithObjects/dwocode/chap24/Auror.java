public class Auror extends Wizard {
    public Auror( String firstname, String lastname ) {
        super( firstname, lastname );
    }
    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}
