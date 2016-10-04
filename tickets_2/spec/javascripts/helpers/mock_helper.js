(function() {
    window.MockHelper = {
        mock: function(url, params) {
            var data = {};
            if (typeof url == 'string') {
                if (url.indexOf('/tickets/create') >= 0) {
                    data = {ticket: {subject: 'subject', description: "description"}}
                }
                if (url.indexOf('/users/get_current_user') >= 0) {
                    data = {user_id: 8, role: "support"}
                }
                if (url.indexOf('/users/sign_in_ajax') >= 0) {
                    data = {user_id: 9, role: "support"}
                }
            } else if  (typeof url == 'object') {
                if (url.url.indexOf('/tickets/create') >= 0) {
                    data = {ticket: {subject: 'subject', description: "description"}}
                }
                if (url.url.indexOf('/users/get_current_user') >= 0) {
                    data ={user_id: 8, role: "support"}
                }
                if (url.url.indexOf('/tickets/list') >= 0) {
                    var response = '{"tickets":[{"id":3,"subject":"Refund.","description":"I want downgrade my plan and want to refund","customer_id":6,"agent_id":2,"status":1,"created_at":"2016-10-03T15:11:48.000Z","updated_at":"2016-10-03T15:11:48.000Z"},{"id":5,"subject":"I have email issue","description":"Each email from your system i got twice. Can you dont spam me?","customer_id":5,"agent_id":2,"status":1,"created_at":"2016-10-03T15:11:48.000Z","updated_at":"2016-10-03T17:42:55.000Z"}],"customers":[{"id":5,"email":"customer1@test.com","role":"customer","created_at":"2016-10-03T15:11:48.000Z","updated_at":"2016-10-03T15:11:48.000Z"},{"id":6,"email":"customer2@test.com","role":"customer","created_at":"2016-10-03T15:11:48.000Z","updated_at":"2016-10-03T17:42:01.000Z"}],"agents":[{"id":2,"email":"support@test.com","role":"support","created_at":"2016-10-03T15:11:47.000Z","updated_at":"2016-10-03T17:42:47.000Z"}]}'
                    data = JSON.parse(response)
                }
                if (url.url.indexOf('/users/list') >= 0) {
                    var response = '{"users":[{"id":2,"email":"support@test.com","role":"support","created_at":"2016-10-04T07:31:57.000Z","updated_at":"2016-10-04T09:51:21.000Z"},{"id":3,"email":"customer@test.com","role":"customer","created_at":"2016-10-04T07:31:57.000Z","updated_at":"2016-10-04T09:51:40.000Z"},{"id":4,"email":"some.customer@test.com","role":"customer","created_at":"2016-10-04T07:54:06.000Z","updated_at":"2016-10-04T07:54:06.000Z"},{"id":5,"email":"asd@dfgdf.rt","role":"customer","created_at":"2016-10-04T08:27:20.000Z","updated_at":"2016-10-04T09:51:00.000Z"},{"id":6,"email":"sdfsdfs@cbdfgfd.rt","role":"customer","created_at":"2016-10-04T08:40:35.000Z","updated_at":"2016-10-04T09:45:06.000Z"},{"id":7,"email":"sdfsdf@dfgdfg.rt","role":"customer","created_at":"2016-10-04T08:43:39.000Z","updated_at":"2016-10-04T08:43:39.000Z"},{"id":8,"email":"kjhkjg@xvdsd.rt","role":"customer","created_at":"2016-10-04T08:44:37.000Z","updated_at":"2016-10-04T08:44:37.000Z"},{"id":9,"email":"xvsdfsdf@dfgdfg.rt","role":"customer","created_at":"2016-10-04T08:45:48.000Z","updated_at":"2016-10-04T08:47:05.000Z"},{"id":10,"email":"kjhkjh@fdsgdf.rt","role":"customer","created_at":"2016-10-04T09:44:15.000Z","updated_at":"2016-10-04T09:44:15.000Z"}]}'
                    data = JSON.parse(response)
                }
            }
            return data;
        },
    };
}).call(this);