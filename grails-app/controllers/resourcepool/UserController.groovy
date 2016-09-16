package resourcepool

import com.ResourcePool.auth.Role
import com.ResourcePool.auth.User
import com.ResourcePool.auth.UserRole
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured(["ROLE_ADMIN","ROLE_JOBSEEKER","ROLE_EMPLOYER"])
class UserController {
    def springSecurityService
    def memberService
    def save(){
        println params

        def userInstance = new User(params)
        println params
        if(userInstance.save(flush: true,failOnError: true)){
            println userInstance
            def role
            if(params.role == "ROLE_EMPLOYER"){
                role = Role.findByAuthority("ROLE_EMPLOYER")
                UserRole.create(userInstance,role,true)
                render view: '../home/employerprofile'
            }
            else if(params.role == "ROLE_JOBSEEKER") {
                role = Role.findByAuthority("ROLE_JOBSEEKER")
                UserRole.create(userInstance,role,true)
                def name=params.username
                println name;
                render view: '../home/jobseekerprofile'
            }else{
                role = Role.findByAuthority("ROLE_ADMIN")
                UserRole.create(userInstance,role,true)
                redirect(action: 'userList')
            }
        }

    }

    @Secured('permitAll')
    def newUser(){


        def user = new User(params)
        if(user.save(flush: true,failOnError: true)){
            def role
            if(params.userType=="jobSeeker"){
                role = Role.findByAuthority("ROLE_JOBSEEKER")
            }else{
                role = Role.findByAuthority("ROLE_EMPLOYER")
            }
            if(UserRole.create(user,role,true)){
                CommonsMultipartFile f=request.getFile('profilePicture')
                final String name =f.getOriginalFilename()
                def fos= new FileOutputStream(new File(Constant.profilePhotoUploadDir,user.username+".jpg"))
                f.getBytes().each{ fos.write(it) }
                fos.flush()
                fos.close()

                params.remove("profilePicture")
                def member = new Member(params)
                member.user = user
                member.profilePicture = name
                if(member.save(flush: true,failOnError: true)){
                    println "User Created Successfully"
                    redirect(controller: 'home',action: 'index')
                }else{
                    render view: '/home/signup',model: [message:"Failed Singup Process."]
                }

            }else{
                render view: '/home/signup',model: [message:"Failed Singup Process."]
            }
        }else{
            render view: '/home/signup',model: [message:"Failed Singup Process."]
        }


    }
    def userProfile(){

        def job = new Job(params)
        def user = springSecurityService.currentUser
        job.user = user
        if(job.save(flush: true,failOnError: true)){
            flash.message = "Profile Saved Successfully."
            redirect controller: 'user',action: 'profile'
        }else{
            redirect controller: 'home',action: 'createProfile',params: [message:"Failed Profile Creation Process."]

        }

    }
    def profile(){
        User user = null;
        if(params.id){
            user = User.findById(params.id as long)
        }else{
            user = springSecurityService.currentUser
        }
        Member memberInfo = Member.findByUser(user)
        Job jobInfo = Job.findByUser(user)
        [jobInfo:jobInfo,memberInfo:memberInfo]
    }

    def memberProfile(){
        User user = null;
        if(params.userId){
            user = User.findById(params.userId as long)
        }else{
            user = springSecurityService.currentUser
        }
        Member memberInfo = Member.findByUser(user)
        Job jobInfo = Job.findByUser(user)
        [jobInfo:jobInfo,memberInfo:memberInfo]
    }

    @Secured(["ROLE_ADMIN","ROLE_EMPLOYER"])
    def jobSeekerList(){

        def userRole = UserRole.findAllByRole(Role.findByAuthority("ROLE_JOBSEEKER"))

        def memberList = [],jobList=[]

        userRole.each{
            Member member = Member.findByUser(it?.user)
            memberList.add(member)
            Job job = Job.findByUser(member?.user)
            jobList.add(job)
        }
        [memberList:memberList,jobList:jobList]
    }
    def edit(){
       /* UserRole user=UserRole.findByUser(springSecurityService.currentUser)
        println(user.role)

        if (user.role.authority == "ROLE_EMPLOYER"){
            render view: '/Edit/editEmployer'
        }else if (user.role.authority=="ROLE_JOBSEEKER"){
            render view: '/Edit/editJobseeker'
        }*/
        render view: '/Edit/editProfile'
    }
    def update(){

        def member = Member.get(params.memberId as long)
        def job= Job.get(params.jobId as long)
        job.properties=params
        member.properties = params
        if(member.save(flush: true,failOnError: true) && job.save(flush: true,failOnError: true)){
            println "Successfully Updated;"
        }else{
            println "Error while updating"
        }
        redirect action: 'profile'

    }

    def getImage(){
        String fileName = params.fileName
        File sourceImage


        sourceImage = new File(servletContext.getRealPath("/") + "profilePicture/" + fileName)
        def inputStream = new FileInputStream(sourceImage)

        byte[] pB = inputStream.bytes
        response.contentLength = pB.length
        def out = response.outputStream
        out.write(pB)
        out.close()
    }

    def changeProfilePicture(){
        def user = User.get(session?.user?.id as long)
        CommonsMultipartFile f=request.getFile('newProfilePic')
//        final String name =f.getOriginalFilename()
        def fos= new FileOutputStream(new File(Constant.profilePhotoUploadDir,user.username+".jpg"))
        f.getBytes().each{ fos.write(it) }
        fos.flush()
        fos.close()
        redirect action: 'profile'
    }
    def roleUpdate(){
        def m =  Member.findById(params.memberId)
        def userRole = UserRole.findByUser(m.user)
        userRole.delete(flush: true)
        UserRole.create(m.user, Role.findById(params.role as Long), true)
        println userRole.role.authority
        redirect(controller: 'home', action:'admin')
    }
    def delete(){

        def role = memberService.deleteUser(params)
        if(role){
            redirect(controller: 'home',action: 'admin')
        }
        else {
            render "UnSuccessful"
        }
    }


    def userList(){
        [users:User.all]
    }


    def create(){

    }

}
