# Q&A Evaluation: Coherence

The Q&A Coherence evaluation flow will evaluate the Q&A Retrieval Augmented Generation systems by leveraging the state-of-the-art Large Language Models (LLM) to measure the quality and safety of your responses. Utilizing GPT as the Language Model to assist with measurements aims to achieve a high agreement with human evaluations compared to traditional mathematical measurements.

## What you will learn

The Coherence evaluation flow allows you to assess and evaluate your model with the LLM-assisted Coherence metric.


**gpt_coherence**: Measures the quality of all sentences in a model's predicted answer and how they fit together naturally.


Coherence is scored on a scale of 1 to 5, with 1 being the worst and 5 being the best.

## Prerequisites

- Connection: Azure OpenAI or OpenAI connection.
- Data input: Evaluating the Coherence metric requires you to provide data inputs including a question and an answer. 

## Tools used in this flow
- LLM tool
- Python tool