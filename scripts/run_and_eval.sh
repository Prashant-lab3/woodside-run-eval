# create a name for the run
set -x
run_name=run_$(date +%Y%m%d_%H%M%S)
echo "run name: $run_name"
# create the run
#pfazure run create -f promptflow/rag_job.yaml --name $run_name --stream 01

#pfazure run create --flow azureml:3461e079-6aa8-480d-9dd6-0c98e7c2e038 --data data/prompt_input/questions.jsonl --column-mapping chat_history='${data.chat_history}' question='${data.question}' --workspace-name dev01-ml --resource-group dev01 --name $run_name --stream


# evaluate the run eval-groundedness
#pfazure run create --flow src/evaluation/eval-groundedness --data data/prompt_input/eval-groundedness.jsonl \
#--column-mapping question='${data.question}' context='${data.context}' answer='${run.outputs.output}' \
#--run $run_name --stream

pfazure run create --flow azureml:557ebd8e-a04c-4384-b7c1-90a3213bdab7 --data data/prompt_input/eval-groundedness.jsonl \
--column-mapping question='${data.question}' context='${data.context}' answer='${data.answer}' \
--workspace-name dev01-ml --resource-group dev01 --name "eval-groundedness-"$run_name --stream

#pfazure run create --flow azureml:68463d01-c901-468b-833f-04fd96300511 --data data/prompt_input/eval-groundedness.jsonl \
#--column-mapping question='${data.question}' context='${data.context}' answer='${data.answer}' \
#--workspace-name dev01-ml --resource-group dev01 --name "eval-groundedness-"$run_name --stream

# evaluate the run eval-single-turn-metrics
pfazure run create --flow azureml:68463d01-c901-468b-833f-04fd96300511 --data data/prompt_input/eval-single-turn-metrics.jsonl \
--column-mapping question='${data.question}' context='${data.context}' answer='${data.answer}' ground_truth='${data.ground_truth}' \
--name "eval-single-turn-metrics-"$run_name --stream


# evaluate the run eval-perceived-intelligence
pfazure run create --flow azureml:471c13f0-bdc3-4bab-a4d9-f296a36f5131 --data data/prompt_input/eval-perceived-intelligence.jsonl \
--column-mapping question='${data.question}' context='${data.context}' answer='${data.answer}' \
--name "eval-perceived-intelligence"$run_name --stream

# evaluate the run eval-qna-non-rag
pfazure run create --flow azureml:894d65d1-d89b-4111-a86d-5bfa1d06a416 --data data/prompt_input/eval-qna-non-rag.jsonl \
--column-mapping question='${data.question}' context='${data.context}' answer='${data.answer}' ground_truth='${data.ground_truth}' \
--name "eval-qna-non-rag"$run_name --stream