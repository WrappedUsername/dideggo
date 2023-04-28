# DIDEGGO - Digital Intelligence Decentralized Global Governance - 🚧 Work In Progress 🏗

```mermaid
---
title: Didefade Jaseci Graph
---
graph TD;
    node_root-->node_server
    node_root-->node_client
    node_client-->node_landing_page
    node_client-->node_vote_page
    node_client-->node_proposals_page
    node_server-->node_models
    node_server-->node_auth_citizen_dir
    node_models-->node_bi_enc
    node_models-->node_entity_extraction
    node_models-->node_embedding_cache
    node_models-->node_global-governance_state
    node_models-->node_vote_state
    node_vote_state-->node_vote_state_1
    node_vote_state-->node_vote_state_2
    node_vote_state-->node_vote_state_3
    node_models-->node_faq_state
    node_faq_state-->node_faq_state_1
    node_faq_state-->node_faq_state_2
    node_faq_state-->node_faq_state_3
    node_auth_citizen_dir-->node_user_data_1
    node_auth_citizen_dir-->node_user_data_2
    node_auth_citizen_dir-->node_user_data_3
    node_auth_citizen_dir<-->node_auth_citizen_dashboard
```

## Building main.jac file

- Converting the pseudocode into Jac programming language:

```typescript
// import the graph, kb file, and walkers.
import {*} with "./server/models/faq-state/faq_graph.jac";
import {*} with "./server/models/faq-state/ask.jac";
import {*} with "./server/models/faq-state/kb.jac";

/// @notice this walker is reponsible for starting the program.
walker init {
    root {
        server = spawn here ++> graph::faq;
        spawn here walker::ingest_faq(kb_file="main_faq.json");
        while (true){
            spawn here walker::ask;
        }
    }
}
```

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 15.2.0.
