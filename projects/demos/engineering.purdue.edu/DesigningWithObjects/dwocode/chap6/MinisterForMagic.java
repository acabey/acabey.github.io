public class MinisterForMagic {
    private String name;
    private int yearAppointed;
    private static MinisterForMagic unique;
    
    private MinisterForMagic(String name, int yearAppointed){
        this.name = name;
        this.yearAppointed = yearAppointed;
    }
    public static MinisterForMagic makeInstanceOfMinisterForMagic(
                                            String name, int year) {
        if ( unique == null )
            unique = new MinisterForMagic( name, year );
        return unique;
    }
    public static void retireInstanceOfMinisterForMagic() {
        unique = null;
    }
    public String whoIsMinisterForMagic(){
        return name;
    }
}
