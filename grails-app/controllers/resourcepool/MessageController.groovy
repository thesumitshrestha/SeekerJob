package resourcepool

import grails.plugin.springsecurity.annotation.Secured


@Secured(["ROLE_ADMIN","ROLE_JOBSEEKER","ROLE_EMPLOYER"])
class MessageController {

    def springSecurityService

    def index() { }

    def messageList(){
        def inboxList = Message.findAllByReceiver(springSecurityService.currentUser)
        def sendList = Message.findAllBySender(springSecurityService.currentUser)
        [inboxList:inboxList,sendList:sendList]
    }

    def viewMessage(){
        def messageInfo = Message.get(params.messageId as long)

        messageInfo.isRead = true
        messageInfo.save(flush: true)

        def messageCount = Message.createCriteria().list{
            eq("isRead",false);
        }

        session.setAttribute('messageCount',messageCount.size())

        [messageInfo:messageInfo]
    }
}
