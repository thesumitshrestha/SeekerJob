package resourcepool
import com.ResourcePool.auth.User

class Message {

    User sender
    User receiver
    String message
    String subject
    boolean isRead
    Date sendDate = new Date();

    static constraints = {

    }
}
