import java.util.*;

public class HouseElf extends Humanoid {
	
    public HouseElf(  String name, int age ) {
        super( new HouseElf_Impl( name, age ) );
    }
    public void registerWithMinistryOfMagic() {
        registerWithMinistryOfMagic( "House Elf" );
    }
    public void unRegisterWithMinistryOfMagic() {
        unRegisterWithMinistryOfMagic( "House Elf" );
    }
    public void printName(){
        String name = getName();
        System.out.println( "The name of the House Elf is: " + name );
    }
    public String  getAppearance() {
        List<String> list = getAppearance( "House Elf" );
        return  list.toString();
    } 
    public String  getBehavior() {
        List<String> list = getBehavior( "House Elf" );
        return  list.toString();
    } 
}
