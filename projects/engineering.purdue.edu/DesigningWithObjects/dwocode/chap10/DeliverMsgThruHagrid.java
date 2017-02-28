public class DeliverMsgThruHagrid extends MessageDeliveryDecorator {
    public DeliverMsgThruHagrid(MessageDelivery m) {
        super(m);
    }
    public void deliverMessage() {
        super.deliverMessage();
        System.out.println( "This message was carried by Hagrid" );
    }
}
