import java.util.List;

public class Dementor extends Humanoid {

    //public Dementor(  String name, int age ) {
    public Dementor(  String occupation ) {
        super( new Dementor_Impl( occupation ) );
    }
    public void registerWithMinistryOfMagic() {
        registerWithMinistryOfMagic( "Dementor" );
    }
    public void unRegisterWithMinistryOfMagic() {
        unRegisterWithMinistryOfMagic( "Dementor" );
    }
    public void printName(){
        String name = getName();
        System.out.println( "The name of the dementor is: " + name );
    }
    public void printServingAs(){
        String name = getServingAs();
        System.out.println( "The dementor is serving as: " + name );
    }
    public String  getAppearance() {
        List<String> list = getAppearance( "Dementor" );
        return  list.toString();
    } 
    public String  getBehavior() {
        List<String> list = getBehavior( "Dementor" );
        return  list.toString();
    } 
}
