package acl

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import groovy.sql.Sql
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

//@Transactional(readOnly = true)
@Secured(['permitAll'])
class UserController {


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService
    def dataSource

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model: [userCount: User.count()]
    }

    def list(Integer max) {


        params.max = Math.min(max ?: 50, 10000)
        params.sort = 'id'
        params.order = 'asc'
        params.offset = Math.min(params.offset ? params.int('offset') : 0, 10000)


        def userInstanceList = User.createCriteria().list(params) {

            if (params.search) {
                ilike("username", "%${params.search}%")
            }

        }
        def userInstanceCount = userInstanceList.totalCount
        [userInstanceList: userInstanceList, userInstanceTotal: userInstanceCount]
    }

    def changePassword() {
        def userName = session["user"]
        if (request.method == 'POST') {
            Date curDate = new Date()
            def userInstance = User.findByUsername(userName)
            def prePassowrd = params.oldPassword.encodeAsMD5()
            if (prePassowrd == userInstance.password) {
                def upass = params.newPassword.encodeAsMD5()
                if (params.newPassword == params.confirmPassword) {
                    User.executeUpdate("update User set password ='" + upass + "'  where id = '" + userInstance.id + "' ")
                    if (userInstance.save(flush: true)) {
                        flash.success = "Your password has been changed successfully!"
                        redirect(controller: "user", action: "changePassword")
                        return
                    } else {
                        flash.error = "Password could not updated! Please try again later."
                    }
                    redirect(controller: "user", action: "changePassword")
                    return
                } else {
                    flash.error = "New Password & Confirm Password Don't Match! Please try again later."
                    redirect(controller: "user", action: "changePassword")
                    return
                }
            } else {
                flash.error = "Old Password Don't Match! Please try again later."
                redirect(controller: "user", action: "changePassword")
                return
            }


        }
        [userName: userName]
    }

    def show() {
        def user = User.get(params.id)
        [userInstance: user
        ]
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def add(User user) {
        def db = new Sql(dataSource)
        def upass = user.password.encodeAsMD5()
        user.setVersion(1)
        def check = User.findByUsername(user.username)
        if (check) {
            flash.error = "Email Id Already Exits"
            redirect(action: "create")
        } else {
            User.withTransaction { status ->
                try {
                    user.save(flush: true, failOnError: true)
                    User.executeUpdate("update User set password ='" + upass + "'  where id = '" + user.id + "' ")
                    def roleee = Role.findByAuthority("ROLE_USER")
                    UserRole p = new UserRole(user: user.id, role: roleee.id).save()
                    flash.success = "User Created successfully! Please Log In to continue"
                    redirect(action: "create")
                }
                catch (Exception exp) {
                    status.setRollbackOnly()
                    flash.error = "Error Occured."
                    redirect(action: "create")
                }
            }
        }
    }

    def edit(User user) {
        respond user
    }

    def getEmailName(String employeeCode) {

        User userName = User.findByUsername(employeeCode)
        String emailName = userName?.id

        if (emailName == null || emailName == "") {
            emailName = "No Data Found"
        } else {
            emailName = 'Already Taken'
        }
        render new WSReturn(100, emailName, null) as JSON
    }

    @Transactional
    def update(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view: 'edit'
            return
        }

        user.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: OK] }
        }
    }

    @Transactional
    def delete(User user) {

        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        user.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}