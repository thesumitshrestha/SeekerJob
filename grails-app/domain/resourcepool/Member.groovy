package resourcepool

import com.ResourcePool.auth.User

class Member {

    String firstName
    String lastName
    String address
    String gender
    String email
    Date dob
    String profilePicture
    User user

    static constraints = {
        firstName nullable: false
        lastName nullable: false
        gender nullable: false
        user nullable: false
        address nullable: false
        dob nullable: false
        profilePicture nullable: false
    }
}
