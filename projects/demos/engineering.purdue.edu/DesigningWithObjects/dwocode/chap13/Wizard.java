abstract class Wizard {
    protected String name;
    protected boolean canCastUnforgivableCurses = false;
    protected boolean canBrewDarkPotions = false;
    protected boolean canAnimateInferi = false;
    
    protected Wizard(String name){
        this.name = name;
    }
    public String getName() { return name; }
}
