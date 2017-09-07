import java.util.List;

public class Goblin extends Humanoid {
	
    public Goblin(  String name, int age ) {
        super( new Goblin_Impl( name, age ) );
    }
    public void registerWithMinistryOfMagic() {
        registerWithMinistryOfMagic( "Goblin" );
    }
    public void unRegisterWithMinistryOfMagic() {
        unRegisterWithMinistryOfMagic( "Goblin" );
    }
    public void printName(){
        String name = getName();
        System.out.println( "The name of the Goblin is: " + name );
    }
    public String  getAppearance() {
        List<String> list = getAppearance( "Goblin" );
        return  list.toString();
    }
    public String  getBehavior() {
        List<String> list = getBehavior( "Goblin" );
        return  list.toString();
    } 
}
