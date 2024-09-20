# QnA with Your Own Data Using Faiss Index

This is a flow demonstrating Q&A with GPT using information from vector search to make the answer more grounded. It involves embedding user's question with `LLM`, and then using `Faiss Index Lookup` to find relevant documents based on vectors. By utilizing vector search, users can incorporate their domain knowledge into the prompts, leading to more accurate and relevant answers. The flow then uses GPT to generate an answer to the question with the documents as augmented prompt.

## What you will learn

In this flow, you will learn:
- how to use `Faiss Index Lookup` tool to find relevant documents and leverage domain knowledge.

## Prerequisites

- Connection: Azure OpenAI or OpenAI connection.

## Tools used in this flow
- Embedding tool
- Faiss Index Lookup tool
- Python tool
- LLM tool