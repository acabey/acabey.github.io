public interface Hogwarts_Info {
	
    public static enum HogwartsHouse { Gryffindor, Hufflepuff, 
                                       Ravenclaw, Slytherin}
    
    public static enum FresherName {
                    AbbotHannah             ("Hannah", "Abbot"),
                    BonesSusan              ("Susan", "Bones"),  
                    BootTerry               ("Terry", "Boot"),
                    BrocklehurstMandy       ("Mandy", "Brocklehurst"),
                    BrownLavender           ("Lavender", "Brown"),
                    BulstrodeMillicent      ("Millicent", "Bulstrode"),
                    ChangCho                ("Cho", "Chang"), 
                    CrabbeVincent           ("Vincent", "Crabbe"), 
                    CreevyColin             ("Colin", "Creevy"),
                    FinniganSeamus          ("Seamus",  "Finnigan"),
                    GoyleGregory            ("Gregory", "Goyle"),
                    GrangerHermione         ("Hermione", "Granger"), 
                    LongbottomNeville       ("Neville",  "Longbottom"),
                    MacDougalMorag          ("Morag", "MacDougal"), 
                    MalfoyDraco             ("Draco", "Malfoy"), 
                    PatilParvati            ("Parvati", "Patil"), 
                    PatilPadma              ("Padma", "Patil"), 
                    PerksSallyAnne          ("Sally-Anne", "Perks"),
                    PotterHarry             ("Harry", "Potter"),
                    ThomasDean              ("Dean",  "Thomas"),
                    TurpinLisa              ("Lisa", "Turpin"),
                    WeasleyGinny            ("Ginny", "Weasley"),
                    WeasleyRon              ("Ron", "Weasley"), 
                    ZabiniBlaise            ("Blaise",  "Zabini");
        private final String firstName;
        private final String lastName;
        FresherName( String first_name, String last_name) {
            this.firstName = first_name;
            this.lastName = last_name;
        }
        public String firstName() {return firstName;}
        public String lastName() {return lastName;}
        public String toString() {return firstName + " " + lastName; }
    }
}
