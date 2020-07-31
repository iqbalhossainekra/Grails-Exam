package acl

import grails.artefact.Controller
import grails.plugin.springsecurity.annotation.Secured
import grailsexam.BootStrap
import groovy.sql.Sql

import java.security.MessageDigest

@Secured(['permitAll'])
class LoginController {
    def springSecurityService
    def dataSource

    def index() {

    }

    def authDoAction() {
        def email = params.user
        def pass = params.password
        def isFound = User.findByUsername(email)
        if (isFound) {
            def upassword = pass.encodeAsMD5()
//            def upassword = MessageDigest.getInstance("MD5").digest(pass.bytes).encodeHex().toString()
//            println(upassword)
//            println(pass)
            if (isFound.username == email && isFound.password == upassword) {

                session["user"] = isFound.username
                session["check"] = isFound.id
                def userId = isFound.id
                def rolee = UserRole.executeQuery("from UserRole where user = '" + userId + "'")
                session["role"] = rolee[0].role.authority

                if (session["role"] == 'ROLE_ADMIN') {
                    redirect(controller: "Home", action: 'index')
                } else {
                    redirect(controller: "Home", action: 'index')
//                    redirect(controller: "User", action:'show', params: [id: session["check"]])
                }


            } else {
                def msg = "Sorry! Try Again."
                flash.message = msg
                redirect(action: 'auth')
            }
        }
    }
}
