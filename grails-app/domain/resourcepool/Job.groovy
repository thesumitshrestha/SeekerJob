package resourcepool

import com.ResourcePool.auth.User

class Job {

    String companyName
    String companyAddress
    String skills
    String experience
    Double expectedSalary
    String expectedFacilities
    String description
    String jobType
    User user

    static constraints = {
        skills nullable: true
        experience nullable: true
        expectedSalary nullable: true
        expectedFacilities nullable: true
        jobType nullable: true
        jobType nullable: true
        user nullable: false,unique: true
        companyAddress nullable: true
        companyName nullable: true
        description nullable: true
    }
}
