import java.util.Comparator;
import java.lang.reflect.*;

public class SortingHat<T> implements Hogwarts_Info { 
	
    // These lists hold the names of the freshers
    // placed in each of the four houses:

    private MagicCollection<T> gryffindor = new MagicList<T>();
    private MagicCollection<T> hufflepuff = new MagicList<T>();
    private MagicCollection<T> ravenclaw = new MagicList<T>();
    private MagicCollection<T> slytherin = new MagicList<T>();
	
    private MagicCollection<T>[] all_houses = new MagicList[4];
    {
        all_houses[0] = gryffindor;
        all_houses[1] = hufflepuff;
        all_houses[2] = ravenclaw;
        all_houses[3] = slytherin;
    }
    
    /////////////////         Methods        ///////////////////
    /**
     * This method tells us which of the four public
     * instance variables (that describe the aptitudes of an
     * incoming student) defined for the Fresher class shows
     * the largest range over all the 24 freshers.  The
     * larger the range of values for such an instance
     * variable, the greater its usefulness for
     * discriminating between the freshers with regard to
     * their placement in the four houses.
     */
    public String findMostDiscriminatingField(MagicCollection<T> coll)
                                                    throws Exception {
        String mostDiscriminatingField = null;
        Class<?> cl = coll.first().getClass();
        MagicCollection<String> atts = listAllNumericFields( cl );
        if (atts.length() == 0) {
            throw new NumericalAttributesNotFoundException();
        }
        Iterator<String> itatt = atts.iterator();
        while (itatt.hasNext()) {
            System.out.print( itatt.next() + "  "); 
        }
        System.out.println();
        Range[] ranges = new Range[ atts.length() ];
        double rangeSpan = 0; 
        Iterator<String> itatt2 = atts.iterator();
        int i = 0;
        while (itatt2.hasNext()) {
            String attsitem = itatt2.next();
            ranges[i] = getRangeOfAttributeValues(attsitem, coll);
            if (i == 0) {
                rangeSpan = ranges[0].max - ranges[0].min;
                mostDiscriminatingField = attsitem;
            } else {
                double rangeForThisAttribute = 
                                        ranges[i].max - ranges[i].min;
                if (rangeForThisAttribute > rangeSpan) {
                    rangeSpan = rangeForThisAttribute;
                    mostDiscriminatingField = attsitem;
                }
            }
            i++;
        }
        if (mostDiscriminatingField == null) {
            throw new MostDiscriminatingFieldNotFoundException();
        }
        //comparisonFieldName = mostDiscriminatingField;
        return mostDiscriminatingField;
    }	
		
    /**
     *   This method returns those fields of the argument class that 
     *   are numerical in nature.  Finding such fields is important 
     *   because it is one of the numerical fields that is used for 
     *   establishing the sorting criterion.
     */
    public MagicCollection<String> listAllNumericFields(Class<?> cl) {
        Field[] flds = cl.getFields();
        MagicCollection<String> fieldNames = new MagicList<String>();
        for (int i=0; i < flds.length; i++) {
            int mod = flds[i].getModifiers();
            if (!Modifier.isStatic(mod)){
                Type type = flds[i].getGenericType();
                if (   "int".equals(type.toString()) 
                     | "float".equals(type.toString()) 
                     | "double".equals(type.toString())) {
                    fieldNames.add(flds[i].getName());
                }
            }
        } 
        return fieldNames;
    }
	     
    /**
     * Returns as a Range instance the range of values that correspond
     * to the designated attribute.
     */
    public Range getRangeOfAttributeValues( String attribute, 
                                            MagicCollection<T> coll) { 
        Range range = new Range();
        Iterator<T> it = coll.iterator(); 
        int i=0;
        while (it.hasNext()) {
            T candidatei = it.next();
            Class<?> cl = candidatei.getClass();
            Field fd = null;
            try {
                fd = cl.getField( attribute );
            } catch (SecurityException e) {
                e.printStackTrace();
            } catch (NoSuchFieldException e) {
                e.printStackTrace();
            }
            double val = 0.0;
            Object objVal = null;
            try {
                Type type = fd.getGenericType();
                objVal = fd.get( candidatei );
                if ( "int".equals(type.toString()) ) {
                    val = ( (Integer) objVal ).intValue();
                    if (i == 0) {
                        range.min = range.max = val;
                    } else {
                        if (val < range.min) {
                            range.min = val;
                        }
                        if (val > range.max) {
                            range.max = val;
                        }
                    }    				    
                } else if ("float".equals(type.toString())) {
                    val = ( (Float) objVal).floatValue();
                    if (i == 0) {
                        range.min = range.max = val;
                    } else {
                        if (val < range.min) {
                            range.min = val;
                        }
                        if (val > range.max) {
                            range.max = val;
                        }
                    }    			
                } else if ("double".equals(type.toString())) {
                    val = ( (Double) objVal).doubleValue();
                        if (i == 0) {
                            range.min = range.max = val;
                        } else {
                            if (val < range.min) {
                                range.min = val;
                            }
                            if (val > range.max) {
                                range.max = val;
                            }
                        }
                }  else if ( "string".equals( type.toString() ) ) {
                    range.symbolicVals.add( objVal.toString());
                }
            } catch (IllegalArgumentException e) {
            e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
            i++;
        }
        return range; 
    }  

    public void makeInitialHousePlacements(MagicCollection<T> arr, 
                                  String criterion ) throws Exception{
        Class<?> clarr = arr.first().getClass();
        Method m = clarr.getMethod( criterion );
        Iterator<T> it = arr.iterator();
        while( it.hasNext() ) {
            T f = it.next();
            switch ( ((Integer) m.invoke(f, 
                                      (Object[]) null)).intValue() ) {
                case 0: gryffindor.add(f); break;
                case 1: hufflepuff.add(f); break;
                case 2: ravenclaw.add(f); break;
                case 3: slytherin.add(f); break;
            }
        }
    }
	
    public MagicCollection<T> sortAndRank(MagicCollection<T> coll, 
          String wherePreferences, String whereToSetRankedPrefs) 
                                                    throws Exception {
        Class<?> clarr = coll.first().getClass();
        Method m1 = clarr.getMethod( wherePreferences );
        Method m2 = clarr.getMethod(  whereToSetRankedPrefs, 
                                                       double.class );
        String field = findMostDiscriminatingField(coll);
        System.out.println( "Most discriminating field is: " + field);
        Object[] objArray = new Object[ coll.length() ];
        Iterator<T> it_for_coll = coll.iterator();
        int i = 0;
        while (it_for_coll.hasNext()) {
            objArray[i] = (T)  it_for_coll.next();
            i++;
        }
        java.util.Arrays.sort( (T[]) objArray, 
                                  this.new MagicComparator<T>(field) );
        MagicCollection<T> sortedFreshers = new MagicList<T>();
        for (int j=0; j<objArray.length; j++) {
            double weightedpref =  
                  ( (objArray.length - j) / (1.0 * objArray.length))
                  *
                  (((Integer) m1.invoke((T)objArray[j])).intValue()); 
            m2.invoke( (T) objArray[j], weightedpref );	
            sortedFreshers.add((T) objArray[j]);
        }
        return sortedFreshers;
    }
	    
    public void makeHousePlacements(MagicCollection<T> coll, 
                       String getPreferredHouseIndex, 
                       String rankWeightedPriority) throws Exception {
        gryffindor.clear(); 
        hufflepuff.clear(); 
        ravenclaw.clear(); 
        slytherin.clear();	
        Class<?> elementClass = coll.first().getClass();		    
        Object[] objArray = new Object[ coll.length() ];
        Iterator<T> it_for_coll = coll.iterator();
        int i = 0;
        while (it_for_coll.hasNext()) {
            objArray[i] = (T)  it_for_coll.next();
            i++;
        }
        java.util.Arrays.sort( (T[]) objArray, 
                this.new MagicComparator<T>( rankWeightedPriority ) );
        MagicCollection<T> furtherSortedObjArr = new MagicList<T>();
        for (int j=0; j<objArray.length; j++) {
            furtherSortedObjArr.add((T) objArray[j]);
        }
        double average = coll.length() / all_houses.length;
        Method m = elementClass.getMethod( getPreferredHouseIndex );
        Iterator<T> it = furtherSortedObjArr.iterator();
        while (it.hasNext()) {
            T item = it.next();
            int wantedHouse =  
               ((Integer) m.invoke(item, (Object[]) null)).intValue();
            if (all_houses[wantedHouse].length() < average ) {
                all_houses[wantedHouse].add( item );
            } else {
                for(int j=0; j<all_houses.length;j++) {
                    if (j == wantedHouse) continue;
                    if (all_houses[j].length() >= average ) {
                        continue;
                    } else {
                       all_houses[j].add(item);
                       break;
                    }
                }
            }
        }
    }

    public String getHouseCounts() {
    	return "House counts:  Gryffindor=" + gryffindor.length() 
                        + " Hufflepuff=" + hufflepuff.length() 
                        + " Ravenclaw=" + ravenclaw.length() 
                        + " Slytherin="  + slytherin.length() ;
    }
	    
    public void displayHousePlacements() {
        for(int i=0; i<all_houses.length;i++) {
            switch(i) {
                case 0: System.out.println("Gryffindor:"); break;
                case 1: System.out.println("Hufflepuff:"); break;
                case 2: System.out.println("Ravenclaw:"); break;
                case 3: System.out.println("Slytherin:"); break;
            }
            Iterator<T> it = all_houses[i].iterator();
            while (it.hasNext()) {
                T f = it.next();
                System.out.println("       " + f +  "  placed in: "
                                       +  HogwartsHouse.values()[i] );
            }
        }
    }
	    
    /**
     * This enclosed class serves as a comparator object for the
     * sorting algorithm. This class assumes that you have already
     * called an appropriate method to discover the field on the 
     * basis of which the instances must be sorted.  The name of 
     * that field is supplied as an argument to the constructor of 
     * MagicComparator.  When Array.sort is called on an array of 
     * instnaces, the second argument to that method is an instance 
     * of the comparator class shown below:
     */
    public class MagicComparator<T1> implements Comparator<T1> {
        private String criterionField;
        public MagicComparator(String criterionField ) { 
            this.criterionField = criterionField; 
        }
        public int compare( T1 f1, T1 f2) {
    	    Class<?> cl = f1.getClass();
            Field fd = null; 
            try {
                fd = cl.getField(criterionField);       
            } catch(NoSuchFieldException e) {
                e.printStackTrace();
            } catch(SecurityException e){
                e.printStackTrace();
            }
            double yy = 0.0;
            double zz = 0.0;
            try {
                yy = fd.getDouble(f1);
                zz = fd.getDouble(f2);
            } catch(IllegalArgumentException e){
                e.printStackTrace();
            } catch(IllegalAccessException e){
                e.printStackTrace();
            }
            // The -1, 0, 1 values returned below produce sorting 
            // in a value decreasing order:
            if (yy == zz) { return 0;}
            if(yy < zz) {return 1;}
            return -1;
        }
    }
}   
class MostDiscriminatingFieldNotFoundException extends Exception {}
class NumericalAttributesNotFoundException extends Exception {}
