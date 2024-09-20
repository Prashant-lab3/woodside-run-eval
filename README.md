# PDF QA Project

This project implements a PDF question-answering system using Azure Machine Learning.

## Setup

1. Clone the repository
2. Install dependencies: `pip install -r requirements.txt`
3. Set up Azure resources (ML workspace, Cognitive Search, OpenAI)
4. Update `config/azure_config.json` with your Azure details
5. Run tests: `python -m unittest discover tests`

Secrets Configuration
In this workflow, sensitive Azure credentials and configurations are managed using GitHub Secrets. The secrets used in the workflow should be added to the GitHub repository or organization. Below is the list of secrets required for this workflow:

AZURE_DEVOPS_CREDENTIALS:

The JSON object containing the service principal credentials required for authentication with Azure.
This should be stored as a GitHub secret and follows the format below:
json
Copy code
{
  "clientId": "<client-id>",
  "clientSecret": "<client-secret>",
  "subscriptionId": "<subscription-id>",
  "tenantId": "<tenant-id>"
}
AZURE_SUBSCRIPTION_ID:

Your Azure subscription ID.
This can be found in the Azure portal under Subscriptions.
AZURE_RESOURCE_GROUP:rg-aml

The name of the resource group that contains the Azure Machine Learning resources.
AZURE_ML_WORKSPACE: aml-workspace003


The name of your Azure Machine Learning Workspace where the prompt flow will be deployed.

Also, The following details needs to change in the promptflow template based on development.



AZURE_OPENAI_API_BASE: This contains the base URL for the Azure OpenAI service that is used to access OpenAI models.

For example - https://azwelopenaiprd001.openai.azure.com/

AZURE_OPENAI_API_KEY: The API key used to authenticate requests to Azure OpenAI. It should be stored securely as a secret.

AZURE_DEPLOYMENT_NAME :- Name of the deployment which is used for the Azure OpenAI. For example - wgpt4o

AZURE_OPENAI_EMBEDDING_DEPLOYMENT: This contains the deployment name for the OpenAI embeddings model that you're using within the Azure OpenAI service.

For example - text-embedding-ada-002

AZURE_SEARCH_ENDPOINT: This is the endpoint URL for your Azure Cognitive Search instance, used to interact with your search resources.

For Example:- https://azwel-search-prd-001.search.windows.net

AZURE_SEARCH_KEY: The API key to access Azure Cognitive Search services. This should be kept secret as it's sensitive information.

AZURE_SEARCH_INDEX_NAME: This is the name of the search index used in Azure Cognitive Search.

for example - hr