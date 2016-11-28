//public interface ArtifactMaker extends WandCores, Enchanted {
public interface ArtifactMaker extends Enchanted {
    public Enchanted makeArtifact( String owner ) 
                              throws ArtifactCannotBeCreated;
}
