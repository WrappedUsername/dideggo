# Errors that need to be fixed

```bash
User question > What is DIDEGGO and how does it work?
2023-05-03 19:33:24,515 - ERROR - rt_error: ask.jac:ask - line 9, col 22 - rule NAME - Some elements in set does not have answer
2023-05-03 19:33:28,388 - ERROR - rt_error: ask.jac:ask - line 9, col 22 - rule NAME - Some elements in set does not have answer
DIDEGGO Landing Page
DIDEGGO Landing Page
{
  "success": false,
  "report": [],
  "final_node": "urn:uuid:e24e85ba-e9a6-42e5-b760-17b8df0ec65a",
  "yielded": false,
  "errors": [
    "talk.jac:talk - line 14, col 0 - rule expr_list - Cannot execute bi_enc.infer - Not Found",
    "talk.jac:talk - line 15, col 9 - rule index_slice - Incompatible type for object None - NoneType, expecting [<class 'list'>, <class 'str'>, <class 'dict'>]",
    "talk.jac:talk - line 15, col 12 - rule index_slice - Incompatible type for object None - NoneType, expecting [<class 'list'>, <class 'str'>, <class 'dict'>]",
    "talk.jac:talk - line 15, col 25 - rule index_slice - Incompatible type for object None - NoneType, expecting [<class 'list'>, <class 'str'>, <class 'dict'>]",
    "talk.jac:talk - line 14, col 0 - rule expr_list - Cannot execute bi_enc.infer - Not Found",
    "talk.jac:talk - line 15, col 9 - rule index_slice - Incompatible type for object None - NoneType, expecting [<class 'list'>, <class 'str'>, <class 'dict'>]",
    "talk.jac:talk - line 15, col 12 - rule index_slice - Incompatible type for object None - NoneType, expecting [<class 'list'>, <class 'str'>, <class 'dict'>]",
    "talk.jac:talk - line 15, col 25 - rule index_slice - Incompatible type for object None - NoneType, expecting [<class 'list'>, <class 'str'>, <class 'dict'>]",
    "ask.jac:ask - line 9, col 22 - rule NAME - Some elements in set does not have answer",
    "ask.jac:ask - line 9, col 22 - rule NAME - Some elements in set does not have answer"
  ]
}
```

```bash
(venv) wrappedusername@Arrakis:~/dideggo$ jsctl -m
Jaseci 1.4.0.15
Starting Shell...
jaseci > actions load module jac_nlp.bi_enc
2023-05-03 19:45:02.684515: I tensorflow/core/platform/cpu_feature_guard.cc:182] This TensorFlow binary is optimized to use available CPU instructions in performance-critical operations.
To enable the following instructions: AVX2 FMA, in other operations, rebuild TensorFlow with the appropriate compiler flags.
2023-05-03 19:45:03.451617: W tensorflow/compiler/tf2tensorrt/utils/py_utils.cc:38] TF-TRT Warning: Could not find TensorRT
shared model created
{
  "success": true
}
jaseci > actions load module jac_nlp.use_qa
{
  "success": true
}
jaseci > jac run main.jac
shared model created
Using device for training ->  cpu
2023-05-03 19:45:43,021 - ERROR - rt_error: vote_graph.jac:blank - line 51, col 0 - rule connect - Variable not defined - node_voting_page
2023-05-03 19:45:43,021 - ERROR - rt_error: vote_graph.jac:blank - line 51, col 58 - rule expression - Incompatible type for object None - NoneType, expecting [<class 'jaseci.prim.node.Node'>, <class 'jaseci.jac.jac_set.JacSet'>]
2023-05-03 19:45:43,021 - ERROR - rt_error: vote_graph.jac:blank - line 51, col 0 - rule connect - 'NoneType' object has no attribute 'obj_list'
2023-05-03 19:45:43,022 - ERROR - rt_error: vote_graph.jac:blank - line 61, col 0 - rule connect - Variable not defined - node_proposals_page
2023-05-03 19:45:43,022 - ERROR - rt_error: vote_graph.jac:blank - line 61, col 58 - rule expression - Incompatible type for object None - NoneType, expecting [<class 'jaseci.prim.node.Node'>, <class 'jaseci.jac.jac_set.JacSet'>]
2023-05-03 19:45:43,022 - ERROR - rt_error: vote_graph.jac:blank - line 61, col 0 - rule connect - 'NoneType' object has no attribute 'obj_list'
2023-05-03 19:45:43,023 - ERROR - rt_error: vote_graph.jac:blank - line 67, col 0 - rule connect - Variable not defined - node_citizens_dashboard
2023-05-03 19:45:43,023 - ERROR - rt_error: vote_graph.jac:blank - line 67, col 58 - rule expression - Incompatible type for object None - NoneType, expecting [<class 'jaseci.prim.node.Node'>, <class 'jaseci.jac.jac_set.JacSet'>]
2023-05-03 19:45:43,023 - ERROR - rt_error: vote_graph.jac:blank - line 67, col 0 - rule connect - 'NoneType' object has no attribute 'obj_list'
2023-05-03 19:45:43,023 - ERROR - rt_error: vote_graph.jac:blank - line 73, col 0 - rule connect - Variable not defined - node_exit_app_page
2023-05-03 19:45:43,023 - ERROR - rt_error: vote_graph.jac:blank - line 73, col 58 - rule expression - Incompatible type for object None - NoneType, expecting [<class 'jaseci.prim.node.Node'>, <class 'jaseci.jac.jac_set.JacSet'>]
2023-05-03 19:45:43,023 - ERROR - rt_error: vote_graph.jac:blank - line 73, col 0 - rule connect - 'NoneType' object has no attribute 'obj_list'
User prompt > Voting Page
2023-05-03 19:46:16,383 - ERROR - rt_error: talk.jac:talk - line 14, col 0 - rule expr_list - Execption within action call bi_enc.infer! 
2023-05-03 19:46:16,383 - ERROR - rt_error: talk.jac:talk - line 14, col 0 - rule expr_list - Internal Exception: 
User question >
```
