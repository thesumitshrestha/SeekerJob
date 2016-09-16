import com.ResourcePool.auth.Role
import com.ResourcePool.auth.User
import com.ResourcePool.auth.UserRole
import resourcepool.Constant

class BootStrap {

    def init = { servletContext ->

        Role adminRole = Role.findByAuthority("ROLE_ADMIN")?:new Role(authority:  'ROLE_ADMIN').save(flush: true)
        Role jobSeekerRole = Role.findByAuthority("ROLE_JOBSEEKER")?:new Role(authority:  'ROLE_JOBSEEKER').save(flush: true)
        Role employerRole = Role.findByAuthority("ROLE_EMPLOYER")?:new Role(authority:  'ROLE_EMPLOYER').save(flush: true)

        User admin = User.findByUsername("admin")?:
                new User(username: 'admin',
                        password: 'admin')
                        .save(flush:true,failOnError: true)
        UserRole.create(admin,adminRole,true)

        User jobSeeker = User.findByUsername("job")?:
                new User(username: 'job',
                        password: 'job')
                        .save(flush:true)
        UserRole.create(jobSeeker,jobSeekerRole,true)

        User employer = User.findByUsername("employer")?:
                new User(username: 'employer',
                        password: 'employer')
                        .save(flush: true)

        UserRole.create(employer,employerRole,true)


        String profilePictureUploadDir = servletContext.getRealPath("/")+"profilePicture"
        Constant.profilePhotoUploadDir = profilePictureUploadDir

    }
    def destroy = {
    }
}
