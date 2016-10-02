//= require models/user
describe('User', function() {
    it("initialize", function() {
        Tickets2.initialize();
        expect(Tickets2.Vars.currentUser).not.toBe(null);
    });
});