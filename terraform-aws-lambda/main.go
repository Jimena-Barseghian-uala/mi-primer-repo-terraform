package main

import (
	"context"
	"fmt"
	"github.com/aws/aws-lambda-go/lambda"
)

type MyEvent struct {
	id        string `json:"id"`
	FirstName string `json:"firstName"`
	LastName  string `json:"lastName"`
	Status    string `json:"status"`
}

type MyResponse struct {
	Message string `json:"Message:"`
}

func HandleRequest(ctx context.Context, event MyEvent) (MyResponse, error) {
	return MyResponse{Message: fmt.Sprintf("Create AWS Lambda from terraform - Hello %s %s! Status: %s", event.FirstName, event.LastName, event.Status)}, nil
}

func main() {
	lambda.Start(HandleRequest)
}
