//= require models/user
describe('User', function() {
    it("setCurrentUser", function() {
        Tickets2.Models.User.setCurrentUser(null, null);
        expect(Tickets2.Models.User.currentUser).not.toBe(null);
        expect(Tickets2.Models.User.currentUser.get('id')).toBe(undefined);
    });
    it("getCurrentUser", function() {
         Tickets2.Models.User.currentUser.getCurrentUser()
         var data = {user_id: 8, role: "support"};
         spyOn( $, 'ajax' ).and.callFake( function (url, params) {
            params.success(data);
         });
         expect(Tickets2.Models.User.currentUser).not.toBe(null);
         expect(Tickets2.Models.User.currentUser.get('id')).toBe(8);
    });
    it("login", function() {
        var data = {user_id: 9, role: "customer"};
        spyOn( $, 'ajax' ).and.callFake( function (url, params) {
            params.success(data);
        });
        Tickets2.Models.User.currentUser.login('customer@test.com', 'qwer1234')
        expect(Tickets2.Models.User.currentUser.get('id')).toBe(9);
    });
    it("signup", function() {
        var data = {user_id: 10, role: "customer"};
        spyOn( $, 'ajax' ).and.callFake( function (url, params) {
            params.success(data);
        });
        Tickets2.Models.User.currentUser.signup('customer@test.com', 'qwer1234')
        expect(Tickets2.Models.User.currentUser.get('id')).toBe(10);
    });
    it("logout", function() {
        var data = {user_id: 10, role: "customer"};
        spyOn( $, 'ajax' ).and.callFake( function (url, params) {
            params.success(data);
        });
        Tickets2.Models.User.currentUser.logout()
        expect(Tickets2.Models.User.currentUser.get('id')).toBe(undefined);
    });
});