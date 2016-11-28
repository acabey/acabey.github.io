public class DeliverMsgThruChimney extends MessageDeliveryDecorator {
    public DeliverMsgThruChimney(MessageDelivery m) {
        super(m);
    }
    public void deliverMessage() {
        super.deliverMessage();
        System.out.println( "This message is being sent through the "
                          + "chimney of Harry Potter's home" );
    }
}
