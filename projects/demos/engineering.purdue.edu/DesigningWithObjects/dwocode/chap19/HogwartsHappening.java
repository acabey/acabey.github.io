public class HogwartsHappening {
    private int clockTick;
    private static int nextClockTick = 1;
    private String storyline;
	
    public HogwartsHappening() {
        clockTick = nextClockTick++;
    }
    public HogwartsHappening( int clockTick, String story ) {
        this.clockTick = clockTick;
        nextClockTick = clockTick + 1;
        this.storyline = story;
    }
    public HogwartsHappening( String story ) {
        this();
        this.storyline = story;
    }
    public String getLatestStoryline() {
        String answer = "Storyline at time " + clockTick 
                                + ":  " + storyline;
        return answer;
    }
    public Memento saveStateToMemento() {
        return new Memento( clockTick, storyline );
    }
    public void restoreStateFromMemento(Memento memento) {
        nextClockTick = memento.getSavedStateClockTick() + 1;
        clockTick = memento.getSavedStateClockTick();
        storyline = memento.getSavedStateStoryLine();
    }

    public static class Memento {
        private final int clockTick;
        private final String storyline;
		
        private Memento( int clockTick, String story ) {
            this.clockTick = clockTick;
            this.storyline = story;
        }
        private int getSavedStateClockTick() {
            return clockTick;
        }
        private String getSavedStateStoryLine() {
            return storyline;
        }
    }	
}
