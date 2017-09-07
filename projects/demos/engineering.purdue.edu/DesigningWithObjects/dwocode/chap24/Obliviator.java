public class Obliviator extends Wizard {
	
    public Obliviator( String firstname, String lastname ) {
        super( firstname, lastname );
    }
    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}
