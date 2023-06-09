# DIDEGGO, DAO - Digital Intelligence Decentralized Global Governance, Decentralized Autonomous Organization - 🚧 Work In Progress 🏗

<p align="left"> 
<img src="https://komarev.com/ghpvc/?username=dideggo&label=repo%20views&color=f79952&style=flat" alt="dideggo" /> 
<img alt="Stars" src="https://img.shields.io/github/stars/WrappedUsername/dideggo?style=flat-square&labelColor=343b41"/>
</p>

## I am 💯% for individual freedom and autonomy

- _Disclaimer_

This project is a voluntary technology demonstrator.
This project is intended to solve problems and provide guidance to established governing entities, in order to update current outdated governance models, to meet the new emerging AI global governance, geo-political economic model.

```yml
The problem:
```

- Beyond personal autonomy, humans are incapable of governing other humans impartially, full-stop no debate.

- Humans are far too easily corruptable, one only needs to take an honest look at history to see this truth.
  - That is not to say that _all_ persons in positions of power _will_ ultimately become corrupted, _but_...
- Do we really want to continue to risk the chance of people in positions of power to ultimately become corrupted?

<img width="250" height="250" align="left" src="https://user-images.githubusercontent.com/104662990/235253369-65eb40b3-ba6a-4f1b-a141-f32c7705f733.jpg"/>

- It's like we are rolling the dice and praying to RNGesus to keep us safe from corrupt people that seek positions of power, or from those that become corrupted after being seated in that position of power.
- Only _bat-shit_ crazy people continue to do the same thing over, and over, and over, and over, expecting different results.
- We no longer need representatives to travel to the seat of power to represent all of us (we the people), only to become corrupted by wealthy elites, we have technologies that transmit data over thousands of miles, near instantly.

```yml
The solution:
```

We the people no longer need representives to represent us we can represent ourselves, we can create proposals ourselves, and we all can vote on these proposals _ourselves autonomously,_ we have the technologies to do this right now!

- The decentralized AI global governance model, will receive votes (one vote, to one citizen, this removes centralized power and influence).
- Proposals will be created directly from the citizens (all on the ethereum blockchain for transparency), completely removing the points of failure of current outdated governing models used today: _the people in positions of power_.

  - By removing the source of corruption, (the few people in positions of power), that can and will most likey become corrupted from unsavory rich people.
  - This allows a society to self-govern with a incorruptible AI overseeing the process.
  - Keeping the autonomous governance model aligned with the country's consitutional framework.

- Ethereum smart contracts will control all governance treasuries to ensure the proper allocation of resources and funds, this will also provide further guard-rails against corruption.

## Technical Details

The structure of the progressive web app, will be in the form of a graph.

[reference: Jaseci Bible](https://github.com/Jaseci-Labs/jaseci/raw/main/support/bible/pdf/jaseci_bible.pdf)

```yml
Jaseci Graph described as a 7-tuple (N, E, C, s, t, cN , cE ), where:
```

```mermaid
---
title: 7-tuple (N, E, C, s, t, cN , cE) Jaseci Graph
---
classDiagram
  N --> E : s = maps the source node to an edge
  N --> E : t = maps the target node to an edge
  C <-- N : cN = maps the nodes to context
  C <-- E : cE = maps the edges to context
  class N{
    +the set of nodes in graph
  }
  class E{
    +the set of edges in graph
  }
  class C{
    +the set of all contexts
  }
```

- Nodes, edges, and walkers can all have abilities.
  - Abilities cannot interact outside of the context or local variables of the attached node, edge, or walker, and does not have a return.

An example of this would be a maintainer walker saving a user's id and last conversation state for continuing the conversation at a later time.

```yml
Saving state with a maintainer walker:
```

```typescript
can cleanup with talker entry{
    if (!vistor:hoping) {
       spawn *(global.node_conv_root_state) walker::maintainer(
            user_id = visitor.user_id,
            user_context = vistor.user_context,
            dialogue_context = vistor.dialogue_context,
            last_conv_state = vistor.state_for_continuing
            /// @dev Add ERC-4337 account abstractions or any other saved states, etc here.
       );
    }
}
```

- Creating mermaid diagrams as pseudocode:

```mermaid
---
title: The DIDEGGO Jaseci Graph
---
graph TD;
    node_root-->node_server
    node_root-->node_client
    node_client-->node_landing_page
    node_landing_page-->node_vote_page
    node_landing_page-->node_proposals_page
    node_server-->node_models
    node_server-->node_auth_citizens_dir
    node_models-->node_bi_enc
    node_models-->node_entity_extraction
    node_models-->node_embedding_cache
    node_models-->node_global-governance_state
    node_models-->node_vote_state
    node_vote_state-->node_vote_state_1
    node_vote_state-->node_vote_state_2
    node_vote_state-->node_vote_state_3
    node_vote_state-->node_vote_state_4
    node_vote_state-->node_vote_state_5
    node_models-->node_faq_state
    node_faq_state-->node_faq_state_1
    node_faq_state-->node_faq_state_2
    node_faq_state-->node_faq_state_3
    node_auth_citizens_dir-->node_user_data_1
    node_auth_citizens_dir-->node_user_data_2
    node_auth_citizens_dir-->node_user_data_3
    node_auth_citizens_dir<-->node_auth_citizens_dashboard
    node_vote_state_4-->node_auth_citizens_dashboard
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

- In jaseci 1.4 or later, creating an edge uses the syntax `++>` and referencing an edge uses `-->`.

- Starting the Redis server

```bash
sudo service redis-server restart
```

- Activating `.venv`

```bash
source .venv/bin/activate
```

- Training the bi-encoder model with the faq training data.

- Starting the Redis server

```bash
sudo service redis-server restart
```

```bash
actions load module jac_nlp.bi_enc
```

```bash
jac run bi_enc.jac -walk train -ctx '{"train_file": "vote_training_data.json"}'
```

```bash
jac run bi_enc.jac -walk infer -ctx "{\"labels\": [\"DIDEGGO Landing Page\", \"DIDEGGO Voting Page\", \"DIDEGGO Proposals Page\", \"DIDEGGO Citizens Dashboard\"]}"
```

- Save the model

```bash
jac run bi_enc.jac -walk save_model -ctx '{"model_path": "dialogue_intent_model"}'
```

- Load the model

```bash
jac run bi_enc.jac -walk load_model -ctx '{"model_path": "dialogue_intent_model"}'
```

- Running the Chatbot Example

```bash
jac run main.jac
```

This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).
