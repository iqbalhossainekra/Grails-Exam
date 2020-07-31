package grailsexam

import acl.Role
import acl.User
import acl.UserRole

class BootStrap {

    def init = { servletContext ->
        def roleAdmin = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def roleUser = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(flush: true)
        def user = User.findByUsername('admin@localhost.local') ?: new User(username: 'admin@localhost.local', password: 'admin', firstName: 'admin', lastName: 'admin', phone: '123', address: 'admin', birthDate: new Date(), version: '0').save(flush: true)
        if (!user?.authorities?.contains(roleAdmin)) {
            UserRole.create(user, roleAdmin, true)
        }
    }
    def destroy = {
    }
}
