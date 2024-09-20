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

pfazure run create --flow azureml:458c9b6c-f7f2-43ab-956f-092f89856b2f --data data/prompt_input/eval-groundedness.jsonl \
--column-mapping question='${data.question}' context='${data.context}' answer='${data.answer}' \
--workspace-name dev01-ml --resource-group dev01 --name "eval-groundedness-"$run_name --stream

#pfazure run create --flow azureml:68463d01-c901-468b-833f-04fd96300511 --data data/prompt_input/eval-groundedness.jsonl \
#--column-mapping question='${data.question}' context='${data.context}' answer='${data.answer}' \
#--workspace-name dev01-ml --resource-group dev01 --name "eval-groundedness-"$run_name --stream

# evaluate the run eval-single-turn-metrics
pfazure run create --flow azureml:b7d10f50-d7d1-49d3-94a4-84a9c77cd789 --data data/prompt_input/eval-single-turn-metrics.jsonl \
--column-mapping question='${data.question}' context='${data.context}' answer='${data.answer}' ground_truth='${data.ground_truth}' \
--name "eval-single-turn-metrics-"$run_name --stream


# evaluate the run eval-perceived-intelligence
pfazure run create --flow azureml:716c7b97-66f5-4cd1-bafd-ff28cb5fcacc --data data/prompt_input/eval-perceived-intelligence.jsonl \
--column-mapping question='${data.question}' context='${data.context}' answer='${data.answer}' \
--name "eval-perceived-intelligence"$run_name --stream

# evaluate the run eval-qna-non-rag
pfazure run create --flow azureml:10e07953-77ca-4c82-bad1-d266713a6605 --data data/prompt_input/eval-qna-non-rag.jsonl \
--column-mapping question='${data.question}' context='${data.context}' answer='${data.answer}' ground_truth='${data.ground_truth}' \
--name "eval-qna-non-rag"$run_name --stream