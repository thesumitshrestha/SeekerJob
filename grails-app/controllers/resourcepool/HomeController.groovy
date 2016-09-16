package resourcepool

import com.ResourcePool.auth.User
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder

@Secured(["ROLE_ADMIN","ROLE_JOBSEEKER","ROLE_EMPLOYER"])
class HomeController {

    def springSecurityService
    def config = SpringSecurityUtils.securityConfig

    def index() {

        if (springSecurityService.isLoggedIn()){

            if (SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")){
                session.userRole = "ROLE_ADMIN"
                session.user = springSecurityService.currentUser
                redirect(action: 'admin' )
            }
            else if(SpringSecurityUtils.ifAllGranted("ROLE_JOBSEEKER")){
                session.userRole = "ROLE_JOBSEEKER"
                session.user = springSecurityService.currentUser
                redirect(action: 'jobSeekerProfile')
            }
            else {
                session.userRole = "ROLE_EMPLOYER"
                session.user = springSecurityService.currentUser
                redirect(action: 'employerProfile')
            }
        }
        else {

            String view = 'auth'
            String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
            println postUrl
            render view: view, model: [postUrl: postUrl,
                                       rememberMeParameter: config.rememberMe.parameter]
        }
    }

    @Secured("permitAll")
    def signup(){
        render view: "signup",model: [userType:params.userType]
    }

    def createProfile(){
        if(Job.findByUser(User.findById(session?.user?.id as long))){
            redirect controller: 'user',action: 'profile'
        }
        if(params.message){
            render view:'createProfile',model:[message:params.message]
        }
    }

    @Secured("permitAll")
    def interfaceAction(){
        render view: 'interface'
    }

    @Secured(["ROLE_JOBSEEKER"])
    def jobSeekerProfile(){

        def messageCount = Message.createCriteria().list{
            eq("isRead",false);
        }

        session.setAttribute('messageCount',messageCount.size())

        def companyList = Job.list()

        [companyList:companyList]

    }

    @Secured(["ROLE_ADMIN"])
    def admin(){

        render view: 'adminpage',model: [userList:Member.list()]

    }

    @Secured(["ROLE_EMPLOYER"])
    def employerProfile(){
        def roles =  springSecurityService.getPrincipal().getAuthorities()
////        return  roles;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        render view: '../home/employerprofile',model: [name: name]
    }

}
