import java.util.*;

public abstract class Humanoid {
	
    private Humanoid_Impl impl;
	
    protected Humanoid( Humanoid_Impl impl ) {
        this.impl = impl;
    }
    protected void registerWithMinistryOfMagic( String category ) {
        impl.registerWithMinistryOfMagic( category );
    }
    protected void unRegisterWithMinistryOfMagic( String category ) {
        impl.unRegisterWithMinistryOfMagic( category );
    }
    protected int howManyRegistered() {
      return impl.howManyRegistered();
    }
    protected String getName(){
        return impl.getName();
    }
    protected String getServingAs(){
        return impl.getServingAs();
    }
    public List<String>  getAppearance( String category ) {
        return impl.getAppearance(category);
    }
    public List<String>  getBehavior( String category ) {
        return impl.getBehavior(category);
    }
}
