package resourcepool

import com.ResourcePool.auth.User
import com.ResourcePool.auth.UserRole
import grails.transaction.Transactional

@Transactional
class MemberService {

    //def imageUploadService

    def deleteUser(params)
    {
        def user = User.findById(params.user_id as long)

        def userRole = UserRole.findByUser(user)
        def messages = Message.findAllBySenderOrReceiver(user,user)
        def role = userRole.role.authority

        def job = Job.findByUser(user)
        def hires = Hire.findAllByJobSeekerOrEmployer(user,user)

        def member = Member.findByUser(user)


        println job?.delete(flush: true)
        for(hire in hires)
            println hire?.delete(flush: true)
        for(message in messages)
            message?.delete(flush: true)
        println member?.delete(flush: true)
        println userRole?.delete(flush: true)
        println user?.delete(flush: true)



        return role

    }
}