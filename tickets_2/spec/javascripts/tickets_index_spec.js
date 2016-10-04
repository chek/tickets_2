//= require models/user
describe('TicketsIndex', function() {
    beforeEach(function() {
        jasmine.getFixtures().fixturesPath = 'assets/fixtures';
        loadFixtures('application.html');
    })
    it("render tickets list admin", function() {
        Tickets2.Models.User.setCurrentUser(1, 'admin');
        spyOn( $, 'ajax' ).and.callFake( function (url, params) {
            var data = MockHelper.mock(url, params);
            if (typeof url == 'object') {
                url.success(data)
            } else if (typeof params == 'object') {
                params.success(data)
            }
        });
        Tickets2.Views.TicketsIndex.render()
        expect($('ul.tickets').length).toBe(1);
        expect($('ul.tickets li').length).toBe(3);
    });
    it("render tickets list support", function() {
        Tickets2.Models.User.setCurrentUser(1, 'support');
        spyOn( $, 'ajax' ).and.callFake( function (url, params) {
            var data = MockHelper.mock(url, params);
            if (typeof url == 'object') {
                url.success(data)
            } else if (typeof params == 'object') {
                params.success(data)
            }
        });
        Tickets2.Views.TicketsIndex.render()
        expect($('ul.tickets').length).toBe(1);
        expect($('ul.tickets li').length).toBe(3);
    });
    it("render tickets list customer", function() {
        Tickets2.Models.User.setCurrentUser(1, 'customer');
        spyOn( $, 'ajax' ).and.callFake( function (url, params) {
            var data = MockHelper.mock(url, params);
            if (typeof url == 'object') {
                url.success(data)
            } else if (typeof params == 'object') {
                params.success(data)
            }
        });
        Tickets2.Views.TicketsIndex.render()
        expect($('ul.tickets').length).toBe(1);
        expect($('ul.tickets li').length).toBe(3);
    });
});