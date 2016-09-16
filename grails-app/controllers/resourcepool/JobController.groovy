package resourcepool

import com.ResourcePool.auth.User
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.grails.datastore.mapping.core.Session

import javax.mail.*
import javax.mail.internet.*

@Secured("permitAll")
class JobController {

    def springSecurityService

    def index() { }

    @Secured(["ROLE_EMPLOYER"])
    def searchBySkill(){
       /* *//*def jobList = Job.findAllBySkillsIlike("%"+params.skillName+"%")

        def memberList = []

        jobList.each {
            Member member = Member.findByUser(it?.user)
            memberList.add(member)
        }*//*
        def jobList=Job.findAll(

        )

        render view: 'searchResult',model: [memberList:memberList,jobList:jobList]
*/
        if(params.expectedSalary==0){
            def expectedSalary=null
        }
        def jobListCriteria=Job.createCriteria()
        def jobList=jobListCriteria.list{
            if(params.skills){
                    ilike("skills",'%' + params.skills + '%')
                }
                if(params.jobType){
                    eq("jobType",params.jobType)
                }
                if(params.experience){
                    eq("experience",params.experience)
                }
                if(params.expectedSalary){
                    lte("expectedSalary",Double.parseDouble(params.expectedSalary))
                }
        }
        def memberList = []

        jobList.each {
            Member member = Member.findByUser(it?.user)
            memberList.add(member)
        }
        render view: 'searchResult',model: [memberList:memberList,jobList:jobList]

    }

    def searchBySkillOnly(){
        def jobListCriteria=Job.createCriteria()
        def jobList=jobListCriteria.list{
            eq("skills",params.skillName)

        }

        def memberList = []

        jobList.each {
            Member member = Member.findByUser(it?.user)
            memberList.add(member)
        }
        render view: 'searchResult',model: [memberList:memberList,jobList:jobList]

    }

    @Secured(["ROLE_EMPLOYER"])
    def searchPage(){
        render view: 'searchCategory'
    }

    @Secured(["ROLE_EMPLOYER"])
    def hireRequest(){
        def jobSeeker = User.get(params.jobSeekerId as long)
        def employer = springSecurityService.currentUser

        def hire = new Hire(employer: employer,jobSeeker: jobSeeker,status: "PENDING")

        if(hire.save(flush: true,failOnError: true)){
            flash.message = "Hire Request Sent Successfully"
        }else{
            flash.message = "Hire Request Sent Successfully"
        }
        redirect(action: "hireList")
    }

    @Secured(["ROLE_EMPLOYER"])
    def hireList(){
        def hireList = Hire.findAllByEmployer(springSecurityService.currentUser)
        def memberList = []
        hireList.each {
            Member member = Member.findByUser(it?.jobSeeker)
            memberList.add(member)
        }
        [memberList: memberList,hireList:hireList]
    }

    def sendMessage(){

        String message = params.message
        println message.length()
        String messageSubject = params.messageSubject
        def sender = springSecurityService.currentUser
        def receiver = User.get( params.receiverId as long)
        String senderEmail = Member.findByUser(sender)?.email
        String receiverEmail = Member.findByUser(receiver)?.email
        Message messageObject = new Message(sender: sender,receiver: receiver,message: message,subject: messageSubject)

        if(messageObject.save(flush:true,failOnError: true)){
            sendEmail(senderEmail,receiverEmail,messageSubject,message)
            return render ([message:"Message Sent Successfully"] as JSON)
        }else{
            return render ([message:"Message not Sent."] as JSON)
        }
    }


    @Secured(["ROLE_JOBSEEKER"])
    def offerList(){
        def offerList = Hire.findAllByJobSeeker(springSecurityService.currentUser)
        def employerList = []
        def employerCompanyList = []
        offerList.each{
            Member m = Member.findByUser(it?.employer)
            employerList.add(m)
            employerCompanyList.add(Job.findByUser(it?.employer))
        }
        [employerList:employerList,employerCompanyList:employerCompanyList,offerList:offerList]

    }

    def acceptOffer(){
        def hire = Hire.get(params.hireId as long)
        hire.status = "ACCEPTED"
        if(hire.save(flush: true,failOnError: true)){
            flash.message = "Offer Accepted Successfully."
        }else {
            flash.message = "Error While Accepting Offer."
        }
        redirect action: 'offerList'
    }

    def rejectOffer(){
        def hire = Hire.get(params.hireId as long)
        hire.status = "REJECTED"
        if(hire.save(flush: true,failOnError: true)){
            flash.message = "Offer Rejected Successfully."
        }else {
            flash.message = "Error While Rejecting Offer."
        }
        redirect action: 'offerList'
    }

    def sendEmail(String sender,String receiver, String subject, String messageBody){
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {

                        return new PasswordAuthentication("bickeykc@gmail.com","123456789@");
                    }
                });

        try {
            javax.mail.Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.setRecipients(javax.mail.Message.RecipientType.TO,
                    InternetAddress.parse(receiver));
            message.setReplyTo(InternetAddress.parse(sender))
            message.setSubject(subject);
            message.setText(messageBody);

            Transport.send(message);
            println "Email Sent Successfully"

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }
    def groupMessage(){
        Integer id;
        def currentUser=springSecurityService.currentUser
        String subject="Call for interview"

        for(int i=0;id = params["check" + i] as Integer;i++) {
            def sendername=Member.findByUser(currentUser)?.firstName
            def senderCompany=Job.findByUser(currentUser)?.companyName
            def name = Member.findByUser(User.findById(id)).firstName
            String message = "Hello " + name + '\n\n' + "        We were really impressed with your background and" +
                    " would like to invite you to an interview (at our office, via telephone, via skype) " +
                    "to tell you more about our role and to get to know you a little better. " +
                    "(You can also add any further details about the interview eg. Presentation, Directions etc).\n" +
                    "\n" + "Please let us know which of the times suit you best." +"\n\n"+"I look forward to hearing from you."+"\n\n"+"Thanks"
            String message1="Hello " + name + '\n\n' +"       "+sendername+ " from " +senderCompany+ " was really impressed with your background and" +
                    " would like to invite you to an interview (at our office, via telephone, via skype) " +
                    "to tell you more about our role and to get to know you a little better. " +
                    "(You can also add any further details about the interview eg. Presentation, Directions etc).\n" +
                    "\n" + "Please let us know which of the times suit you best." +"\n\n"+"They are looking forward to hearing from you."+"\n\n"+"Thanks"
            String senderEmail = Member.findByUser(currentUser)?.email
            println(senderEmail)
            String recieverEmail = Member.findByUser(User.findById(id))?.email
            println(recieverEmail)

            Message messageObject = new Message(sender: currentUser, receiver: User.findById(id), message: message, subject: subject)

            if (messageObject.save(flush: true, failOnError: true)) {
                sendEmail(senderEmail, recieverEmail, subject, message1)
                println("sucessfully saved")

            } else {
                println("sucessfully not saved")
            }


        }
        render view: "searchCategory"
    }
}
