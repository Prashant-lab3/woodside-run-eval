# create a name for the run
run_name=run_$(date +%Y%m%d_%H%M%S)
echo "run name: $run_name"
# create the run
pf connection create --file src/connections/cognitive_search_connection.yaml
pf connection create --file src/connections/azure_open_ai_connection.yaml
pf run create -f promptflow/rag_job.yaml --name $run_name --stream
pf run show-details --name $run_name