// Defining the nodes, lol I tested this command using Amazon's CodeWisperer, and NOPE, it doesn't know Jac!
node server;
node models;
node vote_state {
    has title;
    has message;
    has prompts;
}

edge intent_transition {
    has intent;
}

// Static vote state graph
graph vote_state {
    has anchor server;
    spawn {
        server = spawn node::server;
        models = spawn node::models;
        vote_state = spawn node::vote_state;
        vote_state_1 = spawn node::vote_state(
            title = "Voting Page",
            message = "Welcome to DIDEGGO Voting! Are you ready to vote?",
            prompts = ["Yes","Proposals Page","Citizens Dashboard","Quit"]
        );
        vote_state_2 = spawn node::vote_state(
            title = "Proposals Page",
            message = "Welcome to DIDEGGO proposals! Are you ready to create a proposal?",
            prompts = ["Yes","Voting Page","Citizens Dashboard","Quit"]
        );
        vote_state_3 = spawn node::vote_state(
            title = "Citizens Dashboard",
            message = "Welcome to your Citizens Dashboard! Would you like to update info?",
            prompts = ["Yes","Voting Page","Proposals Page","Quit"]
        );
        vote_state_4 = spawn node::vote_state(
            title = "Quit",
            message = "Thank you for participating in DIDEGGO! Are you ready to leave the app?",
            prompts = ["Yes","Voting Page","Proposals Page","Citizens Dashboard"]
        );

        // Connecting the nodes together
        server ++> models;
        models ++> vote_state;
        vote_state ++> vote_state_1;
        vote_state ++> vote_state_2;
        vote_state ++> vote_state_3;
        vote_state ++> vote_state_4;

        // connect the vote_state_1 to node_voting_page
        vote_state_1 +[intent_transition(intent="Yes")]+> node_voting_page;
        // connect the vote_state_1 to vote_state_2
        vote_state_1 +[intent_transition(intent="Proposals Page")]+> vote_state_2;
        // connect the vote_state_1 to vote_state_3
        vote_state_1 +[intent_transition(intent="Citizens Dashboard")]+> vote_state_3;
        // connect the vote_state_1 to vote_state_4
        vote_state_1 +[intent_transition(intent="Quit")]+> vote_state_4;
        

        // connect the vote_state_2 to node_proposals_page
        vote_state_2 +[intent_transition(intent="Yes")]+> node_proposals_page;
        // connect the vote_state_2 to vote_state_1
        // connect the vote_state_2 to vote_state_3
        // connect the vote_state_2 to vote_state_4

        // connect the vote_state_3 to node_citizens_dashboard
        vote_state_3 +[intent_transition(intent="Yes")]+> node_citizens_dashboard;
        // connect the vote_state_3 to vote_state_1
        // connect the vote_state_3 to vote_state_2
        // connect the vote_state_3 to vote_state_4

        // connect the vote_state_4 to node_exit_app_page
        vote_state_4 +[intent_transition(intent="Yes")]+> node_exit_app_page;
        // connect the vote_state_4 to vote_state_1
        // connect the vote_state_4 to vote_state_2
        // connect the vote_state_4 to vote_state_3
    }
}

walker init {
    root {
        spawn here ++> node::models;
    }
}