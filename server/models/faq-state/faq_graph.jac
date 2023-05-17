// Defining the nodes
node server;
node models;
node faq_state {
    has question;
    has answer;
}

// Static faq state graph
graph faq_state {
    has anchor server;
    spawn {
        server = spawn node::server;
        models = spawn node::models;
        faq_state = spawn node::faq_state;
        faq_state_1 = spawn node::faq_state(
            question="What is DIDEGGO and how does it work?",
            answer="DIDEGGO Landing Page"
        );
        faq_state_2 = spawn node::faq_state(
            question="How do I vote on proposals using DIDEGGO?",
            answer="DIDEGGO Voting Page"
        );
        faq_state_3 = spawn node::faq_state(
            question="How do I create a proposal using DIDEGGO?",
            answer="DIDEGGO Proposals Page"
        );
        faq_state_4 = spawn node::faq_state(
            question="How do I update my documents?",
            answer="DIDEGGO Citizens Dashboard"
        );
        // faq_state_5 = spawn node::faq_state(
        //     question="",
        //     answer=""
        // );
        // ready to expand faq...
        // faq_state_6 = spawn node::faq_state(
        //     question="",
        //     answer=""
        // );
        // faq_state_7 = spawn node::faq_state(
        //     question="",
        //     answer=""
        // );
        // faq_state_8 = spawn node::faq_state(
        //     question="",
        //     answer=""
        // );
        // faq_state_9 = spawn node::faq_state(
        //     question="",
        //     answer=""
        // );
        // faq_state_10 = spawn node::faq_state(
        //     question="",
        //     answer=""
        // );
        // faq_state_11 = spawn node::faq_state(
        //     question="",
        //     answer=""
        // );

        // Connecting the nodes together
        server ++> models;
        models ++> faq_state;
        faq_state ++> faq_state_1;
        faq_state ++> faq_state_2;
        faq_state ++> faq_state_3;
        faq_state ++> faq_state_4;
        // faq_state ++> faq_state_5;
        // ready to expand faq...
        // faq_state ++> faq_state_6;
        // faq_state ++> faq_state_7;
        // faq_state ++> faq_state_8;
        // faq_state ++> faq_state_9;
        // faq_state ++> faq_state_10;
        // Some people might have a lot of questions...
        // faq_state ++> faq_state_11;
    }
}

walker init {
    root {
        spawn here ++> node::models;
    }
}
