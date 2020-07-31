package acll

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class MainController {

    def index() {
        def userName = 'admin'
        [user: authenticatedUser]
    }
}
