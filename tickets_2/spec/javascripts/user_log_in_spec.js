//= require models/user
describe('UserLogIn', function() {
    beforeEach(function() {
        Tickets2.Models.User.setCurrentUser(null, null);
        jasmine.getFixtures().fixturesPath = 'assets/fixtures';
        loadFixtures('application.html');
    })
    it("render login dlg", function() {
        view = new Tickets2.Views.UsersLogin({})
        view.render()
        expect($('#login-container').length).toBe(1);
    });
    it("render logut btn", function() {
        Tickets2.Models.User.currentUser.set('id', 1)
        view = new Tickets2.Views.UsersLogin({})
        view.render()
        expect($('.btn.logout').length).toBe(1);
    });
});