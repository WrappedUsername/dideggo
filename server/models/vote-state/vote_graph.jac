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
            title = "DIDEGGO Landing Page",
            message = "Welcome to DIDEGGO! Are you ready to participate in Digital Intelligence Decentralized Global Governance?",
            prompts = ["Yes","DIDEGGO Voting Page","DIDEGGO Proposals Page","DIDEGGO Citizens Dashboard"]
        );
        vote_state_2 = spawn node::vote_state(
            title = "DIDEGGO Voting Page",
            message = "Welcome to DIDEGGO Voting! Are you ready to vote?",
            prompts = ["Yes","DIDEGGO Landing Page","DIDEGGO Proposals Page","DIDEGGO Citizens Dashboard"]
        );
        vote_state_3 = spawn node::vote_state(
            title = "DIDEGGO Proposals Page",
            message = "Welcome to DIDEGGO proposals! Are you ready to create a proposal?",
            prompts = ["Yes","DIDEGGO Landing Page","DIDEGGO Voting Page","DIDEGGO Citizens Dashboard"]
        );
        vote_state_4 = spawn node::vote_state(
            title = "DIDEGGO Citizens Dashboard",
            message = "Welcome to your Citizens Dashboard! Would you like to update info?",
            prompts = ["Yes","DIDEGGO Landing Page","DIDEGGO Voting Page","DIDEGGO Proposals Page"]
        );

        // Connecting the nodes together
        server ++> models;
        models ++> vote_state;
        vote_state ++> vote_state_1;
        vote_state ++> vote_state_2;
        vote_state ++> vote_state_3;
        vote_state ++> vote_state_4;

        // connect the vote_state_1 to node_landing_page
        vote_state_1 +[intent_transition(intent="Yes")]+> node_landing_page;
        // connect the vote_state_1 to vote_state_2
        vote_state_1 +[intent_transition(intent="DIDEGGO Voting Page")]+> vote_state_2;
        // connect the vote_state_1 to vote_state_3
        vote_state_1 +[intent_transition(intent="DIDEGGO Proposals Page")]+> vote_state_3;
        // connect the vote_state_1 to vote_state_4
        vote_state_1 +[intent_transition(intent="DIDEGGO Citizens Dashboard")]+> vote_state_4;

        // connect the vote_state_2 to node_voting_page
        vote_state_2 +[intent_transition(intent="Yes")]+> node_voting_page;
        // connect the vote_state_2 to vote_state_1
        vote_state_2 +[intent_transition(intent="DIDEGGO Landing Page")]+> vote_state_1;
        // connect the vote_state_2 to vote_state_3
        vote_state_2 +[intent_transition(intent="DIDEGGO Proposals Page")]+> vote_state_3;
        // connect the vote_state_2 to vote_state_4
        vote_state_2 +[intent_transition(intent="DIDEGGO Citizens Dashboard")]+> vote_state_4;
        

        // connect the vote_state_3 to node_proposals_page
        vote_state_3 +[intent_transition(intent="Yes")]+> node_proposals_page;
        // connect the vote_state_3 to vote_state_1
        vote_state_3 +[intent_transition(intent="DIDEGGO Landing Page")]+> vote_state_1;
        // connect the vote_state_3 to vote_state_2
        vote_state_3 +[intent_transition(intent="DIDEGGO Voting Page")]+> vote_state_2;
        // connect the vote_state_3 to vote_state_4
        vote_state_3 +[intent_transition(intent="DIDEGGO Citizens Dashboard")]+> vote_state_4;

        // connect the vote_state_4 to node_citizens_dashboard
        vote_state_4 +[intent_transition(intent="Yes")]+> node_citizens_dashboard;
        // connect the vote_state_4 to vote_state_1
        vote_state_4 +[intent_transition(intent="DIDEGGO Landing Page")]+> vote_state_1;
        // connect the vote_state_4 to vote_state_2
        vote_state_4 +[intent_transition(intent="DIDEGGO Voting Page")]+> vote_state_2;
        // connect the vote_state_4 to vote_state_3
        vote_state_4 +[intent_transition(intent="DIDEGGO Proposals Page")]+> vote_state_3;
    }
}

walker init {
    root {
        spawn here ++> node::models;
    }
}
