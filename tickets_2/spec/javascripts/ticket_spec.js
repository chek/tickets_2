//= require models/ticket
describe('Ticket', function() {
    it("create", function() {
        Tickets2.Vars.tickets = new Tickets2.Collections.Tickets()
        expect(Tickets2.Vars.tickets.size()).toBe(0);
        ticket = new Tickets2.Models.Ticket()
        spyOn( $, 'ajax' ).and.callFake( function (url, params) {
            var data = MockHelper.mock(url, params);
            if (typeof url == 'object') {
                url.success(data)
            } else if (typeof params == 'object') {

                params.success(data)
            }
        });
        ticket.create('subject', 'description', null, null)
        expect(Tickets2.Vars.tickets.size()).toBe(1);
    });

});