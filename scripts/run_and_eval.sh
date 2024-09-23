# create a name for the run
set -x
run_name=run_$(date +%Y%m%d_%H%M%S)
echo "run name: $run_name"

# create the run
#pfazure run flow -f Woodside_Promptflow_RagQnA/flow.dag.yaml --name $run_name --stream 01


#pfazure run create --flow azureml:3461e079-6aa8-480d-9dd6-0c98e7c2e038 --data data/prompt_input/questions.jsonl --column-mapping chat_history='${data.chat_history}' question='${data.question}' --workspace-name dev01-ml --resource-group dev01 --name $run_name --stream

# evaluate the run eval-groundedness
#pfazure run create --flow src/evaluation/eval-groundedness --data data/prompt_input/eval-groundedness.jsonl \
#--column-mapping question='${data.question}' context='${data.context}' answer='${run.outputs.output}' \
#--run $run_name --stream

##create evaluation for Groundness 
pfazure run create --flow azureml:f7918996-180d-44bd-886c-9d79658bfd3e --data data/prompt_input/index_eval.jsonl \
--column-mapping question='${data.question}' context='${data.context}' answer='${data.answer}' \
--workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --name "eval-groundedness-"$run_name --stream

 # Show metrics
pfazure run show-metrics --name eval-groundedness-$run_name --workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --subscription 20dd0807-4bab-40e8-a83e-75a1f4548c29

# Show details
pfazure run show-details --name eval-groundedness-$run_name --workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --subscription 20dd0807-4bab-40e8-a83e-75a1f4548c29

# Visualize run
pfazure run visualize --name eval-groundedness-$run_name --workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --subscription 20dd0807-4bab-40e8-a83e-75a1f4548c29


##create evaluation for Fluency 
pfazure run create --flow azureml:1cd50ac1-701c-438c-bea5-eb2d87c19e88 --data data/prompt_input/index_eval.jsonl \
--column-mapping question='${data.question}' context='${data.context}' answer='${data.answer}' \
--workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --name "eval-fluency-"$run_name --stream

 # Show metrics
pfazure run show-metrics --name eval-fluency-$run_name --workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --subscription 20dd0807-4bab-40e8-a83e-75a1f4548c29

# Show details
pfazure run show-details --name eval-fluency-$run_name --workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --subscription 20dd0807-4bab-40e8-a83e-75a1f4548c29

# Visualize run
pfazure run visualize --name eval-fluency-$run_name --workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --subscription 20dd0807-4bab-40e8-a83e-75a1f4548c29


##create evaluation for Relevance 
pfazure run create --flow azureml:e4d75cb7-649e-47e3-8aff-2ade38be8c61 --data data/prompt_input/index_eval.jsonl \
--column-mapping question='${data.question}' context='${data.context}' answer='${data.answer}' \
--workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --name "eval-Relevance-"$run_name --stream

 # Show metrics
pfazure run show-metrics --name eval-Relevance-$run_name --workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --subscription 20dd0807-4bab-40e8-a83e-75a1f4548c29

# Show details
pfazure run show-details --name eval-Relevance-$run_name --workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --subscription 20dd0807-4bab-40e8-a83e-75a1f4548c29

# Visualize run
pfazure run visualize --name eval-Relevance-$run_name --workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --subscription 20dd0807-4bab-40e8-a83e-75a1f4548c29


##create evaluation for Coherence 
pfazure run create --flow azureml:d44c7f05-c6ab-448e-8007-0eb90ff4306f --data data/prompt_input/index_eval.jsonl \
--column-mapping question='${data.question}' context='${data.context}' answer='${data.answer}' \
--workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --name "eval-coherence-"$run_name --stream

 # Show metrics
pfazure run show-metrics --name eval-coherence-$run_name --workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --subscription 20dd0807-4bab-40e8-a83e-75a1f4548c29

# Show details
pfazure run show-details --name eval-coherence-$run_name --workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --subscription 20dd0807-4bab-40e8-a83e-75a1f4548c29

# Visualize run
pfazure run visualize --name eval-coherence-$run_name --workspace-name labmltest02 --resource-group LAB3GPTDEVRG01 --subscription 20dd0807-4bab-40e8-a83e-75a1f4548c29

