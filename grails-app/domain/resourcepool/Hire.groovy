package resourcepool

import com.ResourcePool.auth.User

class Hire {


    User employer
    User jobSeeker
    String status

    static constraints = {
        employer nullable: false
        jobSeeker nullable: false
        status nullable: false
        employer(unique: ['jobSeeker'])
    }
}
