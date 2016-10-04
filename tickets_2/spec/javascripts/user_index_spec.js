//= require models/user
describe('UserIndex', function() {
    beforeEach(function() {
        Tickets2.Models.User.setCurrentUser(1, 'admin');
        jasmine.getFixtures().fixturesPath = 'assets/fixtures';
        loadFixtures('application.html');
    })
    it("render users list", function() {
        spyOn( $, 'ajax' ).and.callFake( function (url, params) {
            var data = MockHelper.mock(url, params);
            if (typeof url == 'object') {
                url.success(data)
            } else if (typeof params == 'object') {
                params.success(data)
            }
        });
        usersView = new Tickets2.Views.UsersIndex({})
        usersView.render()
        expect($('ul.users').length).toBe(1);
    });
});