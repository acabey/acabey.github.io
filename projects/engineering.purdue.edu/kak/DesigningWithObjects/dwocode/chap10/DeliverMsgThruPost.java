public class DeliverMsgThruPost extends MessageDeliveryDecorator {
    public DeliverMsgThruPost(MessageDelivery m) {
        super(m);
    }
    public void deliverMessage() {
        super.deliverMessage();
        System.out.println( "This message is being sent via the Postal "
                          + "Service");
    }
}
