chat() {
  url=$1
  key=$2
  model=$3
  query=$4

  curl -X POST $url/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $key" \
  -d "{ \
      \"model\": \"$model\", \
      \"messages\": [ \
          { \
              \"role\": \"user\", \
              \"content\": \"$query\" \
          } \
      ] \
  }" | jq
}

embed() {
  url=$1
  key=$2
  model=$3
  query=$4

  curl -X POST $url/embeddings \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $key" \
    -d "{ \
        \"model\": \"$model\", \
        \"input\": \"$query\" \
    }" | jq
}

list-models() {
  url=$1
  key=$2
  curl $url/models -H "Authorization: Bearer $key" | jq
}
