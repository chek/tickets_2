//= require models/ticket
describe('Ticket', function() {
    it("create", function() {
        Tickets2.Vars.tickets = new Tickets2.Collections.Tickets()
        expect(Tickets2.Vars.tickets.size()).toBe(0);
        ticket = new Tickets2.Models.Ticket()
        var data = {ticket: {subject: 'subject', description: "description"}};
        spyOn( $, 'ajax' ).and.callFake( function (url, params) {
            params.success(data);
        });
        ticket.create('subject', 'description', null, null)
        expect(Tickets2.Vars.tickets.size()).toBe(1);
    });

});