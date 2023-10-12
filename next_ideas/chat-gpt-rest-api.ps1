# Set your API key and endpoint
$apiKey = "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"
$endpoint = "https://api.openai.com/v1/chat/completions"

# Set the headers
$headers = @{
    "Authorization" = "Bearer $apiKey"
    "Content-Type" = "application/json"
}

# Set the data for the API request
$data = @{
    "messages" = @(
        @{
            "role" = "system"
            "content" = "You are a helpful assistant."
        },
        @{
            "role" = "user"
            "content" = "What's the weather like today?"
        }
    )
}

$jsonData = $data | ConvertTo-Json

$body = @{
    "model" = "gpt-3.5-turbo"
    "max_tokens" = 150
    "temperature" = 0.7
    "messages" = $jsonData
}

# Make the API request
$response = Invoke-RestMethod -Uri $endpoint -Method Post -Headers $headers -Body (ConvertTo-Json $body)

# Display the response
$response.choices[0].message.content
